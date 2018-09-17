//
//  DSInteractiveTransition.m
//  DSTransitionAnimatorDemo
//
//  Created by XXL on 2017/9/12.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import "DSInteractiveTransition.h"

@interface DSInteractiveTransition ()

@property (nonatomic, strong) id<UIViewControllerContextTransitioning> transitionContext;

@end

@implementation DSInteractiveTransition

- (void)screenPanGestureRecognizerAction:(UIScreenEdgePanGestureRecognizer *)pan {
    
    CGPoint translation = [pan translationInView:pan.view];
    
    CGFloat percent = translation.x/CGRectGetWidth(pan.view.bounds);
    
    percent = MIN(1, MAX(percent, 0));
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan: {
            
            UIViewController *fromController = [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
            
            [fromController.navigationController popViewControllerAnimated:YES];
            
            break;
        }
        case UIGestureRecognizerStateChanged:
            
            [self updateInteractiveTransition:percent];
            
            break;
   
        default: {
            
            if (percent < 0.5) {
                
                [self cancelInteractiveTransition];
                
            }else {
                
                [self finishInteractiveTransition];
            }
            
            break;
            
        }
    }
}

- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext {

    
    
//    UIView *containerView = transitionContext.containerView;
//    
//    UIScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenPanGestureRecognizerAction:)];
//    screenEdgePanGestureRecognizer.edges = UIRectEdgeLeft;
//    
//    [containerView addGestureRecognizer:screenEdgePanGestureRecognizer];
//    
//    self.transitionContext = transitionContext;
    
    
    [super startInteractiveTransition:transitionContext];
    
}

@end
