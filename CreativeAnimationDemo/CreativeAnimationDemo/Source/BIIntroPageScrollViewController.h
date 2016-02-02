//
//  BIIntroPageScrollViewController.h
//  GuidePageDemo
//
//  Created by AugustRush on 15/11/5.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIIntroPageScrollViewController : UIViewController

@property (nonatomic, strong, readonly) UIScrollView *scrollView;
@property (nonatomic, strong, readonly) UIView *contentView;

//subclass need to override below methods
- (NSUInteger)numberOfPages;//default to 1
- (CGFloat)pageWidth;//default to [UIScreen mainScreen].bounds.size.width

#pragma mark - animations methods

@end
