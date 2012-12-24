//
//  CircleView.m
//  wrkstrm
//
//  Created by Cristian Monterroza on 4/4/12.
//  Copyright (c) 2012 Subprime Insight. All rights reserved.
//

#import "CircleView.h"
#import "DDLog.h"

@implementation CircleView

@synthesize circleColor = _circleColor;

- (id)initWithFrame:(CGRect)frame withColor: (UIColor *) color{
	//DDLogVerbose(@"CV:initWithFrame:BEGIN Frame size: %f, %f", frame.size.height, frame.size.width);
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = [UIColor clearColor];
		self.circleColor = color;
	}
	return self;
}

- (void)drawCircle:(CGPoint)p withRadius:(CGFloat)radius inContext:(CGContextRef)context {
	UIGraphicsPushContext(context);
	CGContextBeginPath(context);
	CGContextAddArc(context, p.x, p.y, radius, 0, 2*M_PI, YES);
	CGContextFillPath(context);
	UIGraphicsPopContext();
}

- (void)drawRect:(CGRect)rect {
	CGPoint point;
	point.x = self.bounds.origin.x + self.bounds.size.width/2;
	point.y = self.bounds.origin.y + self.bounds.size.height/2;
	
	CGFloat size = self.bounds.size.width / 2;
	if (self.bounds.size.height < self.bounds.size.width) size = self.bounds.size.height / 2;
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetLineWidth(context, 5.0);
	[self.circleColor setFill];
	[self drawCircle:point withRadius:size inContext:context];
}

@end