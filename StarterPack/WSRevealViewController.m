//
//  WSRevealViewController.m
//  StarterPack
//
//  Created by Cristian A Monterroza on 12/24/12.
//  Copyright (c) 2012 wrkstrm. All rights reserved.
//

#import "WSRevealViewController.h"
#import "SPAppDelegate.h"
#import "DDLog.h"

@interface WSRevealViewController ()

@property (strong, nonatomic) UIView *invisibleFrontView;

@property (nonatomic, strong) UIViewController *rearPresentedViewController;
@property (nonatomic, strong) UIViewController *frontPresentedController;

@end

@implementation WSRevealViewController

- (id) initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		[((SPAppDelegate *) [[UIApplication sharedApplication] delegate]) application: [UIApplication sharedApplication]
																						 willBeginLaunchingWithViewController:self];
		
		UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:MAIN_STORYBOARD_IPHONE bundle:nil];
		UINavigationController *tempRearController = (UINavigationController *) [storyBoard instantiateViewControllerWithIdentifier: NAVIGATION_CONTROLLER_REAR];
		tempRearController.delegate = self;
		self.rearViewController = (UIViewController *) tempRearController;
		self.rearPresentedViewController = self.rearViewController;
		NSLog(@"ZUUIRC:initWithCoder:MID01  Rear NavVC= %@, Rear PresVC= %@", self.rearViewController.debugDescription, self.rearPresentedViewController.debugDescription);
		//Get the front view and navigation controller
		UINavigationController *tempFrontController = (UINavigationController *) [storyBoard instantiateViewControllerWithIdentifier:NAVIGATION_CONTROLLER_FRONT];
		tempFrontController.delegate = self;
		self.frontViewController =   (UIViewController *) tempFrontController;
		self.frontPresentedController =   self.frontViewController;
		
		//Don't know why this has to go here but it does.
		UIPanGestureRecognizer *navigationPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(revealGesture:)];
		[tempFrontController.navigationBar addGestureRecognizer:navigationPanGesture];
		
		NSLog(@"ZUUIRC:initWithCoder:MID01 FNavVC = %@, FPresVC = %@", self.frontViewController.debugDescription,  self.frontPresentedController.debugDescription);
		
		[self loadDefaultConfiguration];
	}
	return self;
}

- (void) loadDefaultConfiguration {
	self.rearViewRevealWidth = 275.0f;
	self.maxRearViewRevealOverdraw = 60.0f;
	self.rearViewPresentationWidth = 320.0f;
	self.revealViewTriggerWidth = 125.0f;
	self.concealViewTriggerWidth = 200.0f;
	self.quickFlickVelocity = 1300.0f;
	self.toggleAnimationDuration = 0.25f;
	self.frontViewShadowRadius = 2.5f;
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
	//NSLog(@"ZUUIRC:navigationController:didShowViewController:animated:BEGIN The following navigation controller is delegating: %@", navigationController);
	if ([self.frontViewController isEqual: navigationController]){
		NSLog(@"ZUUIRC:navigationController:didShowViewController:animated:MID0- We can not load the FRONT VIEWS with the current controller info!");
		self.frontPresentedController = viewController;
		//Set the delegate!
		self.delegate = (id<ZUUIRevealControllerDelegate>) viewController;
		/*Reload the back view!
		 if ([self.rearViewController isMemberOfClass:[WSSettingsViewController class]]) {
		 WSSettingsViewController *settingsController = (WSSettingsViewController *)self.rearViewController;
		 settingsController.delegate = (id<WSSettingsDelegate>) self.frontViewController;
		 [settingsController.settingsTableView reloadData];
		 }
		 */
		NSLog(@"ZUUIRC:navigationController:didShowViewController:animated:END0- Are the Navigation and UIView controllers the same now? %i", [self.frontViewController isEqual:viewController]);
	} else if ([self.rearViewController isEqual: navigationController]) {
		NSLog(@"ZUUIRC:navigationController:didShowViewController:animated:MID0- Loading the FRONT controller and delegating reveal commands.");
		self.rearPresentedViewController = viewController;
		NSLog(@"ZUUIRC:navigationController:didShowViewController:animated:END1- Are the Navigation and UIView controllers the same now? %i", [self.rearViewController isEqual:viewController]);
	}
}

#pragma mark - Reveal

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
	NSLog(@"ZUUIRC:navigationController:willShowViewController:animated:BEGIN The following navigation controller is delegating: %@", navigationController);
	if ([self.frontViewController isEqual: navigationController]){
		//NSLog(@"ZUUIRC:navigationController:willShowViewController:animated:MID0- Loading the FRONT controller and delegating reveal commands.");
		self.frontPresentedController = viewController;
		self.delegate = (id<ZUUIRevealControllerDelegate>) viewController;
		/*Reload the back view!
		 if ([self.rearViewController isMemberOfClass:[WSSettingsViewController class]]) {
		 WSSettingsViewController *settingsController = (WSSettingsViewController *)self.rearViewController;
		 settingsController.delegate = (id<WSSettingsDelegate>) viewController;
		 [settingsController.settingsTableView reloadData];
		 }
		 */
		//NSLog(@"ZUUIRC:navigationController:willShowViewController:animated:END-- Are the Navigation and FRONT UIViewControllers the same now? %i", [self.frontNavigationController isEqual:viewController]);
	} else if ([self.rearViewController isEqual: navigationController]) {
		//NSLog(@"ZUUIRC:navigationController:willShowViewController:animated:MID1- Loading the BACK controller and delegating the settings!");
		//WSSettingsViewController *rearController = (WSSettingsViewController *) viewController;
		//rearController.delegate = (WSFrontViewController *) self.frontViewController;
		self.rearPresentedViewController = viewController;
		//NSLog(@"ZUUIRC:navigationController:willShowViewController:animated:END-- Are the Navigation and BACK UIViewControllers the same now? %i", [self.rearNavigationController isEqual:viewController]);
	}
}

- (void) setCurrentFrontViewPosition:(FrontViewPosition)currentFrontViewPosition {
	if (currentFrontViewPosition == FrontViewPositionLeft) {
		//NSLog(@"ZUUIRV:setCurrentFrontViewPosition:MID01 FrontPositionLeft -  Invisible Intercept OFF");
		self.invisibleFrontView.hidden = YES;
	} else {
		//NSLog(@"ZUUIRV:setCurrentFrontViewPosition:MID02 FrontPositionRight - Invisible Intercept ON");
		self.invisibleFrontView.hidden = NO;
	}
	[super setCurrentFrontViewPosition:currentFrontViewPosition];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
#if __has_feature(objc_arc)
	self.invisibleFrontView = [[UIView alloc] initWithFrame:self.view.bounds];
#else
	self.invisibleFrontView = [[[UIView alloc] initWithFrame:self.view.bounds] autorelease];
#endif
	
	//New on May 7, 2012
	self.invisibleFrontView.backgroundColor = [UIColor clearColor];
	self.invisibleFrontView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	UIPanGestureRecognizer *invisiblePanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(revealGesture:)];
	[self.invisibleFrontView addGestureRecognizer:invisiblePanGesture];

	//Custom Add
	[self.self.frontViewController.view insertSubview:self.invisibleFrontView aboveSubview:self.frontViewController.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
