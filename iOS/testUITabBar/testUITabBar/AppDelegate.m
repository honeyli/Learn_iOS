//
//  AppDelegate.m
//  testUITabBar
//
//  Created by xuyanli on 16/7/13.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //创建window
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    
    UIViewController *viewController1 = [[UIViewController alloc]  init];
    viewController1.view.backgroundColor = [UIColor grayColor];
    viewController1.tabBarItem.title = @"信息";
    viewController1.tabBarItem.image = [[UIImage imageNamed:@"message.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController1.tabBarItem.badgeValue = @"3";
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
    
    UIViewController *viewController2 = [[UIViewController alloc] init];
    viewController2.view.backgroundColor = [UIColor yellowColor];
    viewController2.tabBarItem.title = @"联系人";
    viewController2.tabBarItem.image = [[UIImage imageNamed:@"content.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:viewController2];
    
    UIViewController *viewController3 = [[UIViewController alloc] init ];
    viewController3.tabBarItem.title = @"电话";
    viewController3.tabBarItem.image = [[UIImage imageNamed:@"telepone.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIViewController *viewController4 = [[UIViewController alloc] init];
    viewController4.tabBarItem.title = @"浏览器";
    viewController4.tabBarItem.image = [[UIImage imageNamed:@"liulanqi@2x.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //添加自控制器到tabbar中
    tabBar.viewControllers = @[viewController1,viewController2,viewController3,viewController4];
    self.window.rootViewController = tabBar;
    [self.window makeKeyWindow];
       return YES;
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
