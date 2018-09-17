//
//  AnimatorDismissController.m
//  DSTransitionAnimatorDemo
//
//  Created by XXL on 2017/9/11.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import "AnimatorDismissController.h"

@interface AnimatorDismissController ()

@end

@implementation AnimatorDismissController

- (IBAction)dismissAction:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)dealloc {
    
    NSLog(@"dealloc");
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
