//
//  FCViewController.m
//  GalletaFortuna
//
//  Created by Omar Gomez on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FCViewController.h"

@implementation FCViewController

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
       mensajesArr = [[NSArray alloc] initWithObjects:@"Tenes un equipaje poco comun, para el exito, usualo apropiadamente.", 
       @"Te ríes ahora, espera a llegar a tu casa.", 
        @"La oportunidad golpea tu puerta, contesta mañana.", nil ];
        
        //iniciar generador de numeros randómicos
        srand(time(NULL)); 

    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [nombreTField release];
    nombreTField = nil;
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [nombreTField release];
    [mensajesArr release];
    [super dealloc];
}

- (IBAction)adivinarFortuna:(id)sender {
    
    [nombreTField resignFirstResponder];
    
    NSString *nombre = [nombreTField text];
    
    NSString *mensaje = [NSString stringWithFormat:@"%@, %@", 
                         nombre,
                         [mensajesArr objectAtIndex:(rand() % 3 )], nil];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mensaje" 
                                                    message:mensaje 
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];

    [alert show];
    [alert release];
    
}
@end
