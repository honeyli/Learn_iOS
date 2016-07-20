//
//  ViewController.m
//  testUIDatePicker
//
//  Created by xuyanli on 16/7/19.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDate *currentTime = [NSDate date];
    UIDatePicker *dataPick = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 100, 320, 216)];
    //设置当前显示
    [dataPick setDate:currentTime animated:YES];
    //设置显示最大时间
    [dataPick setMaximumDate:currentTime];
    //显示模式
    [self.view addSubview:dataPick];
    [dataPick setDatePickerMode:UIDatePickerModeDateAndTime];
    [dataPick addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
}
 -(void)datePickerValueChanged:(UIDatePicker *)sender
{
    NSLog(@"%@",[sender date]);
//    　　NSDate *selected = [NSDate date]
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
