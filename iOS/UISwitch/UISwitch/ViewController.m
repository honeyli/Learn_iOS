//
//  ViewController.m
//  UISwitch
//
//  Created by xuyanli on 16/7/11.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
   //创建UIswitch
    UISwitch *switch1 = [[UISwitch alloc] init];
    CGSize viewSize = self.view.bounds.size;
    switch1.frame = CGRectMake(viewSize.height*0.2, 150, 0, 0);
    switch1.backgroundColor = [UIColor redColor];//设置背景
    switch1.onTintColor = [UIColor yellowColor];//设置on一边的背景颜色  默认为绿色
    switch1.tintColor = [UIColor purpleColor];//设置off一边的背景颜色  默认是灰色（off背景颜色也是边框背景颜色）
    switch1.thumbTintColor = [UIColor greenColor];//设置滑块颜色
    [switch1 setOn:YES animated:YES];//开关控件默认是关闭，seton默认是打开
   [switch1 addTarget:self action:@selector(getValue:) forControlEvents:UIControlEventValueChanged]; //添加触发事件
    //ison是一个getter方法，所以不能赋值，即不能用switch1.isOn = YES 只能取得当前结果，一般用于判断是否是开启状态
    if (switch1.isOn) {
        NSLog(@"It is on");
    }
    
    [self.view addSubview:switch1];
    [super viewDidLoad];
}

-(void)getValue:(UISwitch *)sender{
    UISwitch *switch1 = (UISwitch *)sender;
    if (switch1.isOn) {
        NSLog(@"On");
    }else
    {
        NSLog(@"OFF");
    }
}

@end
