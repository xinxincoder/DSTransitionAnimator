//
//  AnimatorNavigationController.m
//  DSTransitionAnimatorDemo
//
//  Created by XXL on 2017/9/15.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import "AnimatorNavigationController.h"
#import "DSScaleAnimatedTransitioning.h"
#import "DSInteractiveTransition.h"
#import "DSSliderAnimatedTransitioning.h"

@interface AnimatorNavigationController ()<UINavigationControllerDelegate>

@property (nonatomic, weak) DSInteractiveTransition *transition;

@end

@implementation AnimatorNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    UIScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenPanGestureRecognizerAction:)];
    screenEdgePanGestureRecognizer.edges = UIRectEdgeLeft;

    [self.view addGestureRecognizer:screenEdgePanGestureRecognizer];

}

- (void)screenPanGestureRecognizerAction:(UIScreenEdgePanGestureRecognizer *)pan {

    CGPoint translation = [pan translationInView:pan.view];
    
    NSLog(@"translation = %f",translation.x);

    CGFloat percent = translation.x/CGRectGetWidth(pan.view.bounds);

    percent = MIN(1, MAX(percent, 0));

    switch (pan.state) {
        case UIGestureRecognizerStateBegan: {

            DSInteractiveTransition *transition = [[DSInteractiveTransition alloc] init];
            self.transition = transition;
            
            [self popViewControllerAnimated:YES];

            break;
        }
        case UIGestureRecognizerStateChanged:

            [self.transition updateInteractiveTransition:percent];

            NSLog(@"percent = %f",percent);
            
            break;

        default: {

            if (percent < 0.5) {

                [self.transition  cancelInteractiveTransition];

            }else {

                [self.transition  finishInteractiveTransition];
            }

            self.transition = nil;
            
            break;

        }
    }
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
    
    return self.transition;
    
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {

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
    
}



@end
