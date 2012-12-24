//
//  SPAppDelegate.h
//  StarterPack
//
//  Created by Cristian A Monterroza on 12/24/12.
//  Copyright (c) 2012 wrkstrm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (BOOL)application:(UIApplication *)application willBeginLaunchingWithViewController:(UIViewController *)viewController;

@end