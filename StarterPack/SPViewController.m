//
//  SPViewController.m
//  StarterPack
//
//  Created by Cristian A Monterroza on 12/24/12.
//  Copyright (c) 2012 wrkstrm. All rights reserved.
//

#import "SPViewController.h"
#import "SPAppDelegate.h"

//Views and Controllers
#import "WSLogoLabel.h"

@interface SPViewController ()

@property (nonatomic, strong) IBOutlet WSLogoLabel *smallLabel;

@end

@implementation SPViewController

- (id) initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	
	DDLogVerbose(@"SHVC:viewDidLoad:MID01 Now we are getting ready for the good stuff!");
	
	if (self) {
		[((SPAppDelegate *) [[UIApplication sharedApplication] delegate]) application: [UIApplication sharedApplication]
		 willBeginLaunchingWithViewController:self];
		
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void) showNavigationController {
	DDLogVerbose(@"SHVC:showNavigationController:BEGIN NavigationController: %@",self.navigationController.debugDescription);
	self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
	self.navigationController.toolbar.barStyle = UIBarStyleBlackOpaque;
	[self.navigationController setNavigationBarHidden:NO animated:NO];
	[self.navigationController setToolbarHidden:NO animated:NO];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
