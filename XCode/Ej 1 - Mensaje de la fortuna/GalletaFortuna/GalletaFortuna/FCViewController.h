//
//  FCViewController.h
//  GalletaFortuna
//
//  Created by Omar Gomez on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FCViewController : UIViewController
{
    IBOutlet UITextField *nombreTField;
    NSArray *mensajesArr;
}
- (IBAction)adivinarFortuna:(id)sender;

@end
