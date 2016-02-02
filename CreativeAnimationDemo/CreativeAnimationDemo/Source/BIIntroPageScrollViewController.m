//
//  BIIntroPageScrollViewController.m
//  GuidePageDemo
//
//  Created by AugustRush on 15/11/5.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "BIIntroPageScrollViewController.h"
#import "BIIntroPageAnimator.h"
#import <EasyLayout/EasyLayout.h>

@interface BIIntroPageScrollViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentView;

@end

@implementation BIIntroPageScrollViewController

#pragma mark - lifeCycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];
    
    self.contentView = [[UIView alloc] init];
    [self.scrollView addSubview:self.contentView];
    
    [self.scrollView makeConstraints:^(ELConstraintsMaker *make) {
        make.EL_left.equalTo(@0);
        make.EL_top.equalTo(@0);
        make.EL_right.equalTo(@0);
        make.EL_bottom.equalTo(@0);
    }];
    
    CGFloat width = [self numberOfPages]*[self pageWidth];
    
    [self.contentView makeConstraints:^(ELConstraintsMaker *make) {
        make.EL_left.equalTo(@0);
        make.EL_top.equalTo(@0);
        make.EL_right.equalTo(@0);
        make.EL_bottom.equalTo(@0);
        make.EL_width.equalTo(@(width));
        make.EL_height.equalTo(self.view);
    }];

}

- (void)dealloc {

}

#pragma mark - public methods


#pragma mark - UISCrollViewDelegate methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [[BIIntroPageAnimator shareAnimator] animateForOffset:scrollView.contentOffset.x];
}

#pragma mark - subclass need to override methods

- (NSUInteger)numberOfPages {
    return 1;
}

- (CGFloat)pageWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

@end
