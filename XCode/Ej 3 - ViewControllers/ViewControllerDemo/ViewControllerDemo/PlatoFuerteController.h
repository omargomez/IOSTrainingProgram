//
//  PlatoFuerteController.h
//  ViewControllerDemo
//
//  Created by Omar Gomez on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlatoFuerteController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSArray *_opcionesPlatoFuerteArr;
}
@property (retain, nonatomic) IBOutlet UIPickerView *platoFuertePicker;
- (IBAction)jugoAction:(id)sender;

@property (nonatomic, retain) NSArray *opcionesPlatoFuerteArr;

@end
