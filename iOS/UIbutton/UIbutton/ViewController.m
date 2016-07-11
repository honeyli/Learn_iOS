//
//  ViewController.m
//  UIbutton
//
//  Created by xuyanli on 16/7/10.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(200, 20, 50, 60);
    button1.backgroundColor = [UIColor blackColor]; //button的背景颜色
    [button1 setTitle:@"close" forState:UIControlStateNormal];//设置按钮的标题
    [button1 setTitle:@"高亮状态" forState:UIControlStateHighlighted];//高亮状态设置title状态
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];//设置标题颜色
    button1.titleLabel.font = [UIFont fontWithName:@"test" size:18];//设置按钮字体大小
    [self.view  addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(100, 50, 100, 75);
    button2.backgroundColor = [UIColor greenColor];
    [button2 setTitle:@"open" forState:UIControlStateNormal];
    [button2 setBackgroundImage:[UIImage  imageNamed:@"Btn_bg"] forState:UIControlStateNormal];
    [button2 setTitleShadowColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button2 setTag:101]; //设置tag值
    button2.layer.cornerRadius = 4.5; //设置四个圆角半径
    button2.layer.borderWidth = 0.5;//设置边框的宽度
    [self.view addSubview:button2];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
