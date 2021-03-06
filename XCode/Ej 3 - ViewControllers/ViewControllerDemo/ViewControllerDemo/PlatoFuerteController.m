//
//  PlatoFuerteController.m
//  ViewControllerDemo
//
//  Created by Omar Gomez on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlatoFuerteController.h"
#import "VCAppDelegate.h"

@implementation PlatoFuerteController
@synthesize platoFuertePicker = _platoFuertePicker;



@synthesize opcionesPlatoFuerteArr=_opcionesPlatoFuerteArr;


- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.opcionesPlatoFuerteArr = [[[NSArray alloc] initWithObjects:
                                 @"Carne de res", 
                                 @"Pollo", 
                                 @"Chicharrón", 
                                 nil ] autorelease];

    }
    return self;
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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [self setPlatoFuertePicker:nil];
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
    return [self.opcionesPlatoFuerteArr count];
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.opcionesPlatoFuerteArr objectAtIndex:row];
}


- (IBAction)jugoAction:(id)sender {
    SharedApp.platoFuerteSel =  [self.opcionesPlatoFuerteArr objectAtIndex:  [self.platoFuertePicker selectedRowInComponent:0] ];
}

- (void)dealloc {
    [_platoFuertePicker release];
    [super dealloc];
}

@end
