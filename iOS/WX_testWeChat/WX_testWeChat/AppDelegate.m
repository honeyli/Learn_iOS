//
//  AppDelegate.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/7/30.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "AppDelegate.h"
#import "MessageViewController.h"
#import "ContactViewController.h"
#import "MineViewController.h"
#import "FindViewController.h"
#import "GuideViewController.h"
#import "LoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    MessageViewController  *messageView = [[MessageViewController alloc] init];
    messageView.tabBarItem.title = @"微信";
//    messageView.view.backgroundColor = [UIColor grayColor];
    messageView.tabBarItem.image = [UIImage imageNamed:@"tabbar_mainframe"];
    messageView.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_mainframeHL"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:messageView];
    
    ContactViewController *contactView = [[ContactViewController alloc] init];
    contactView.tabBarItem.title = @"通讯录";
    contactView.tabBarItem.image = [UIImage imageNamed:@"tabbar_contacts"];
    contactView.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_contactsHL"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:contactView];
    
    FindViewController *findView = [[FindViewController alloc] init];
    findView.tabBarItem.title = @"发现";
    findView.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
    findView.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_discoverHL"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:findView];
    
    MineViewController *mineView = [[MineViewController alloc] init];
    mineView.tabBarItem.title = @"我的";
    mineView.tabBarItem.image = [UIImage imageNamed:@"tabbar_me"];
    mineView.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_meHL"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:mineView];
    
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    tabBar.viewControllers = @[nav1,nav2,nav3,nav4];
    
    self.window.rootViewController = tabBar;
    [self.window makeKeyWindow];
    NSUserDefaults *userDefaults;
    if (![[NSUserDefaults standardUserDefaults]boolForKey:@"login"]) {
        [userDefaults setBool:YES forKey:@"login"];
        LoginViewController *login = [[LoginViewController alloc] init];
        login.view.alpha = 0;
        [tabBar presentViewController:login animated:NO completion:nil];
        GuideViewController *guideView = [[GuideViewController alloc] init];
        [login presentViewController:guideView animated:NO completion:nil];
        login.view.alpha = 1;
        tabBar.view.alpha = 1;
    }
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
