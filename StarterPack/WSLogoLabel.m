//
//  WSLogoLabel.m
//  Reminders Metro
//
//  Created by Cristian A Monterroza on 9/27/12.
//  Copyright (c) 2012 wrkstrm. All rights reserved.
//

#import "WSLogoLabel.h"
#import "CircleView.h"
#import "WSColorPalette.h"
#import "DDLog.h"

@interface WSLogoLabel ()

@property (nonatomic, strong) CircleView *leftCircle, *rightCircle;
@property float leftX, rightX;
@property CGPoint leftCenter, rightCenter;

@end

@implementation WSLogoLabel

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = [UIColor clearColor];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		self.backgroundColor = [UIColor clearColor];
	}
	return self;
}

//Works with a frame of w: 113 h:68 font size: 36
- (void) beginSmallAnimation {
	//DDLogVerbose(@"WSLoV:beginAnimation:MID00 logo lx = %f, rx = %f", self.frame.size.width, self.frame.size.height);
	float leftX = self.frame.origin.x - self.frame.size.height/5.1;
	float rightX = self.frame.origin.x + self.frame.size.width*(2/5.0);// + self.font.pointSize/3 - 4;
	//DDLogVerbose(@"WSLoV:beginAnimation:MID01 lx = %f, rx = %f", leftX, rightX);
	//DDLogVerbose(@"WSLoV:beginAnimation:MID02 Font size: %f, %f", self.font.pointSize,  self.font.pointSize/7.5);
	
	float circleSize = self.frame.size.height;
	CGRect leftCircleRect = CGRectMake(leftX, self.center.y - circleSize/2 + circleSize/13.6, circleSize, circleSize);
	CGRect rightCircleRect = CGRectMake(rightX, self.center.y - circleSize/2 + circleSize/13.6, circleSize, circleSize);
	self.leftCircle = [[CircleView alloc] initWithFrame:leftCircleRect withColor: [WSColorPalette colorGradient: kWSGradientLightBlue forCell:0]];
	self.leftCenter = self.leftCircle.center;
	self.rightCircle = [[CircleView alloc] initWithFrame:rightCircleRect withColor: [WSColorPalette colorGradient: kWSGradientGreen forCell:0]];
	self.rightCenter = self.rightCircle.center;
	[self.superview insertSubview:self.leftCircle belowSubview:self];
	[self.superview insertSubview:self.rightCircle aboveSubview:self.leftCircle];
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
	[UIView animateWithDuration:1 delay:0 options: UIViewAnimationOptionAutoreverse animations:^{
		self.leftCircle.transform = CGAffineTransformScale(self.leftCircle.transform, scale,scale);
		self.leftCircle.center = CGPointMake(self.leftCircle.center.x+self.leftCircle.center.x*(1-scale)/2, self.leftCircle.center.y);
		self.rightCircle.center = CGPointMake(self.rightCircle.center.x-self.rightCircle.center.x*(1-scale)/2.5, self.rightCircle.center.y);
		self.rightCircle.transform = CGAffineTransformScale(self.rightCircle.transform, scale, scale);
		self.transform = CGAffineTransformScale(self.transform, scale, scale);
	} completion:nil];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end