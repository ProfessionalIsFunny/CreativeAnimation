


//
//  BIIntroPageAnimation.m
//  GuidePageDemo
//
//  Created by AugustRush on 15/11/4.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "BIIntroPageAnimation.h"
#import "BIIntroPageFilmStrip.h"
#import "BIIntroPageAnimator.h"

NSString * const BIIntroPageAnimateKeyPath[] = {
    [BIIntroPageAnimationTypeViewColor] = @"backgroundColor",
    [BIIntroPageAnimationTypeConstraint] = @"constant",
    [BIIntroPageAnimationTypeViewAlpha] = @"alpha",
    [BIIntroPageAnimationTypeLayerScale] = @"transform.scale",
    [BIIntroPageAnimationTypeLayerScaleX] = @"transform.scale.x",
    [BIIntroPageAnimationTypeLayerScaleY] = @"transform.scale.y",
    [BIIntroPageAnimationTypeLayerRotation] = @"transform.rotation",
    [BIIntroPageAnimationTypeLayerRotationX] = @"transform.rotation.x",
    [BIIntroPageAnimationTypeLayerRotationY] = @"transform.rotation.y",
    [BIIntroPageAnimationTypeLayerCornerRadius] = @"cornerRadius",
    [BIIntroPageAnimationTypeLayerStrokeEnd] = @"strokeEnd",
    [BIIntroPageAnimationTypeLayerStrokeStart] = @"strokeStart",
};

@interface BIIntroPageAnimation ()

@property (nonatomic, weak) id object;
@property (nonatomic, copy) NSString *keyPath;
@property (nonatomic, assign) BIIntroPageAnimationType animationType;
@property (nonatomic, strong) BIIntroPageFilmStrip *filmStrip;

@end

@implementation BIIntroPageAnimation

- (instancetype)initWithAnimatedObject:(id)object type:(BIIntroPageAnimationType)type {
    self = [super init];
    if (self) {
        _pageWidth = [UIScreen mainScreen].bounds.size.width;
        _object = object;
        _animationType = type;
        _keyPath = BIIntroPageAnimateKeyPath[type];
        id originalValue = [object valueForKeyPath:_keyPath];
        BIInterpolation interpolation = [self interpolationWithType:type];
        _filmStrip = [[BIIntroPageFilmStrip alloc] initWithOriginalValue:originalValue interpolation:interpolation];
    }
    return self;
}

- (void)addValue:(id)value forKeyTime:(CGFloat)keyTime {
    [self.filmStrip setValue:value forKeyTime:keyTime];
}

- (void)addValue:(id)value forKeyTime:(CGFloat)keyTime easing:(BIEasingCurve)easing {
    [self.filmStrip setValue:value forKeyTime:keyTime easing:easing];
}

- (void)addValues:(NSArray *)values forKeyTimes:(NSArray<NSNumber *> *)keyTimes {
    NSAssert(values.count == keyTimes.count, @"values's count should be equal to keyTimes's count!");
    for (NSUInteger i = 0; i < keyTimes.count; i++) {
        [self addValue:values[i] forKeyTime:keyTimes[i].floatValue];
    }
}

#pragma mark - private methods

- (BIInterpolation)interpolationWithType:(BIIntroPageAnimationType)type {
    switch (type) {
        case BIIntroPageAnimationTypeViewColor: {
            return BIViewColorInterpolation;
            break;
        }
        case BIIntroPageAnimationTypeLayerCornerRadius:
        case BIIntroPageAnimationTypeViewAlpha:
        case BIIntroPageAnimationTypeLayerScale:
        case BIIntroPageAnimationTypeLayerScaleX:
        case BIIntroPageAnimationTypeLayerScaleY:
        case BIIntroPageAnimationTypeLayerRotation:
        case BIIntroPageAnimationTypeLayerRotationX:
        case BIIntroPageAnimationTypeLayerRotationY:
        case BIIntroPageAnimationTypeLayerStrokeStart:
        case BIIntroPageAnimationTypeLayerStrokeEnd:
        case BIIntroPageAnimationTypeConstraint: {
            return BINumberInterpolation;
            break;
        }
        default: {
            NSAssert(0, @"animation type should be contained in BIIntroPageAnimationType enum!");
            return nil;
            break;
        }
    }
}

#pragma mark - BIIntroPageAnimateProtocol methods

- (void)animateForOffset:(CGFloat)offset {
    CGFloat duration = offset/_pageWidth;
    
    id value = [self.filmStrip valueForDuration:duration];
    [self.object setValue:value forKeyPath:self.keyPath];
}

- (void)preparedKeyFramesForScrolling {
    [self.filmStrip preparedKeyFramesForScrolling];
}

-(void)commit {
    [[BIIntroPageAnimator shareAnimator] addAnimation:self];
}

#pragma mark - NSCopying methods

- (id)copyWithZone:(NSZone *)zone {
    BIIntroPageAnimation *copy = [BIIntroPageAnimation allocWithZone:zone];
    copy.pageWidth = _pageWidth;
    copy.object = _object;
    copy.keyPath = _keyPath;
    copy.filmStrip = _filmStrip;
    return copy;
}

@end
