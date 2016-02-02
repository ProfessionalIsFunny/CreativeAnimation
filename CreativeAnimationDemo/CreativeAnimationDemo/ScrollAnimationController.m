//
//  ScrollAnimationController.m
//  CreativeAnimationDemo
//
//  Created by AugustRush on 2/1/16.
//  Copyright © 2016 ProfessionIsFunny. All rights reserved.
//

#import "ScrollAnimationController.h"
#import <EasyLayout.h>
#import "BIIntroPageAnimation.h"

@interface ScrollAnimationController ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *colorView;
@property (nonatomic, strong) UIView *colorView1;
@property (nonatomic, strong) UIView *colorView2;

@property (nonatomic, strong) UIView *colorView3;
@property (nonatomic, strong) UIView *colorView4;
@property (nonatomic, strong) UIView *colorView5;

@property (nonatomic, strong) UIView *colorView6;
@property (nonatomic, strong) UIView *colorView7;

@property (nonatomic, strong) UIImageView *sunImageView;


@end

@implementation ScrollAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubViews];
    [self subViewsLayoutAndAnimations];
}

- (NSUInteger)numberOfPages {
    return 3;
}

- (void)initSubViews {
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.scrollView.backgroundColor = [UIColor whiteColor];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.text = @"测试的demo";
    [self.contentView addSubview:self.titleLabel];
    
    
    self.colorView = [[UIView alloc] init];
    self.colorView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:self.colorView];
    
    self.colorView1 = [[UIView alloc] init];
    self.colorView1.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:self.colorView1];
    
    self.colorView2 = [[UIView alloc] init];
    self.colorView2.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:self.colorView2];
    
    self.colorView3 = [[UIView alloc] init];
    self.colorView3.backgroundColor = [self randomColor];
    [self.contentView addSubview:self.colorView3];
    
    self.colorView4 = [[UIView alloc] init];
    self.colorView4.backgroundColor = [self randomColor];
    [self.contentView addSubview:self.colorView4];
    
    self.colorView5 = [[UIView alloc] init];
    self.colorView5.backgroundColor = [self randomColor];
    [self.contentView addSubview:self.colorView5];
    
    self.colorView6 = [[UIView alloc] init];
    self.colorView6.backgroundColor = [self randomColor];
    [self.contentView addSubview:self.colorView6];
}

