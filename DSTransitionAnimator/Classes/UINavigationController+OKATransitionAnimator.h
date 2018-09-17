//
//  UINavigationController+DSTransitionAnimator.h
//  DSTransitionAnimatorDemo
//
//  Created by XXL on 2017/9/14.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UINavigationControllerPushAnimationType) {
    UINavigationControllerPushAnimationTypeNone,
    UINavigationControllerPushAnimationTypeSlider,
    UINavigationControllerPushAnimationTypeScale,
};

@interface UINavigationController (DSTransitionAnimator)

- (void)DS_pushViewController:(nonnull UIViewController *)viewController animationType:(UINavigationControllerPushAnimationType)animationType;

//- (nullable UIViewController *)DS_popViewControllerAnimationType:(UINavigationControllerPushAnimationType)animationType;

- (void)DS_cacnelAnimation;

@end
