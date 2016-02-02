//
//  BIIntroPageAnimator.m
//  GuidePageDemo
//
//  Created by AugustRush on 15/11/2.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "BIIntroPageAnimator.h"

@interface BIIntroPageAnimator ()

@property (nonatomic, strong) NSMutableArray *animations;

@end

@implementation BIIntroPageAnimator

+ (instancetype)shareAnimator {
    static BIIntroPageAnimator *__animator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __animator = [[BIIntroPageAnimator alloc] init];
    });
    return __animator;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _animations = [NSMutableArray array];
    }
    return self;
}

- (void)addAnimation:(id<BIIntroPageAnimateProtocol>)animation {
    [animation preparedKeyFramesForScrolling];
    [self.animations addObject:animation];
}

- (void)removeAnimation:(id<BIIntroPageAnimateProtocol>)animation {
    [self.animations removeObject:animation];
}

- (void)removeAllAnimations {
    [self.animations removeAllObjects];
}

- (void)animateForOffset:(CGFloat)offset {
    for (id<BIIntroPageAnimateProtocol> animation in self.animations) {
        [animation animateForOffset:offset];
    }
}

@end
