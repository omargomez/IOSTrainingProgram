//
//  PostreController.h
//  ViewControllerDemo
//
//  Created by Omar Gomez on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostreController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
    //NSArray *_opcionesPostreArr;
}
@property (retain, nonatomic) IBOutlet UIPickerView *postrePicker;

@property (nonatomic, retain) NSArray *opcionesPostreArr;
- (IBAction)confirmarAction:(id)sender;

@end
