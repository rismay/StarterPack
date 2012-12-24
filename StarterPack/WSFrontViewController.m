//
//  WSFrontViewController.m
//  wrkstrm
//
//  Created by Cristian Monterroza on 4/2/12.
//  Copyright (c) 2012 Subprime Insight. All rights reserved.
//

//#import "Testflight.h"
#import "WSFrontViewController.h"
#import "DDLog.h"

@interface WSFrontViewController ()
- (void) showNavigationController;
- (void) hideNavigationController;
- (void) setupCustomGestureRecognizers;
@end

@implementation WSFrontViewController

@synthesize revealController = _revealController, currentUser = _currentUser, optionsArray = _optionsArray, optionsDelegate = _optionsDelegate;

- (void)viewDidLoad {
	//DDLogVerbose(@"ZUUIFVC:viewDidLoad:BEGIN Setting the standard front view mechanisms.");
	[super viewDidLoad];
	[[self.navigationItem backBarButtonItem] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
																																		[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0], UITextAttributeTextColor,
																																		[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8], UITextAttributeTextShadowColor,
																																		[NSValue valueWithUIOffset:UIOffsetMake(0, -1)], UITextAttributeTextShadowOffset,
																																		[UIFont fontWithName:@"HelveticaNeue-Light" size:10.0], UITextAttributeFont,
																																		nil] forState:UIControlStateNormal];
	[self setupCustomGestureRecognizers];
	[self showNavigationController];
	NSLog(@"ZUUIFVC:viewDidLoad:END99 Finished setting the standard front view mechanisms.");
}

- (void) viewDidAppear:(BOOL)animated {
	//TFLog(@"WSFVC:viewDidApear:BEGIN");
	
	//[TestFlight passCheckpoint:[self.class description]];
}

#pragma mark - Gesture recognizer methods
- (void) setupCustomGestureRecognizers{
	//NSLog(@"WSFVC:setupCustomGestureRecognizers:BEGIN Setting the reveal Toggle.");
	self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self.navigationController.parentViewController action:@selector(revealToggle:)];
	//NSLog(@"WSFVC:setupCustomGestureRecognizers:BEGIN Done setting the reveal Toggle.");
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
	BOOL multipleGestures = NO;
	NSLog(@"WSFVC:gestureRecognizer:END-- shouldRecognizeSimultaneouslyWithGestureRecognizer: Are we performing multiple gestures at the same time? %i", multipleGestures);
	return multipleGestures;
}

- (void)revealController:(ZUUIRevealController *)revealController willRevealRearViewController:(UIViewController *)rearViewController{
	NSLog(@"WSFVC:revealController:willRevealRearViewController:BEGIN This is the rearView segue.");
	if ([rearViewController.presentedViewController isMemberOfClass:[WSRearViewController class]]){
		WSRearViewController *vc = (WSRearViewController *) rearViewController.presentedViewController;
		vc.delegate = self;
		[vc.settingsTableView reloadSections: [NSIndexSet indexSetWithIndex:1] withRowAnimation: UITableViewRowAnimationAutomatic];
		//NSLog(@"WSFVC:revealController:willRevealRearViewController:END0- We send over an optionsArray of size: %i", self.optionsArray.count);
	}
}

- (void)revealController:(ZUUIRevealController *)revealController didRevealRearViewController:(UIViewController *)rearViewController{
	//NSLog(@"WSFVC:revealController:didRevealRearViewController:BEGIN At least we get called!");
	if ([rearViewController.presentedViewController isMemberOfClass:[WSRearViewController class]]){
		//ZUUIRearViewController *vc = (ZUUIRearViewController *) rearViewController.presentedViewController;
		//vc.delegate = self;
		//[vc.settingsTableView reloadSections: [NSIndexSet indexSetWithIndex:1] withRowAnimation: UITableViewRowAnimationAutomatic];
	}
}

#pragma mark - Navigation Controller code!
- (void) showNavigationController {}

- (void) hideNavigationController {}

- (void) loadOptionsArray {
	//NSLog(@"WSFVC:loadOptionsArray:BEGIN Loading the options array.");
}

- (int) optionSectionSize {
	//NSLog(@"WSFVC:optionSectionSize:BEGIN Returning option section size.");
	return 1;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	NSLog(@"ZUUIFVC:prepareForSegue:sender:BEGIN segue identifier and sender: %@, %@",segue.identifier, sender);
	if ([[segue destinationViewController] isKindOfClass: [WSFrontViewController class]]) {
		WSFrontViewController *vc = [segue destinationViewController];
		vc.currentUser = self.currentUser;
	}
}

- (UITableViewCell *) settingsViewController:(WSRearViewController *)sender tableView:(UITableView *)tableView optionCellForRow:(NSIndexPath *)indexPath {
	//NSLog(@"WSFVC:settingsViewController:tableView:optionCellForRow:BEGIN Beginning to create a cell - arraySize: %i, rowPath: %i",self.optionsArray.count, indexPath.row);
	return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Default"];
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end