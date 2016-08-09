//
//  JBNavigationViewController.m
//  UINavigationControllerDemo
//
//  Created by Terra MacBook on 16/8/9.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "JBNavigationViewController.h"

@interface JBNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation JBNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.hidesBarsOnSwipe = YES;//向上或向下轻扫
    self.hidesBarsOnTap = YES;//点击
    self.navigationBarHidden = NO;
    self.hidesBottomBarWhenPushed = YES;
    self.interactivePopGestureRecognizer.delegate = self;//右滑 pop
    
    //显示toolBar
    self.toolbarHidden = NO;
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    /*判断手势是interactivePopGestureRecognizer 还是别的（hidesBarsOnTap）如果不这么判断会手势冲突：当self.viewControllers.count <= 1 时用interactivePopGestureRecognizer回导致navigationBarHidden 失效（我觉得此时是系统默认返回NO）
    
    self.hidesBarsOnSwipe = YES;
    self.hidesBarsOnTap = YES;
     这些手势可以共存 亲测可行
     */
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
            if (self.viewControllers.count <= 1) {
        
                return NO;
            }else {
                return YES;
            }

    }
    
    
    return YES;
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
