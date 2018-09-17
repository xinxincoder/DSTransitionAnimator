#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "DSAnimatedTransitioning.h"
#import "DSCycleBiggerAnimatedTransitioning.h"
#import "DSInteractiveTransition.h"
#import "DSScaleAnimatedTransitioning.h"
#import "DSSliderAnimatedTransitioning.h"
#import "DSTransitionAnimator.h"
#import "DSTransitionAnimatorCommon.h"
#import "UINavigationController+OKATransitionAnimator.h"
#import "UITabBarController+OKATransitionAnimator.h"
#import "UIViewController+OKATransitionAnimator.h"

FOUNDATION_EXPORT double DSTransitionAnimatorVersionNumber;
FOUNDATION_EXPORT const unsigned char DSTransitionAnimatorVersionString[];

