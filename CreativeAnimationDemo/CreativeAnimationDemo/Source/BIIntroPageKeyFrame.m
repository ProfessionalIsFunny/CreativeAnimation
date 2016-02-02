//
//  BIIntroPageKeyFrame.m
//  GuidePageDemo
//
//  Created by AugustRush on 15/11/3.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "BIIntroPageKeyFrame.h"

@interface BIIntroPageKeyFrame ()

@end

@implementation BIIntroPageKeyFrame

- (instancetype)init {
    self = [super init];
    if (self) {
        _easing = kBIEasingCurveLinear;
    }
    return self;
}

- (id)valueForTimeOffset:(CGFloat)offset {
    CGFloat progress = (offset - _startKeyTime) / (_keyTime - _startKeyTime);
    if (progress < 0) {
        progress = 0;
    }
    if (progress > 1) {
        progress = 1;
    }
    return self.interpolation(_from,_to,progress,_easing);
}

@end
