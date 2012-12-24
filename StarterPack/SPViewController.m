//
//  SPViewController.m
//  StarterPack
//
//  Created by Cristian A Monterroza on 12/24/12.
//  Copyright (c) 2012 wrkstrm. All rights reserved.
//

#import "SPViewController.h"
#import "SPAppDelegate.h"

@interface SPViewController ()

@end

@implementation SPViewController

- (id) initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
