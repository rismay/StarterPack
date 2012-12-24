//  WSFrontViewController.h
//  wrkstrm

//  Created by Cristian Monterroza on 4/2/12.
//  Copyright (c) 2012 Subprime Insight. All rights reserved.
//

//Other View Controllers
#import "WSRearViewController.h"
#import "ZUUIRevealController.h"
#import <EventKit/EventKit.h>
//Data Models

@class ZUUIRevealController;

@protocol WSFrontViewDelegate <NSObject>
@required
- (void) loadOptionsArray;
@end

@interface WSFrontViewController : UIViewController <ZUUIRevealControllerDelegate, WSSettingsDelegate>

//Most important part!
@property (nonatomic, strong) id <WSFrontViewDelegate> optionsDelegate;

@property (nonatomic, strong) WSUser *currentUser;
//List of options you would like to set by the rearview
@property (nonatomic, strong) NSMutableArray *optionsArray;
@property int blockRetainCount;
//Parent Reveal Controller
@property (nonatomic, strong) ZUUIRevealController *revealController;


- (void) showNavigationController; 
- (void) hideNavigationController;
- (void) setupCustomGestureRecognizers;

- (void) loadOptionsArray;

@end