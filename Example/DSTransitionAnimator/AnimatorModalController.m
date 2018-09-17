//
//  AnimatorModalController.m
//  DSTransitionAnimatorDemo
//
//  Created by XXL on 2017/9/11.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import "AnimatorModalController.h"
#import "DSTransitionAnimator.h"
#import "AnimatorDismissController.h"
#import "DSInteractiveTransition.h"
#import "DSCycleBiggerAnimatedTransitioning.h"
#import <DSTransitionAnimator/DSTransitionAnimator-umbrella.h>

@interface AnimatorModalController ()<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) DSInteractiveTransition *transition;

@property (nonatomic, strong) DSAnimatedTransitioning *animator;

@end

@implementation AnimatorModalController

- (IBAction)presentAction:(UIButton *)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AnimatorDismissController *controller = [storyboard instantiateViewControllerWithIdentifier:@"AnimatorDismissController"];
    
    [self DS_presentViewController:controller cycleBiggerAnimated:YES touchView:sender completion:^{
        
    }];
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    DSInteractiveTransition *transition = [DSInteractiveTransition new];
//    self.transition = transition;
//    
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAxtion:)];
//    [self.view addGestureRecognizer:pan];
}

- (void)panAxtion:(UIPanGestureRecognizer *)pan {
    
    CGPoint translation = [pan translationInView:self.view];
    
    CGFloat precent = translation.x/500;
    
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            
           [self presentAction:nil];
            
            break;
            
        case UIGestureRecognizerStateChanged:
            
            [self.transition updateInteractiveTransition:precent];
            
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateEnded: {
            
            if (translation.x >= 250) {
                
                [self.transition finishInteractiveTransition];
                
            }else {
                
                [self.transition cancelInteractiveTransition];
            }
            
            break;
        }
        default:break;
    }
}


@end
