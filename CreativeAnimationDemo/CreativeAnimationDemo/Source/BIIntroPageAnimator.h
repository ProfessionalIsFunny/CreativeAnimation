//
//  BIIntroPageAnimator.h
//  GuidePageDemo
//
//  Created by AugustRush on 15/11/2.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIIntroPageAnimateProtocol.h"

@interface BIIntroPageAnimator : NSObject

+ (instancetype)shareAnimator;

- (void)addAnimation:(id<BIIntroPageAnimateProtocol>)animation;
- (void)removeAnimation:(id<BIIntroPageAnimateProtocol>)animation;
- (void)removeAllAnimations;

- (void)animateForOffset:(CGFloat)offset;

@end
