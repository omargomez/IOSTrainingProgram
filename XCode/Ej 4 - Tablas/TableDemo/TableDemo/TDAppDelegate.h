//
//  TDAppDelegate.h
//  TableDemo
//
//  Created by Omar Gomez on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SharedApp \
((TDAppDelegate *)[UIApplication sharedApplication].delegate)


@interface TDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *sopaSel;
@property (strong, nonatomic) NSString *platoFuerteSel;
@property (strong, nonatomic) NSString *jugoSel;
@property (strong, nonatomic) NSString *postreSel;


@end
