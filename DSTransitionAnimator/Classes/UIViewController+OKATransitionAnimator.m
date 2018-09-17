//
//  UIViewController+DSTransitionAnimator.m
//  DSTransitionAnimatorDemo
//
//  Created by XXL on 2017/9/14.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import "DSCycleBiggerAnimatedTransitioning.h"
#import <objc/runtime.h>
#import <DSTransitionAnimator/DSTransitionAnimator-umbrella.h>

@interface UIViewController ()<UIViewControllerTransitioningDelegate>

@property (nonatomic, weak) UIView *touchView;

@end

@implementation UIViewController (DSTransitionAnimator)

- (UIView *)touchView {
    
   return objc_getAssociatedObject(self, _cmd);
}

- (void)setTouchView:(UIView *)touchView {
    
    objc_setAssociatedObject(self, @selector(touchView), touchView, OBJC_ASSOCIATION_ASSIGN);
}

- (void)DS_presentViewController:(UIViewController *)viewControllerToPresent cycleBiggerAnimated: (BOOL)flag touchView:(UIView *)touchView completion:(void (^ __nullable)(void))completion {
    
    self.touchView = touchView;
    
    viewControllerToPresent.transitioningDelegate = self;
    
    viewControllerToPresent.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:viewControllerToPresent animated:flag completion:completion];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [DSCycleBiggerAnimatedTransitioning animatedTransitioningWithTouchView:self.touchView];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [DSCycleBiggerAnimatedTransitioning animatedTransitioningWithTouchView:self.touchView];
}

@end
