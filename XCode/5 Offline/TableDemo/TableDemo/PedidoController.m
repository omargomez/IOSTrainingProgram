//
//  PedidoController.m
//  TableDemo
//
//  Created by Omar Gomez on 4/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PedidoController.h"
#import "TDAppDelegate.h"

@implementation PedidoController
@synthesize pedidoLabel;

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
    
    self.pedidoLabel.text = [NSString stringWithFormat:@"Sopa: %@ \nPlato fuerte: Arroz, Ensalada y %@ \nJugo: %@ \nPostre: %@", 
                             SharedApp.sopaSel,
                             SharedApp.platoFuerteSel,
                             SharedApp.jugoSel,
                             SharedApp.postreSel];
}

- (void)viewDidUnload
{
    [self setPedidoLabel:nil];
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
    [pedidoLabel release];
    [super dealloc];
}
@end
