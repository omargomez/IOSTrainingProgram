//
//  SopaController.h
//  ViewControllerDemo
//
//  Created by Omar Gomez on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SopaController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSArray *_opcionesSopaArr;
}

@property (retain, nonatomic) IBOutlet UIPickerView *sopaPicker;
@property (nonatomic, retain) NSArray *opcionesSopaArr;

- (IBAction)accionPlatoFuerte:(id)sender;
@end
