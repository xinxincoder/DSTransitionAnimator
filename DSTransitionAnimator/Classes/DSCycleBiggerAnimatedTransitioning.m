//
//  DSCycleBiggerAnimatedTransitioning.m
//  DSTransitionAnimatorDemo
//
//  Created by XXL on 2017/9/12.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import "DSCycleBiggerAnimatedTransitioning.h"

@interface DSCycleBiggerAnimatedTransitioning ()<CAAnimationDelegate>

@property (nonatomic, strong) id <UIViewControllerContextTransitioning> transitionContext;

@property (nonatomic, strong) UIView *touchView;

@end

@implementation DSCycleBiggerAnimatedTransitioning

+ (instancetype)animatedTransitioningWithTouchView:(UIView *)touchView {

    DSCycleBiggerAnimatedTransitioning *transitioning = [[self alloc] init];
    transitioning.touchView = touchView;
    return transitioning;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    self.transitionContext = transitionContext;
    
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
    
    if (toController.isBeingPresented) {
    
     [containerView addSubview:toView];
        
    }

    CGRect convertRect = [self.touchView convertRect:self.touchView.bounds toView:nil];
    
    if (CGRectIsEmpty(convertRect)) {
        
        convertRect = CGRectMake(CGRectGetMidX(toFrame)-0.5, CGRectGetMidY(toFrame)-0.5, 1, 1);
    }
    
    CGRect startRect = CGRectZero;
    CGRect endRect = CGRectZero;
    CGFloat widthSide = MAX(CGRectGetMidX(convertRect), CGRectGetWidth(toFrame) -  CGRectGetMidX(convertRect));;
    CGFloat heightSide = MAX(CGRectGetMidY(convertRect), CGRectGetHeight(toFrame) -  CGRectGetMidY(convertRect));;
    
    CGFloat width = MIN(CGRectGetWidth(convertRect), CGRectGetHeight(convertRect));
    
    CGFloat radius = sqrtf(powf(widthSide, 2) + powf(heightSide, 2));
    
    if (toController.isBeingPresented) {
    
        startRect = CGRectMake(CGRectGetMidX(convertRect) - width*0.5, CGRectGetMidY(convertRect) - width*0.5, width, width);
        
        endRect = CGRectInset(startRect, -radius, -radius);
    }
    
    if (fromController.isBeingDismissed) {
        
        width = 1;
        
        endRect = CGRectMake(CGRectGetMidX(convertRect) - width*0.5, CGRectGetMidY(convertRect) - width*0.5, width, width);
        startRect = CGRectInset(endRect, -radius, -radius);
    }
    
    UIBezierPath *startPath = [UIBezierPath bezierPathWithOvalInRect:startRect];
    
    UIBezierPath *endPath = [UIBezierPath bezierPathWithOvalInRect:endRect];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = startPath.CGPath;
    
    if (toController.isBeingPresented) {
        
        toView.layer.mask = layer;
    }
    
    if (fromController.isBeingDismissed) {
        
        fromView.layer.mask = layer;
    }
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.delegate = self;
    animation.duration = duration;
    animation.fromValue = (__bridge id _Nullable)(startPath.CGPath);
    animation.toValue = (__bridge id _Nullable)(endPath.CGPath);
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBoth;
    [layer addAnimation:animation forKey:nil];
    

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
    BOOL wasCanncelled = [self.transitionContext transitionWasCancelled];
    [self.transitionContext completeTransition:!wasCanncelled];
}

@end
