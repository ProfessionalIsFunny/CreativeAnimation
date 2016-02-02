//
//  ViewController.m
//  CreativeAnimationDemo
//
//  Created by AugustRush on 1/26/16.
//  Copyright © 2016 ProfessionIsFunny. All rights reserved.
//

#import "ViewController.h"
#import <EasyLayout.h>
#import "ScrollAnimationController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)pushScrollAnimation:(id)sender {
    ScrollAnimationController *animationController = [[ScrollAnimationController alloc] init];
    [self presentViewController:animationController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
