//
//  UINavigationController+DSTransitionAnimator.m
//  DSTransitionAnimatorDemo
//
//  Created by XXL on 2017/9/14.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import <DSTransitionAnimator/DSTransitionAnimator-umbrella.h>
#import "DSSliderAnimatedTransitioning.h"
#import "DSScaleAnimatedTransitioning.h"
#import <objc/runtime.h>
#import "DSInteractiveTransition.h"

@interface UINavigationController ()<UINavigationControllerDelegate>

@property (nonatomic, assign) UINavigationControllerPushAnimationType animationType;

@end

@implementation UINavigationController (DSTransitionAnimator)

- (UINavigationControllerPushAnimationType)animationType {
    
    NSNumber *result = objc_getAssociatedObject(self, _cmd);
    
    return result.integerValue;
}

- (void)setAnimationType:(UINavigationControllerPushAnimationType)animationType {
    
    objc_setAssociatedObject(self, @selector(animationType), @(animationType), OBJC_ASSOCIATION_ASSIGN);
}

- (void)DS_pushViewController:(UIViewController *)viewController animationType:(UINavigationControllerPushAnimationType)animationType {
    
    self.animationType = animationType;
    
    self.delegate = self;
    
    [self pushViewController:viewController animated:YES];
    
    self.animationType = UINavigationControllerOperationNone;
}


- (void)DS_cacnelAnimation {
    
    self.animationType = UINavigationControllerOperationNone;
}

//- (nullable UIViewController *)DS_popViewControllerAnimationType:(UINavigationControllerPushAnimationType)animationType {
//    
//    self.animationType = animationType;
//    
//    UIViewController *controller = [self.navigationController popViewControllerAnimated:YES];
//    
//    self.animationType = UINavigationControllerOperationNone;
//    
//    return controller;
//}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    
    switch (self.animationType) {
        case UINavigationControllerPushAnimationTypeNone:
            return nil;
            break;
            
        case UINavigationControllerPushAnimationTypeSlider: {
            
            switch (operation) {
                case UINavigationControllerOperationNone:
                    return nil;
                    break;
                    
                case UINavigationControllerOperationPush:
                    
                    return [DSSliderAnimatedTransitioning animatedTransitioningDirection:DSAnimatedTransitioningDirectionRight];
                    
                    break;
                case UINavigationControllerOperationPop:
                    
                     return [DSSliderAnimatedTransitioning animatedTransitioningDirection:DSAnimatedTransitioningDirectionLeft];
                    
                    break;
            }
            
            break;
        }
        case UINavigationControllerPushAnimationTypeScale:
            switch (operation) {
                case UINavigationControllerOperationNone:
                    return nil;
                    break;
                    
                case UINavigationControllerOperationPush:
                    
                    return [DSScaleAnimatedTransitioning animatedTransitioningDirection:DSAnimatedTransitioningDirectionRight];
                    
                    break;
                case UINavigationControllerOperationPop:
                    
                    return [DSScaleAnimatedTransitioning animatedTransitioningDirection:DSAnimatedTransitioningDirectionLeft];
                    
                    break;
            }

            break;
    }
    
}

//- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
//                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
//    
//
//  
//    return [DSInteractiveTransition new];
//}

@end
