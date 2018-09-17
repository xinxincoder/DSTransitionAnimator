//
//  UIViewController+DSTransitionAnimator.h
//  DSTransitionAnimatorDemo
//
//  Created by XXL on 2017/9/14.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (DSTransitionAnimator)

- (void)DS_presentViewController:(UIViewController *)viewControllerToPresent cycleBiggerAnimated: (BOOL)flag touchView:(UIView *)touchView completion:(void (^ __nullable)(void))completion;

@end
