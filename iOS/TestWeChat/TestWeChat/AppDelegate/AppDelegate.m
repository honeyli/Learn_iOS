//
//  AppDelegate.m
//  TestWeChat
//
//  Created by xuyanli on 16/7/18.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "AppDelegate.h"
#import "MessageViewController.h"
#import "ContentViewController.h"
#import "FindViewController.h"
#import "MineViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor grayColor];
    
    UITabBarController *tabBar = [[UITabBarController alloc] init];

     MessageViewController*messageView = [[MessageViewController alloc]  init];
    messageView.view.backgroundColor = [UIColor grayColor];
    messageView.tabBarItem.title = @"微信";
    messageView.tabBarItem.image = [[UIImage imageNamed:@"Image-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    messageView.tabBarItem.selectedImage =  [[UIImage imageNamed:@"tabbar_mainframeHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    messageView.tabBarItem.badgeValue = @"3";
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:messageView];
//    nav1.title = @"WeChat";
    
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
    //添加自控制器到tabbar中
    tabBar.viewControllers = @[nav1,nav2,nav3,nav4];
    self.window.rootViewController = tabBar;
    [self.window makeKeyWindow];
    [self setupNavBar];
    return YES;
}

- (void)setupNavBar
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    UINavigationBar *bar = [UINavigationBar appearance];
    CGFloat rgb = 0.1;
    bar.barTintColor = [UIColor colorWithRed:rgb green:rgb blue:rgb alpha:0.9];
    bar.tintColor = [UIColor whiteColor];
    bar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
