//
//  VCAppDelegate.h
//  ViewControllerDemo
//
//  Created by Omar Gomez on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SharedApp \
((VCAppDelegate *)[UIApplication sharedApplication].delegate)



@interface VCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *sopaSel;
@property (strong, nonatomic) NSString *platoFuerteSel;
@property (strong, nonatomic) NSString *jugoSel;
@property (strong, nonatomic) NSString *postreSel;

@end
