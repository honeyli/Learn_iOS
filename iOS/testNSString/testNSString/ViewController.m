//
//  ViewController.m
//  testNSString
//
//  Created by xuyanli on 16/7/15.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //替换
    NSString *string = [[NSString alloc] init];
    [string stringByReplacingOccurrencesOfString:@"-" withString:@"/"];
    
    //拼接字符串
    NSString *str = @"my name is xuyanli";
    NSString *str1 = [[NSString alloc] initWithFormat:@"我的名字:  %@  我的年龄：%d,@"xuyanli:",25 ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
