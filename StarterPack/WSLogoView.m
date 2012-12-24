//
//  WSLogoView.m
//  wrkstrm
//
//  Created by Cristian Monterroza on 4/25/12.
//  Copyright (c) 2012 Subprime Insight. All rights reserved.
//

#import "WSLogoView.h"
#import "WSColorPalette.h"
#import "DDLog.h"
#import "SPAppDelegate.h"

@implementation WSLogoView

@synthesize wrkstrmLogo = _wrkstrmLogo;
@synthesize leftCircle = _leftCircle, rightCircle = _rightCircle;
@synthesize leftX = _leftX, rightX = _rightX, leftCenter = _leftCenter, rightCenter = _rightCenter;

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = [UIColor clearColor];
	}
	return self;
}

- (void) beginSmallAnimation {
	float scaleFactor = 1;
	//DDLogVerbose(@"WSLogo:beginAnimation:MID00 logo lx = %f, rx = %f", self.wrkstrmLogo.frame.size.width, self.wrkstrmLogo.frame.size.height);
	float leftX = -self.wrkstrmLogo.frame.size.width*2/11+3;
	float rightX = self.wrkstrmLogo.frame.size.width*4/11-3;
	//DDLogVerbose(@"WSLogo:beginAnimation:MID01 lx = %f, rx = %f", leftX, rightX);
	CGRect leftCircleRect = CGRectMake(leftX, self.wrkstrmLogo.center.y - self.wrkstrmLogo.frame.size.height*scaleFactor/2, self.wrkstrmLogo.frame.size.width*scaleFactor, self.wrkstrmLogo.frame.size.height*scaleFactor);
	CGRect rightCircleRect = CGRectMake(rightX, self.wrkstrmLogo.center.y - self.wrkstrmLogo.frame.size.height*scaleFactor/2, self.wrkstrmLogo.frame.size.width*scaleFactor, self.wrkstrmLogo.frame.size.height*scaleFactor);
	self.leftCircle = [[CircleView alloc] initWithFrame:leftCircleRect withColor: [WSColorPalette colorGradient: kWSGradientLightBlue forCell:0]];
	self.leftCenter = self.leftCircle.center;
	self.rightCircle = [[CircleView alloc] initWithFrame:rightCircleRect withColor: [WSColorPalette colorGradient: kWSGradientGreen forCell:0]];
	self.rightCenter = self.rightCircle.center;
	[self insertSubview:self.leftCircle belowSubview:self.wrkstrmLogo];
	[self insertSubview:self.rightCircle aboveSubview:self.leftCircle];
	float scale = .01;
	self.leftCircle.transform = CGAffineTransformScale(self.leftCircle.transform, scale, scale);
	self.rightCircle.transform = CGAffineTransformScale(self.rightCircle.transform, scale, scale);
	
	[UIView animateWithDuration:0.25 animations:^{
		self.leftCircle.transform = CGAffineTransformScale(self.leftCircle.transform, 1/scale, 1/scale);
		self.rightCircle.transform = CGAffineTransformScale(self.rightCircle.transform, 1/scale, 1/scale);
	} completion:^(BOOL finished) {
		[self pulseLogo];
	}];
}

- (void) beginLargeAnimation {
	float scaleFactor = 2.25;
	DDLogVerbose(@"WSLogo:beginAnimation:MID00 logo lx = %f, rx = %f", self.wrkstrmLogo.frame.size.width, self.wrkstrmLogo.frame.size.height);
	float leftX = -self.wrkstrmLogo.frame.size.width*9/11-1;
	float rightX = -self.wrkstrmLogo.frame.size.width*5/12+1;
	DDLogVerbose(@"WSLogo:beginAnimation:MID01 lx = %f, rx = %f", leftX, rightX);
	CGRect leftCircleRect = CGRectMake(leftX, self.wrkstrmLogo.center.y - self.wrkstrmLogo.frame.size.height*scaleFactor/2, self.wrkstrmLogo.frame.size.width*scaleFactor, self.wrkstrmLogo.frame.size.height*scaleFactor);
	CGRect rightCircleRect = CGRectMake(rightX, self.wrkstrmLogo.center.y - self.wrkstrmLogo.frame.size.height*scaleFactor/2, self.wrkstrmLogo.frame.size.width*scaleFactor, self.wrkstrmLogo.frame.size.height*scaleFactor);
	self.leftCircle = [[CircleView alloc] initWithFrame:leftCircleRect withColor: [WSColorPalette colorGradient: kWSGradientLightBlue forCell:0]];
	self.leftCenter = self.leftCircle.center;
	self.rightCircle = [[CircleView alloc] initWithFrame:rightCircleRect withColor: [WSColorPalette colorGradient: kWSGradientGreen forCell:0]];
	self.rightCenter = self.rightCircle.center;
	[self insertSubview:self.leftCircle belowSubview:self.wrkstrmLogo];
	[self insertSubview:self.rightCircle aboveSubview:self.leftCircle];
	float scale = .01;
	self.leftCircle.transform = CGAffineTransformScale(self.leftCircle.transform, scale, scale);
	self.rightCircle.transform = CGAffineTransformScale(self.rightCircle.transform, scale, scale);
	
	[UIView animateWithDuration:0.25 animations:^{
		self.leftCircle.transform = CGAffineTransformScale(self.leftCircle.transform, 1/scale, 1/scale);
		self.rightCircle.transform = CGAffineTransformScale(self.rightCircle.transform, 1/scale, 1/scale);
	} completion:^(BOOL finished) {
		[self pulseLogo];
	}];
}

- (void) pulseLogo {
	float scale = .9;
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
		self.leftCircle.transform = CGAffineTransformScale(self.leftCircle.transform, scale,scale);
		self.leftCircle.center = CGPointMake(self.leftCircle.center.x+self.leftCircle.center.x*(1-scale)/2, self.leftCircle.center.y);
		self.rightCircle.center = CGPointMake(self.rightCircle.center.x-self.rightCircle.center.x*(1-scale)/2.5, self.rightCircle.center.y);
		self.rightCircle.transform = CGAffineTransformScale(self.rightCircle.transform, scale, scale);
		self.wrkstrmLogo.transform = CGAffineTransformScale(self.wrkstrmLogo.transform, scale, scale);
	} completion:nil];
}
@end