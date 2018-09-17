//
//  DSAnimatedTransitioning.h
//  DSTransitionAnimatorDemo
//
//  Created by XXL on 2017/9/12.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DSAnimatedTransitioningDirection) {
    DSAnimatedTransitioningDirectionLeft,
    DSAnimatedTransitioningDirectionRight,
};

@interface DSAnimatedTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) DSAnimatedTransitioningDirection direction;

+ (instancetype)animatedTransitioningDirection:(DSAnimatedTransitioningDirection)direction;

@end
