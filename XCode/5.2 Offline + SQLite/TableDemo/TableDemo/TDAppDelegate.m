//
//  TDAppDelegate.m
//  TableDemo
//
//  Created by Omar Gomez on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TDAppDelegate.h"
#import "utilities.h"
#import <sqlite3.h>

@interface TDAppDelegate ()

@property (strong) NSString *databasePath;
@property (nonatomic) sqlite3 *menuDB;

-(void) initDB;
-(void) poblarDB;

@end

@implementation TDAppDelegate

@synthesize window = _window;
@synthesize sopaSel = _sopaSel;
@synthesize platoFuerteSel = _platoFuerteSel;
@synthesize jugoSel = _jugoSel;
@synthesize postreSel = _postreSel;

static NSDictionary *_data = nil;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    [self initDB];
    [self poblarDB];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

-(void) initDB
{
    // se crea la base de datos si no existe
    NSString *docsDir;
    NSArray *dirPaths;
    
    self.dbOK = YES;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    // Build the path to the database file
    //self.databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"contacts.db"]];
    self.databasePath = [docsDir stringByAppendingPathComponent:@"menu.db"];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: self.databasePath ] == NO)
    {
        const char *dbpath = [self.databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &_menuDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt =
            "CREATE TABLE IF NOT EXISTS MENU (ID INTEGER PRIMARY KEY AUTOINCREMENT, TIPO TEXT, NOMBRE TEXT, IMG_DATA BLOB)";
            
            if (sqlite3_exec(_menuDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                self.dbOK = NO;
            }
            sqlite3_close(_menuDB);
            self.dbOK = YES;
        } else {
            self.dbOK = NO;
        }
    }
    
}

-(void) poblarDB
{
    // Llena la base de datos...
    
    // mirar si ya existen registros
    const char *dbpath = [self.databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_menuDB) != SQLITE_OK)
    {
        self.dbOK = NO;
        return;
    }
    
    { // count
        const char* sqlStatement = "SELECT COUNT(*) FROM MENU";
        sqlite3_stmt *statement;
        
        int count = -1;
        if( sqlite3_prepare_v2(_menuDB, sqlStatement, -1, &statement, NULL) == SQLITE_OK )
        {
            //Loop through all the returned rows (should be just one)
            while( sqlite3_step(statement) == SQLITE_ROW )
            {
                count = sqlite3_column_int(statement, 0);
            }
        }
        else
        {
            self.dbOK = NO;
        }
        
        // Finalize and close database.
        sqlite3_finalize(statement);
        
        if (count > 0) {
            sqlite3_close(_menuDB);
            return;
        }
    }
    
    NSError *err = nil;
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", WS_BASE_URL, @"data.json"]];
    NSString *strJSON = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&err];
    
    if ( err ) {
        self.dbOK = NO;
        sqlite3_close(_menuDB);
        return;
    }
    
    NSDictionary *data = [[NSJSONSerialization JSONObjectWithData:[strJSON dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&err] retain];
    
    if ( err ) {
        self.dbOK = NO;
        sqlite3_close(_menuDB);
        return;
    }
    
    // se guardan los JSON ...
    for (NSString* tipo in data) {
        NSArray *tipoArr = [data objectForKey:tipo];
        
        for (NSDictionary *item in tipoArr) {
            NSString *nombre = [item objectForKey:@"titulo"];
            NSString *nombreImg = [item objectForKey:@"img"];
            
            NSData *imgData = nil;
            if (nombreImg != nil) {
                // cargar data imagen
                NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", WS_BASE_URL, nombreImg ]];
                imgData = [NSData dataWithContentsOfURL:url];
            }
            
            // Ahora si llega el insert...
            //NSLog(@"%@ %@ %@", tipo, nombre, imgData);
            
            // insertar el registro
            {
                
                sqlite3_stmt    *statement;
                const char *insert_stmt = "INSERT INTO MENU (TIPO, NOMBRE, IMG_DATA) VALUES ( ?, ?, ?)";
                sqlite3_prepare_v2(_menuDB, insert_stmt, -1, &statement, NULL);
                sqlite3_bind_text(statement, 1, [tipo UTF8String], -1, SQLITE_STATIC);
                sqlite3_bind_text(statement, 2, [nombre UTF8String], -1, SQLITE_STATIC);
                if (imgData) {
                    sqlite3_bind_blob(statement, 3, [imgData bytes], [imgData length], SQLITE_TRANSIENT);
                }
                else {
                    sqlite3_bind_null(statement, 3);
                }
                if (sqlite3_step(statement) == SQLITE_DONE)
                {
                    NSLog(@"OK");
                } else {
                    NSLog(@"FAIL");
                    ; // Ignore errorss
                }
                sqlite3_finalize(statement);
            }
            
        }
    }
    sqlite3_close(_menuDB);
    
    
}

