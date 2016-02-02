//
//  BIIntroPageFilmStrip.h
//  GuidePageDemo
//
//  Created by AugustRush on 15/11/4.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIInterpolation.h"

@interface BIIntroPageFilmStrip : NSObject

- (instancetype)initWithOriginalValue:(id)originalValue interpolation:(BIInterpolation)interpolation;

- (instancetype)init NS_UNAVAILABLE;

- (void)setValue:(id)value forKeyTime:(CGFloat)keyTime;
- (void)setValue:(id)value forKeyTime:(CGFloat)keyTime easing:(BIEasingCurve)easing;

//use for prepared key frames data (a temple method)!
- (void)preparedKeyFramesForScrolling;

//get keyframe's value
- (id)valueForDuration:(CGFloat)duration;

@end
