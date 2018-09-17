//
//  AnimatorPushController.m
//  DSTransitionAnimatorDemo
//
//  Created by XXL on 2017/9/14.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import "AnimatorPushController.h"
#import <DSTransitionAnimator/DSTransitionAnimator-umbrella.h>

@interface AnimatorPushController ()

@end

@implementation AnimatorPushController

- (void)dealloc {
    
 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)pushAction:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"PUSH"];
    
    [self.navigationController DS_pushViewController:controller animationType:UINavigationControllerPushAnimationTypeScale];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