-(NSArray *) getNombresParaTipo:(NSString *) tipo
{
    const char *dbpath = [self.databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_menuDB) != SQLITE_OK)
    {
        self.dbOK = NO;
        return nil;
    }
    
 // count
    NSMutableArray *result = [NSMutableArray array];
    char *str;
    NSString *strStament = [NSString stringWithFormat:@"SELECT NOMBRE FROM MENU WHERE TIPO = \"%@\"", tipo];
    const char* sqlStatement = [strStament UTF8String];
    sqlite3_stmt *statement;
    
    if( sqlite3_prepare_v2(_menuDB, sqlStatement, -1, &statement, &str) == SQLITE_OK )
    {
        while( sqlite3_step(statement) == SQLITE_ROW )
        {
            const char *nombre = sqlite3_column_text(statement, 0);
            [result addObject:[NSString stringWithUTF8String:nombre]];
        }
    }
    else
    {
        self.dbOK = NO;
    }
    
    // Finalize and close database.
    sqlite3_finalize(statement);
    
    sqlite3_close(_menuDB);
    return result;
}

-(NSArray *) idsParaTipo:(NSString *) tipo
{
    const char *dbpath = [self.databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_menuDB) != SQLITE_OK)
    {
        self.dbOK = NO;
        return nil;
    }
    
 // count
    NSMutableArray *result = [NSMutableArray array];
    char *str;
    NSString *strStament = [NSString stringWithFormat:@"SELECT ID FROM MENU WHERE TIPO = \"%@\"", tipo];
    const char* sqlStatement = [strStament UTF8String];
    sqlite3_stmt *statement;
    
    if( sqlite3_prepare_v2(_menuDB, sqlStatement, -1, &statement, &str) == SQLITE_OK )
    {
        while( sqlite3_step(statement) == SQLITE_ROW )
        {
            const char *nombre = sqlite3_column_text(statement, 0);
            [result addObject:[NSString stringWithUTF8String:nombre]];
        }
    }
    else
    {
        self.dbOK = NO;
    }
    
    // Finalize and close database.
    sqlite3_finalize(statement);
    
    sqlite3_close(_menuDB);
    return result;
}


-(NSData *) imgDataParaId:(NSString *) anId
{
    const char *dbpath = [self.databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_menuDB) != SQLITE_OK)
    {
        self.dbOK = NO;
        return nil;
    }
    
 // count
    NSData *result = nil;
    char *str;
    NSString *strStament = [NSString stringWithFormat:@"SELECT IMG_DATA FROM MENU WHERE ID = %@", anId];
    const char* sqlStatement = [strStament UTF8String];
    sqlite3_stmt *statement;
    
    if( sqlite3_prepare_v2(_menuDB, sqlStatement, -1, &statement, &str) == SQLITE_OK )
    {
        while( sqlite3_step(statement) == SQLITE_ROW )
        {
            const void *bytes = sqlite3_column_blob(statement, 0);
            int size = sqlite3_column_bytes(statement, 0);
            result = [NSData dataWithBytes:bytes length:size];
        }
    }
    else
    {
        self.dbOK = NO;
    }
    
    // Finalize and close database.
    sqlite3_finalize(statement);
    
    sqlite3_close(_menuDB);
    return result;
}

@end
