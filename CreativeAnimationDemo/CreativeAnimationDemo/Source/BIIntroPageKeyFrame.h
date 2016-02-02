//
//  BIIntroPageKeyFrame.h
//  GuidePageDemo
//
//  Created by AugustRush on 15/11/3.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BIInterpolation.h"

@interface BIIntroPageKeyFrame : NSObject

@property (nonatomic, strong) id to;
@property (nonatomic, assign) CGFloat keyTime;
@property (nonatomic, copy) BIInterpolation interpolation;

@property (nonatomic, strong) id from;
@property (nonatomic, copy) BIEasingCurve easing;
@property (nonatomic, assign) CGFloat startKeyTime;

- (id)valueForTimeOffset:(CGFloat)offset;

@end
