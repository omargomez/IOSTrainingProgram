//
//  DVViewController.h
//  DemoVistas
//
//  Created by Omar Gomez on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoVista.h"

@interface DVViewController : UIViewController

@property (retain, nonatomic) IBOutlet DemoVista *vista;
- (IBAction)accionSiguiente:(id)sender;
@end
