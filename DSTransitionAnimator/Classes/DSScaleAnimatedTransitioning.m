//
//  DSScaleAnimatedTransitioning.m
//  DSTransitionAnimatorDemo
//
//  Created by XXL on 2017/9/12.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import "DSScaleAnimatedTransitioning.h"

@implementation DSScaleAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.5;
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
    containerView.backgroundColor = [UIColor whiteColor];
    [containerView addSubview:toView];
    
    
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

    UIBlurEffect *bulrEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:bulrEffect];
    
    visualEffectView.frame = containerView.bounds;
    
    [containerView addSubview:visualEffectView];
    
    [containerView sendSubviewToBack:visualEffectView];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    CGFloat scale = 0.5;

    toView.transform = CGAffineTransformMakeTranslation(direction * CGRectGetWidth(toFrame), 0);
    toView.transform = CGAffineTransformScale(toView.transform , scale, scale);
    
    [UIView animateKeyframesWithDuration:duration delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.2 animations:^{

            fromView.transform = CGAffineTransformMakeScale(scale, scale);
            fromView.transform = CGAffineTransformTranslate(fromView.transform, direction * -CGRectGetWidth(fromFrame)*(1 - scale), 0);
            toView.transform = CGAffineTransformTranslate(toView.transform,direction * -CGRectGetWidth(toFrame)*(1 - scale), 0);
        
        }];

        [UIView addKeyframeWithRelativeStartTime:0.2 relativeDuration:0.6 animations:^{

             fromView.transform = CGAffineTransformTranslate(fromView.transform, direction *-CGRectGetWidth(fromFrame)*scale, 0);
            
             toView.transform = CGAffineTransformTranslate(toView.transform,direction * -CGRectGetWidth(toFrame)*scale, 0);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.8 relativeDuration:0.2 animations:^{
            
            
            fromView.transform = CGAffineTransformMakeTranslation(direction *-CGRectGetWidth(fromFrame) - CGRectGetWidth(fromFrame)*0.15, 0);
            
            toView.transform = CGAffineTransformIdentity;
        }];

        
    } completion:^(BOOL finished) {

        
        fromView.transform = CGAffineTransformIdentity;
        toView.transform = CGAffineTransformIdentity;
        [visualEffectView removeFromSuperview];
        
        BOOL wasCanncelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!wasCanncelled];
        
    }];
}

@end
