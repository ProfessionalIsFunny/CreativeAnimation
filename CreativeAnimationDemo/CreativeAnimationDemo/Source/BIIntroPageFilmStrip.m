//
//  BIIntroPageFilmStrip.m
//  GuidePageDemo
//
//  Created by AugustRush on 15/11/4.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "BIIntroPageFilmStrip.h"
#import "BIIntroPageKeyFrame.h"

@interface BIIntroPageFilmStrip ()

@property (nonatomic, strong) id originalValue;
@property (nonatomic, copy) BIInterpolation interpolation;
@property (nonatomic, strong) NSMutableArray<BIIntroPageKeyFrame *> *keyFrames;
@property (nonatomic, strong) NSMutableSet<NSNumber *> *keyTimes;

@end

@implementation BIIntroPageFilmStrip

#pragma mark - init methods

- (instancetype)initWithOriginalValue:(id)originalValue interpolation:(BIInterpolation)interpolation {
    self = [super init];
    if (self) {
        _originalValue = originalValue;
        _keyFrames = [NSMutableArray array];
        _keyTimes = [NSMutableSet set];
        _interpolation = [interpolation copy];
    }
    return self;
}

#pragma mark - private methods

- (BIIntroPageKeyFrame *)keyFrameForTimeOffset:(CGFloat)offset {
    BIIntroPageKeyFrame *frame = [self.keyFrames lastObject];
    for (NSUInteger i = 0; i < self.keyFrames.count; i++) {
        BIIntroPageKeyFrame *curFrame = self.keyFrames[i];
        if (curFrame.keyTime > offset) {
            frame = curFrame;
            break;
        }
    }
    return frame;
}

- (void)preparedKeyFramesForScrolling {
    NSArray *sorted = [self.keyFrames sortedArrayUsingComparator:^NSComparisonResult(BIIntroPageKeyFrame * _Nonnull obj1, BIIntroPageKeyFrame *  _Nonnull obj2) {
        return (obj1.keyTime > obj2.keyTime);
    }];
    [self.keyFrames removeAllObjects];
    [self.keyFrames addObjectsFromArray:sorted];
    [self.keyFrames enumerateObjectsUsingBlock:^(BIIntroPageKeyFrame * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            obj.startKeyTime = 0.0;
            obj.from = _originalValue;
        }else{
            BIIntroPageKeyFrame *prevFrame = self.keyFrames[idx - 1];
            obj.startKeyTime = prevFrame.keyTime;
            obj.from = prevFrame.to;
        }
    }];
}

#pragma mark - public methods

- (void)setValue:(id)value forKeyTime:(CGFloat)keyTime {
    [self setValue:value forKeyTime:keyTime easing:kBIEasingCurveLinear];
}

- (void)setValue:(id)value forKeyTime:(CGFloat)keyTime easing:(BIEasingCurve)easing {
    if ([self.keyTimes containsObject:@(keyTime)]) {
        return;
    }
    [self.keyTimes addObject:@(keyTime)];
    
    BIIntroPageKeyFrame *keyFrame = [[BIIntroPageKeyFrame alloc] init];
    keyFrame.to = value;
    keyFrame.keyTime = keyTime;
    keyFrame.interpolation = self.interpolation;
    keyFrame.easing = easing;
    [self.keyFrames addObject:keyFrame];
}

- (id)valueForDuration:(CGFloat)duration {
    BIIntroPageKeyFrame *keyFrame = [self keyFrameForTimeOffset:duration];
    return [keyFrame valueForTimeOffset:duration];
}

@end
