//
//  ViewController.m
//  Flash
//
//  Created by xuyanli on 16/7/22.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
//    //交换本视图控制器中的两个view的位置
//    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    ////UIView开始动画，第一个参数是动画的标识，第二个参数附加的应用程序信息用来传递给动画代理消息
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(30, 30, 100, 100);
    btn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:btn];
    [UIView beginAnimations:@"View Flip" context:nil];
    //动画持续的时间
    [UIView setAnimationDuration:5];
    //设置动画的回调函数，设置后可以使用回调方法
    [UIView setAnimationDelegate:self];
    //设置动画曲线，控制动画进度
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //设置动画方式，并指出动画发生的位置
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
    //提交动画
    btn.frame = CGRectMake(100, 100, 100, 100);
    [UIView commitAnimations];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
