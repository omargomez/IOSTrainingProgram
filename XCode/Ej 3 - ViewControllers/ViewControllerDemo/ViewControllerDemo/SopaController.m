//
//  SopaController.m
//  ViewControllerDemo
//
//  Created by Omar Gomez on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SopaController.h"
#import "VCAppDelegate.h"

@implementation SopaController

@synthesize sopaPicker = _sopaPicker;
@synthesize opcionesSopaArr=_opcionesSopaArr;

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.opcionesSopaArr = [[[NSArray alloc] initWithObjects:
                           @"De verduras", 
                           @"De guineo", 
                           @"Frijoles", 
                           nil ] autorelease];
    }
    return self;
}

- (void)dealloc {
    self.opcionesSopaArr = nil;
    [_sopaPicker release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewDidUnload
{
    [self setSopaPicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.opcionesSopaArr count];
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.opcionesSopaArr objectAtIndex:row];
}


//[[UIApplication sharedApplication].delegate myGlobalObject]

- (IBAction)accionPlatoFuerte:(id)sender {
    SharedApp.sopaSel =  [self.opcionesSopaArr objectAtIndex:  [self.sopaPicker selectedRowInComponent:0] ];
;
}

@end
