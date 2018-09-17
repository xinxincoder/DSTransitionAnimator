//
//  DSAnimatedTransitioning.m
//  DSTransitionAnimatorDemo
//
//  Created by XXL on 2017/9/12.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import "DSAnimatedTransitioning.h"
#import "DSTransitionAnimator.h"

@interface DSAnimatedTransitioning ()

@end

@implementation DSAnimatedTransitioning

+ (instancetype)animatedTransitioningDirection:(DSAnimatedTransitioningDirection)direction {
    
    DSAnimatedTransitioning *transitioning = [[self alloc] init];
    transitioning.direction = direction;
    return transitioning;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.35;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    
}

@end
