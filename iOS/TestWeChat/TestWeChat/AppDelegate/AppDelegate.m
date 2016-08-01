//
//  AppDelegate.m
//  TestWeChat
//
//  Created by xuyanli on 16/7/18.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MessageViewController.h"
#import "ContentViewController.h"
#import "FindViewController.h"
#import "MineViewController.h"
#import "LoginViewController.h"
#import "MessageViewController.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UITabBarController *tabBar = [[UITabBarController alloc] init];

     MessageViewController*messageView = [[MessageViewController alloc]  init];
    messageView.view.backgroundColor = [UIColor grayColor];
    messageView.tabBarItem.title = @"微信";
    messageView.tabBarItem.image = [[UIImage imageNamed:@"Image-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    messageView.tabBarItem.selectedImage =  [[UIImage imageNamed:@"tabbar_mainframeHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    messageView.tabBarItem.badgeValue = @"3";
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:messageView];
    nav1.title = @"WeChat";
    
    ContentViewController *contentView = [[ContentViewController alloc] init ];
    contentView.tabBarItem.title = @"通讯录";
    contentView.tabBarItem.image = [[UIImage imageNamed:@"tabbar_discover"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    contentView.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_discoverHL"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:contentView];

    FindViewController *findView = [[FindViewController alloc] init];
    findView.view.backgroundColor = [UIColor yellowColor];
    findView.tabBarItem.title = @"发现";
    findView.tabBarItem.image = [[UIImage imageNamed:@"tabbar_contacts"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    findView.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_contactsHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:findView];
    
    
    MineViewController *mineView = [[MineViewController alloc] init];
    mineView.tabBarItem.title = @"我";
    mineView.tabBarItem.image = [[UIImage imageNamed:@"tabbar_me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mineView.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_meHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:mineView];
    
    tabBar.viewControllers = @[nav1,nav2,nav3,nav4];
    tabBar.view.alpha = 0;
    //添加自控制器到tabbar中
    self.window.rootViewController = tabBar;
    [self.window makeKeyAndVisible];
    NSUserDefaults *userDefaults;
    if (![[NSUserDefaults standardUserDefaults]boolForKey:@"login"]) {
        [userDefaults setBool:YES forKey:@"login"];
        LoginViewController *login = [[LoginViewController alloc] init];
        login.view.alpha = 0;
        [tabBar presentViewController:login animated:NO completion:nil];
        ViewController *view = [[ViewController alloc] init];
        [login presentViewController:view animated:NO completion:nil];
        login.view.alpha = 1;
        tabBar.view.alpha = 1;
    }    return YES;
}
@end
