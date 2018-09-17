//
//  ViewController.m
//  DSTransitionAnimatorDemo
//
//  Created by XXL on 2017/9/8.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import "ViewController.h"
#import "DSTransitionAnimator.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (IBAction)Action:(id)sender {
    
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc =  [storyboard instantiateViewControllerWithIdentifier:@"SSSS"];
    vc.modalPresentationStyle = UIModalPresentationCustom;
    
    vc.transitioningDelegate = self;
    
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
//    UIView transitionFromView:<#(nonnull UIView *)#> toView:<#(nonnull UIView *)#> duration:<#(NSTimeInterval)#> options:<#(UIViewAnimationOptions)#> completion:<#^(BOOL finished)completion#>
//    
}


- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [DSTransitionAnimator new];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [DSTransitionAnimator new];
}

@end
