//
//  ViewController.m
//  UINavigationControllerDemo
//
//  Created by Terra MacBook on 16/8/9.
//  Copyright © 2016年 Jianbing Zhou. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"VC";
//    self.navigationController.hidesBarsOnTap = YES;
    [self.view setBackgroundColor:[UIColor greenColor]];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    btn.center = CGPointMake(self.view.center.x
                             , self.view.center.y);
    [btn setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated {
    //这里证明 出栈没有销毁VC但是 navgationController.viewControllers.count 会改变
    [super viewWillAppear:animated];
    NSLog(@"ViewController.h*****%ld",self.navigationController.viewControllers.count);
}

- (void)push {
    [self.navigationController pushViewController:[NextViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
