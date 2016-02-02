//
//  BIIntroPageAnimateProtocol.h
//  GuidePageDemo
//
//  Created by AugustRush on 15/11/2.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BIIntroPageAnimateProtocol <NSObject>

- (void)animateForOffset:(CGFloat)offset;
- (void)preparedKeyFramesForScrolling;

@end
