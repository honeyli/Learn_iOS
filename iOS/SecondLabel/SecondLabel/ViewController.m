//
//  ViewController.m
//  SecondLabel
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
    UILabel *label1 = [ [UILabel alloc ] initWithFrame:CGRectMake(15.0, 80.0, 275, 75)];
    label1.text = @"黑洞喷出矩形气泡比太阳还大，日本卫星失联前拍到神秘物告诉飞出";
    label1.font = [UIFont boldSystemFontOfSize:20];
    label1.numberOfLines = 3;
    label1.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:label1];

    UILabel *label2 = [ [ UILabel alloc] initWithFrame:CGRectMake(62.0, 193.0, 93, 13.)];
    label2.text = @"太空伊卡洛斯";
    label2.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:label2];
    
    UILabel *label3 = [ [UILabel alloc] initWithFrame:CGRectMake(14.0, 360.0, 300, 150)];
    label3.adjustsFontSizeToFitWidth = YES;
    label3.numberOfLines = 5;
    label3.text = @"太空伊卡洛斯   日本失联天文观测卫星“瞳” （Hitomi）发现，为了抑制恒星生长，宇宙中一超大质量黑洞正疯狂搅拌星系团中孕育恒星的气体。";
    [self.view addSubview:label3];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(90.0, 210.0, 60, 20)];
    label4 .text = @"07-10  09:47";
    label4.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:label4];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitle:@"原创" forState:UIControlStateNormal];
    button.frame = CGRectMake(60.0, 212.0, 40, 17);
    [self.view addSubview:button];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
