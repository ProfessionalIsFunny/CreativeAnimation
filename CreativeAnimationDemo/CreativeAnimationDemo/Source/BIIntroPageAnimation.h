//
//  BIIntroPageAnimation.h
//  GuidePageDemo
//
//  Created by AugustRush on 15/11/4.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIIntroPageAnimateProtocol.h"
#import "BIEasingCurveFunction.h"

typedef NS_ENUM(NSUInteger, BIIntroPageAnimationType) {
    //for UIView
    BIIntroPageAnimationTypeViewColor = 0,
    BIIntroPageAnimationTypeViewAlpha,
    //for constraint
    BIIntroPageAnimationTypeConstraint,
    //for CALayer
    BIIntroPageAnimationTypeLayerCornerRadius,
    BIIntroPageAnimationTypeLayerScale,
    BIIntroPageAnimationTypeLayerScaleX,
    BIIntroPageAnimationTypeLayerScaleY,
    BIIntroPageAnimationTypeLayerRotation,
    BIIntroPageAnimationTypeLayerRotationX,
    BIIntroPageAnimationTypeLayerRotationY,
    //for CAShapeLayer
    BIIntroPageAnimationTypeLayerStrokeEnd,
    BIIntroPageAnimationTypeLayerStrokeStart
};

NS_ASSUME_NONNULL_BEGIN

@interface BIIntroPageAnimation : NSObject<BIIntroPageAnimateProtocol,NSCopying>

- (instancetype)initWithAnimatedObject:(id)object type:(BIIntroPageAnimationType)type NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

@property (nonatomic, assign) CGFloat pageWidth;

- (void)addValue:(id)value forKeyTime:(CGFloat)keyTime;
- (void)addValue:(id)value forKeyTime:(CGFloat)keyTime easing:(BIEasingCurve)easing;
- (void)addValues:(NSArray *)values forKeyTimes:(NSArray<NSNumber *> *)keyTimes;

- (void)commit;

@end
NS_ASSUME_NONNULL_END