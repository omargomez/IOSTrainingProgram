//
//  ConfirmacionController.m
//  ViewControllerDemo
//
//  Created by Omar Gomez on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConfirmacionController.h"
#import "VCAppDelegate.h"

@implementation ConfirmacionController
@synthesize mensajeConfLabel;

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
    
    self.mensajeConfLabel.text = [NSString stringWithFormat:@"Sopa: %@\n"
                                  "Plato fuerte: Ensalada, arroz y %@\n"
                                  "Jugo: %@\n"
                                  "Postre: %@", 
                                  SharedApp.sopaSel, 
                                  SharedApp.platoFuerteSel,
                                  SharedApp.jugoSel,
                                  SharedApp.postreSel];
}

- (void)viewDidUnload
{
    [self setMensajeConfLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [mensajeConfLabel release];
    [super dealloc];
}
@end
