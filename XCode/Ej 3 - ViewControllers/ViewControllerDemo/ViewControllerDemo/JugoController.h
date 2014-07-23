//
//  JugoController.h
//  ViewControllerDemo
//
//  Created by Omar Gomez on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JugoController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSArray *_opcionesJugoArr;
}
@property (retain, nonatomic) IBOutlet UIPickerView *jugoPicker;
- (IBAction)postreAction:(id)sender;

@property (nonatomic, retain) NSArray *opcionesJugoArr;

@end
