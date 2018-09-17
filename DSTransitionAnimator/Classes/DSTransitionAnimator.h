//
//  DSTransitionAnimator.h
//  DSTransitionAnimatorDemo
//
//  Created by XXL on 2017/9/8.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DSTransitionAnimatorType) {
    DSTransitionAnimatorTypeSlider,
    DSTransitionAnimatorTypeCycleBigger,
//    DSTransitionAnimatorType,
};

@interface DSTransitionAnimator : NSObject<UIViewControllerAnimatedTransitioning>

+ (void)transitionAnimatorWithType:(DSTransitionAnimatorType)type duration:(NSTimeInterval)duration fromView:(UIView *)fromView toView:(UIView *)toView completion:(void(^)(BOOL finished))completion;

@end
