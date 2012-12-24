//
//  SPAppDelegate.h
//  StarterPack
//
//  Created by Cristian A Monterroza on 12/24/12.
//  Copyright (c) 2012 wrkstrm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDLog.h"

// Log levels: off, error, warn, info, verbose
static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@interface SPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (BOOL)application:(UIApplication *)application willBeginLaunchingWithViewController:(UIViewController *)viewController;

@end