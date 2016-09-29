//
//  ViewController.m
//  testNSData
//
//  Created by xuyanli on 16/9/29.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];//设置时间格式
    NSString *date = [formatter stringFromDate:[NSDate date]];//用nsdate可以获取当前系统的时间
    NSLog(@"%@",date);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
