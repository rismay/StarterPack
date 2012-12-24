//
//  WSSettingsViewController.m
//  wrkstrm
//
//  Created by Cristian Monterroza on 1/29/12.
//  Copyright (c) 2012 Subprime Insight. All rights reserved.
//

//Self
#import "WSRearViewController.h"
//App Delegate
#import "SPAppDelegate.h"
//Syncpoint & CouchDB
#import <Security/SecRandom.h>

//Other View Controllers
#import "ZUUIRevealController.h"
//#import "WSMapViewController.h"
//#import "WSNotableMomentViewController.h"
//#import "WSRegionViewController.h"
//#import "WSStreamTableViewController.h"
//#import "WSModelTableViewController.h"
//#import "WSUserViewController.h"
//#import "WSDeviceMotionViewController.h"
//#import "WSLoginViewController.h"
//#import "MHPaperFoldViewController.h"
//Cells
//#import "SegmentControlCell.h"
//#import "EditableTableViewCell.h"
//#import "WrkstrmTableViewCell.h"
//#import "WSRefreshingCell.h"
//Data Models

@interface WSRearViewController ()

@property (strong, nonatomic) IBOutlet UIButton *buttonLoginLogout;
@property (strong, nonatomic) IBOutlet UITextView *textNoteOrLink;
@property (nonatomic, strong) SPAppDelegate *appDelegate;

- (IBAction)buttonClickHandler:(id)sender;

@end

@implementation WSRearViewController

@synthesize settingsTableView = _settingsTableView, optionsArray = _optionsArray, delegate = _delegate;
@synthesize currentUser = _currentUser, appDelegate = _appDelegate;

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		self.appDelegate = [[UIApplication sharedApplication]delegate];
		
		// Custom initialization aka:
		//self.navigationItem.title = @"Configure Sync";
		//UIBarButtonItem* purgeButton = [[UIBarButtonItem alloc] initWithTitle: @"Done" style:UIBarButtonItemStyleDone target: self action: @selector(done:)];
		//self.navigationItem.leftBarButtonItem = purgeButton;
	}
	return self;
}


#pragma mark - View lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void) viewDidAppear:(BOOL)animated {
	//NSLog(@"WSSVC:viewDidAppear:BEGIN the delegate is: %@",self.delegate);
	NSLog(@"WSSVC:viewDidAppear:END-- the optionsArray size is: %i",self.optionsArray.count);
}

#pragma mark - Memory Methods
- (void)didReceiveMemoryWarning{
	[super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	[super viewDidUnload];
}
@end