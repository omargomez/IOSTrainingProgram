//
//  SopaController.m
//  TableDemo
//
//  Created by Omar Gomez on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SopaController.h"
#import "TDAppDelegate.h"

@interface SopaController()

@property (nonatomic, retain) NSArray *opcionesSopaArr;
@property (nonatomic, retain) NSMutableDictionary *imgDict;

@end


@implementation SopaController

@synthesize opcionesSopaArr = _opcionesSopaArr;
@synthesize imgDict = _imgDict;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        
        NSDictionary *data = [SharedApp getJSONWithUrl:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", WS_BASE_URL, @"data.json"]]];
        
        if (data == nil) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mensaje"
                                                            message:@"Error al cargar JSON"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            alert.tag = 101;
            [alert show];
            [alert release];
        }
        
        self.opcionesSopaArr = [data objectForKey:@"sopas"];
        self.imgDict = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)dealloc {
    self.opcionesSopaArr = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
	return [self.opcionesSopaArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    NSDictionary *entry = [self.opcionesSopaArr objectAtIndex:[indexPath row]];
	cell.textLabel.text = [entry objectForKey:@"titulo"];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", WS_BASE_URL, [entry objectForKey:@"img"]]];
    
    // La imagen ya fue cargada?
    int row = [indexPath row];
    NSNumber *rowNum = [NSNumber numberWithInt:row];
    UIImage *currentImg = [self.imgDict objectForKey:rowNum];
    if ( currentImg == nil) {
        cell.imageView.image = [UIImage imageNamed:@"placeholder.jpg"];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage *img = [SharedApp getImageWithUrl:url];
            if (!img) {
                return;
            }
            dispatch_sync(dispatch_get_main_queue(), ^{
                [self.imgDict setObject:img forKey:rowNum];
                [self.tableView beginUpdates];
                [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil]
                                      withRowAnimation:UITableViewRowAnimationNone];
                [self.tableView endUpdates];                            
            }); 
        });
       
    }
    else {
        // Asignar la imagen
        cell.imageView.image = currentImg;
    }
        
    return cell;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SharedApp.sopaSel = [[self.opcionesSopaArr objectAtIndex: [indexPath row] ] objectForKey:@"titulo"];    
    
    [self performSegueWithIdentifier:@"plato_fuerte_segue" sender:self];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 101) {
        exit(0);
    }
}


@end