- (void)subViewsLayoutAndAnimations {
    
    [self.titleLabel makeConstraints:^(ELConstraintsMaker *make) {
        make.EL_top.equalTo(@60);
        make.EL_centerX.equalTo(@0).multiplier(1/3.0);
    }];
    
    [self.colorView makeConstraints:^(ELConstraintsMaker *make) {
        make.EL_top.equalTo(self.titleLabel.EL_bottom).offset(10);
        make.EL_centerX.equalTo(@0).multiplier(1/3.0);
        make.EL_width.equalTo(@100);
        make.EL_height.equalTo(@100);
    }];
    
    __block NSLayoutConstraint *centerX = nil;
    [self.colorView1 makeConstraints:^(ELConstraintsMaker *make) {
        make.EL_top.equalTo(_colorView.EL_bottom).offset(10);
        centerX = make.EL_centerX.equalTo(@0).multiplier(1/3.0).constraint();
        make.EL_width.equalTo(_colorView);
        make.EL_height.equalTo(_colorView);
    }];
    
    [self.colorView2 makeConstraints:^(ELConstraintsMaker *make) {
        make.EL_top.equalTo(_colorView1.EL_bottom).offset(10);
        make.EL_centerX.equalTo(@0).multiplier(1/3.0);
        make.EL_width.equalTo(@100);
        make.EL_height.equalTo(@100);
    }];
    
    __block NSLayoutConstraint *postionY0 = nil;
    [self.colorView3 makeConstraints:^(ELConstraintsMaker *make) {
        postionY0 = make.EL_bottom.equalTo(_colorView1.EL_top).offset(-500).constraint();
        make.EL_centerX.equalTo(@0);
        make.EL_width.equalTo(@100);
        make.EL_height.equalTo(@100);
    }];
    
    __block NSLayoutConstraint *positionY1 = nil;
    [self.colorView4 makeConstraints:^(ELConstraintsMaker *make) {
        positionY1 = make.EL_top.equalTo(_colorView1.EL_bottom).offset(500).constraint();
        make.EL_centerX.equalTo(@0);
        make.EL_width.equalTo(@100);
        make.EL_height.equalTo(@100);
    }];
    
    [self.colorView5 makeConstraints:^(ELConstraintsMaker *make) {
        make.EL_centerX.equalTo(@0).multiplier(2.5/1.5);
        make.EL_width.equalTo(_colorView1).multiplier(1.2);
        make.EL_height.equalTo(_colorView1).multiplier(1.2);
        make.EL_centerY.equalTo(@0);
    }];
    
    [UIView animateWithDuration:1.0
                     animations:^{
                         [UIView setAnimationRepeatCount:1000];
                         self.colorView1.backgroundColor = [UIColor redColor];
                     }];

    
    
    CGFloat pageWidth = [self pageWidth];
    BIIntroPageAnimation *positionXA = [[BIIntroPageAnimation alloc] initWithAnimatedObject:centerX type:BIIntroPageAnimationTypeConstraint];
    [positionXA addValue:@(pageWidth) forKeyTime:1];
    [positionXA addValue:@(2*pageWidth) forKeyTime:2 easing:kBIEasingCurveSine];
    [positionXA commit];
    
    UIColor *fromColor = self.colorView1.backgroundColor;
    BIIntroPageAnimation *colorA = [[BIIntroPageAnimation alloc] initWithAnimatedObject:self.colorView1 type:BIIntroPageAnimationTypeViewColor];
    [colorA addValue:fromColor forKeyTime:1];
    [colorA addValue:[self randomColor] forKeyTime:2];
    [colorA commit];
    
    BIIntroPageAnimation *cornerRadiusA = [[BIIntroPageAnimation alloc] initWithAnimatedObject:self.colorView1.layer type:BIIntroPageAnimationTypeLayerCornerRadius];
    [cornerRadiusA addValue:@0 forKeyTime:1];
    [cornerRadiusA addValue:@30 forKeyTime:2];
    [cornerRadiusA commit];
    
    BIIntroPageAnimation *rotationA = [[BIIntroPageAnimation alloc] initWithAnimatedObject:self.colorView1.layer type:BIIntroPageAnimationTypeLayerRotation];
    [rotationA addValue:@M_PI_2 forKeyTime:1];
    [rotationA commit];
    
    BIIntroPageAnimation *positionY0A = [[BIIntroPageAnimation alloc] initWithAnimatedObject:postionY0 type:BIIntroPageAnimationTypeConstraint];
    [positionY0A addValue:@(-20) forKeyTime:1];
    [positionY0A commit];
    
    BIIntroPageAnimation *positionY1A = [[BIIntroPageAnimation alloc] initWithAnimatedObject:positionY1 type:BIIntroPageAnimationTypeConstraint];
    [positionY1A addValue:@(20) forKeyTime:1];
    [positionY1A commit];
    
    BIIntroPageAnimation *alphaA = [[BIIntroPageAnimation alloc] initWithAnimatedObject:self.colorView5 type:BIIntroPageAnimationTypeViewAlpha];
    [alphaA addValue:@1 forKeyTime:1.5];
    [alphaA addValue:@0.5 forKeyTime:2];
    [alphaA commit];
    
    BIIntroPageAnimation *backColorA = [[BIIntroPageAnimation alloc] initWithAnimatedObject:self.scrollView type:BIIntroPageAnimationTypeViewColor];
    [backColorA addValue:[UIColor whiteColor] forKeyTime:0];
    [backColorA addValue:[UIColor greenColor] forKeyTime:2];
    [backColorA commit];
    
    BIIntroPageAnimation *scaleXA = [[BIIntroPageAnimation alloc] initWithAnimatedObject:self.colorView5.layer type:BIIntroPageAnimationTypeLayerScaleX];
    [scaleXA addValue:@1 forKeyTime:1.5];
    [scaleXA addValue:@1.5 forKeyTime:2];
    [scaleXA commit];
    
    BIIntroPageAnimation *scaleXB = [[BIIntroPageAnimation alloc] initWithAnimatedObject:self.colorView1.layer type:BIIntroPageAnimationTypeLayerScale];
    [scaleXB addValue:@1 forKeyTime:1.5];
    [scaleXB addValue:@1.5 forKeyTime:2];
    [scaleXB commit];
    
}

- (UIColor *) randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
