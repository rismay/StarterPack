//
//  WSLogoView.h
//  wrkstrm
//
//  Created by Cristian Monterroza on 4/25/12.
//  Copyright (c) 2012 Subprime Insight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleView.h"

@interface WSLogoView : UIView

@property (strong, nonatomic) IBOutlet UILabel *wrkstrmLogo;
@property (nonatomic, strong) CircleView *leftCircle, *rightCircle;
@property float leftX, rightX;
@property CGPoint leftCenter, rightCenter;

- (void) beginSmallAnimation;
- (void) beginLargeAnimation;

@end