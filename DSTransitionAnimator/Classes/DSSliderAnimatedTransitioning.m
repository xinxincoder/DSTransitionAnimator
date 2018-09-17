//
//  DSSliderAnimatedTransitioning.m
//  DSTransitionAnimatorDemo
//
//  Created by XXL on 2017/9/12.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import "DSSliderAnimatedTransitioning.h"

@implementation DSSliderAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.35;
}


- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    
    fromView = fromController.view;
    toView = toController.view;
    
    CGRect fromFrame = [transitionContext initialFrameForViewController:fromController];
    CGRect toFrame = [transitionContext finalFrameForViewController:toController];
    
    fromView.frame = fromFrame;
    toView.frame = toFrame;
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:toView];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    NSInteger direction = 1;
    
    switch (self.direction) {
        case DSAnimatedTransitioningDirectionLeft: {
            
            direction = -1;
            
            break;
        }
            
        case DSAnimatedTransitioningDirectionRight: {
            
            direction = 1;
            
            break;
        }
    }
    
    fromView.transform = CGAffineTransformIdentity;
    toView.transform = CGAffineTransformMakeTranslation(direction *CGRectGetWidth(toView.frame), 0);
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        fromView.transform = CGAffineTransformMakeTranslation(direction *-CGRectGetWidth(toView.frame), 0);
        toView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        fromView.transform = CGAffineTransformIdentity;
        toView.transform = CGAffineTransformIdentity;
        
        BOOL wasCanncelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!wasCanncelled];
    }];
    
}



@end
