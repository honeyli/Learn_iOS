//
//  ViewController.m
//  testUITabBar
//
//  Created by xuyanli on 16/7/13.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建window
    
    /*UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    window.backgroundColor = [UIColor whiteColor];*/
    
    //初始化一个TabBar控制器
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    //设置控制器为Window的根控制器
    UIViewController *viewController1 = [[UIViewController alloc]  init];
    viewController1.view.backgroundColor = [UIColor grayColor];
    viewController1.tabBarItem.title = @"信息";
    viewController1.tabBarItem.image = [UIImage imageNamed:@"message.png"];
    viewController1.tabBarItem.badgeValue = @"3";
    
    UIViewController *viewController2 = [[UIViewController alloc] init];
    viewController2.view.backgroundColor = [UIColor yellowColor];
    viewController2.tabBarItem.title = @"联系人";
    viewController2.tabBarItem.image = [UIImage imageNamed:@"content.png"];
    
    UIViewController *viewController3 = [[UIViewController alloc] init ];
    viewController3.tabBarItem.title = @"电话";
    viewController3.tabBarItem.image = [UIImage imageNamed:@"telepone.png"];
    
    UIViewController *viewController4 = [[UIViewController alloc] init];
    viewController4.tabBarItem.title = @"浏览器";
    viewController4.tabBarItem.image = [UIImage imageNamed:@"liulanqi@2x.png"];
    
    //添加自控制器到tabbar中
//    tabBar.viewControllers = @[viewController1,viewController2,viewController3,viewController4];
//    [self.view addSubview:tabBar.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
