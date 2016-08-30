//
//  ViewController.m
//  Plist
//
//  Created by xuyanli on 16/8/17.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //取当前mainBundle的路径
    NSString *path = [[NSBundle mainBundle] bundlePath];
    //拼接具体文件名
    NSString *finalPath = [path stringByAppendingPathComponent:@"sample.plist"];
    
    //读plist文件内容到字典
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithContentsOfFile:finalPath];
    //往字典里面取值
    [dic setObject:@"test1" forKey:@"testPlist"];
    //将字典里的值写到plist文件
    [dic writeToFile:finalPath atomically:YES];
    
    UILabel *versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    versionLabel.backgroundColor = [UIColor whiteColor];
    versionLabel.textColor = [UIColor redColor];
    
    //取出plist文件名
    NSDictionary *plistData = [NSDictionary dictionaryWithContentsOfFile:finalPath];
    //根据plist文件名读值
    NSString *versionString = [NSString stringWithFormat:@"%@",[plistData objectForKey:@"testPlist"]];
    versionLabel.text = versionString;
    [self.view addSubview:versionLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
