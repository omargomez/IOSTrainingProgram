//
//  TDAppDelegate.m
//  TableDemo
//
//  Created by Omar Gomez on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TDAppDelegate.h"
#import "utilities.h"

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

-(NSDictionary *) getData
{
    if (_data == nil) {
        NSError *err = nil;
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", WS_BASE_URL, @"data.json"]];
        NSString *strJSON = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&err];
        
        if ( err ) {
            return nil;
        }
        
        _data = [[NSJSONSerialization JSONObjectWithData:[strJSON dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&err] retain];
        
        if ( err ) {
            return nil;
        }
        
        
        NSLog(@"%@", _data);
        
    }
    return _data;
}

-(NSDictionary *) getJSONWithUrl:(NSURL *) url
{
    if (_data == nil) {
        
        NSURLRequest * urlRequest = [NSURLRequest requestWithURL:url];
        NSURLResponse * response = nil;
        NSError * error = nil;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:urlRequest
                                                     returningResponse:&response
                                                                 error:&error];
        
        if ( error ) {
            return nil;
        }
        
        _data = [[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error] retain];
        
        if ( error ) {
            return nil;
        }
        
        NSLog(@"%@", _data);
        
    }
    return _data;
}

-(UIImage *) getImageWithUrl:(NSURL *) url
{
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:url];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:urlRequest
                                                 returningResponse:&response
                                                             error:&error];
    
    if (error)
    {
        return nil;
    }
    
    UIImage *result
    = [UIImage imageWithData:responseData];
    NSLog(@"Image: %@", NSStringFromCGSize(result.size));
    return result;
    
}


@end
