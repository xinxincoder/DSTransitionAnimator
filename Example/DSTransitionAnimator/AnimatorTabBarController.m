//
//  AnimatorTabBarController.m
//  DSTransitionAnimatorDemo
//
//  Created by XXL on 2017/9/11.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import "AnimatorTabBarController.h"
#import <DSTransitionAnimator/DSTransitionAnimator-umbrella.h>
@interface AnimatorTabBarController ()<UITabBarControllerDelegate>

@end

@implementation AnimatorTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
}

- (nullable id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
                     animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                                       toViewController:(UIViewController *)toVC {
    
    
    NSInteger fromIndex_ = [tabBarController.childViewControllers indexOfObject:fromVC];
    NSInteger toIndex_ = [tabBarController.childViewControllers indexOfObject:toVC];
    
    DSSliderAnimatedTransitioning *animator = [DSSliderAnimatedTransitioning new];
    
    animator.direction = (fromIndex_ < toIndex_);
    
    return animator;
    
}

@end
