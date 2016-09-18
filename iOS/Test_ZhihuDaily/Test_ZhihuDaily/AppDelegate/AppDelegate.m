//
//  AppDelegate.m
//  Test_ZhihuDaily
//
//  Created by xuyanli on 16/9/9.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "AppDelegate.h"
#import "HomePageController.h"
#import "LeftMenuViewController.h"
#import "ZhihuSideMenuViewController.h"
#import "SideMenuViewController.h"

#define STATUS_BAR_TAP_NOTIFICATION @"STATUS_BAR_TAP_NOTIFICATION"
@interface AppDelegate ()
{
    UILabel *statusLabel;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.frame = [[UIScreen mainScreen] bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1]];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:17], NSFontAttributeName, nil]];
    [self configureRootVC];
    
    return YES;
}

-(void)configureRootVC
{
    LeftMenuViewController *leftVC = [[LeftMenuViewController alloc] init];
    HomePageController *rightVC = [[HomePageController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rightVC];
    
    ZhihuSideMenuViewController *sideMenu = [[ZhihuSideMenuViewController alloc] initWithContentViewController:navigationController menuViewController:leftVC];
    leftVC.sideMenuViewController = sideMenu;
    rightVC.sideMenuViewController = sideMenu;
    
    leftVC.homePageController = rightVC;
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = sideMenu;
    [self.window makeKeyAndVisible];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    NSSet<UITouch *> *events = [event allTouches];
    UITouch *touch = [events anyObject];
    CGPoint location = [touch locationInView:self.window];
    CGRect statusBarFram = [UIApplication sharedApplication].statusBarFrame;
    
    if (CGRectContainsPoint(statusBarFram, location)) {
        [[NSNotificationCenter defaultCenter] postNotificationName: STATUS_BAR_TAP_NOTIFICATION object:nil];
    }
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

