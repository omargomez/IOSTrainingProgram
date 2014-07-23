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

#define WS_BASE_URL @"http://192.168.0.10:8000"

@interface TDAppDelegate : UIResponder <UIApplicationDelegate>

-(NSDictionary *) getData;
-(NSDictionary *) getJSONWithUrl:(NSURL *) url;
-(UIImage *) getImageWithUrl:(NSURL *) url;


@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *sopaSel;
@property (strong, nonatomic) NSString *platoFuerteSel;
@property (strong, nonatomic) NSString *jugoSel;
@property (strong, nonatomic) NSString *postreSel;


@end
