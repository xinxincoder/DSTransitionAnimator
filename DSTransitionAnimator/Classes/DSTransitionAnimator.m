//
//  DSTransitionAnimator.m
//  DSTransitionAnimatorDemo
//
//  Created by XXL on 2017/9/8.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import "DSTransitionAnimator.h"

@interface DSTransitionAnimator ()<CAAnimationDelegate>

@property (nonatomic, strong) id <UIViewControllerContextTransitioning> transitionContext;

@end

@implementation DSTransitionAnimator

+ (instancetype)transitionAnimatorWithType:(DSTransitionAnimatorType)type {
    
    DSTransitionAnimator *animator = [[self alloc] init];
    
    return animator;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    BOOL wasCanncelled = [self.transitionContext transitionWasCancelled];
    [self.transitionContext completeTransition:!wasCanncelled];
    
    [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
    
}

+ (void)transitionAnimatorWithType:(DSTransitionAnimatorType)type duration:(NSTimeInterval)duration fromView:(UIView *)fromView toView:(UIView *)toView completion:(void(^)(BOOL finished))completion {
    
    if (type == DSTransitionAnimatorTypeSlider) {
        
        fromView.transform = CGAffineTransformIdentity;
        toView.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(toView.frame), 0);
        
        [UIView animateWithDuration:duration animations:^{
            
            fromView.transform = CGAffineTransformMakeTranslation(-CGRectGetWidth(toView.frame), 0);
            toView.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
           
            fromView.transform = CGAffineTransformIdentity;
            toView.transform = CGAffineTransformIdentity;
            
            if (completion) {
                completion(finished);
            }
            
        }];
        
    }
    
    
    
}

@end
