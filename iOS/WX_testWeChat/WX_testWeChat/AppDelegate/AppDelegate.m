//
//  AppDelegate.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/7/30.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "AppDelegate.h"
#import "ConversionViewController.h"
#import "ContactViewController.h"
#import "MineViewController.h"
#import "FindViewController.h"
#import "GuideViewController.h"
#import "LoginViewController.h"
@interface AppDelegate ()
{
    UITabBarController *tabBar;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self setupNavBar];
    
    ConversionViewController  *messageView  = [[ConversionViewController alloc] init];
    messageView.tabBarItem.title                  = @"微信";
    messageView.tabBarItem.image              = [UIImage imageNamed:@"tabbar_mainframe"];
    messageView.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_mainframeHL"]
                                                                         imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav1                   = [[UINavigationController alloc] initWithRootViewController:messageView];


    ContactViewController *contactView = [[ContactViewController alloc] init];
    contactView.tabBarItem.title              = @"通讯录";
    contactView.tabBarItem.image          = [UIImage imageNamed:@"tabbar_contacts"];
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
    

    tabBar = [[UITabBarController alloc] init];
    tabBar.viewControllers = @[nav1,nav2,nav3,nav4];
    
    
    self.window.rootViewController = tabBar;
    [self.window makeKeyAndVisible];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL isLogin = [userDefaults boolForKey:@"login"];
    BOOL isGuide = [userDefaults boolForKey:@"guide1"];
    if (!isLogin && !isGuide) {
        LoginViewController *login = [[LoginViewController alloc] init];
        login.view.alpha = 0;
        [tabBar presentViewController:login animated:NO completion:nil];
        GuideViewController *guideView = [[GuideViewController alloc] init];
        [login presentViewController:guideView animated:NO completion:nil];
        login.view.alpha = 1;
        tabBar.view.alpha = 1;
    }else if (!isLogin && isGuide)
    {
        LoginViewController *login = [[LoginViewController alloc] init];
        login.view.alpha = 0;
        [tabBar presentViewController:login animated:NO completion:nil];
        login.view.alpha = 1;
    }
    else if (isLogin && !isGuide)
    {
        GuideViewController *guide = [[GuideViewController alloc] init];
        guide.view.alpha = 0;
        [tabBar presentViewController:guide animated:NO completion:nil];
        guide.view.alpha = 1;
    }

    return YES;
}

- (void)setupNavBar
{
    //此种方法设置后，应用内所有的navgationBar都会有统一的样式
    UINavigationBar *bar = [UINavigationBar appearance];
    CGFloat rgb = 0.1;
    bar.barTintColor = [UIColor colorWithRed:rgb green:rgb blue:rgb alpha:0.9];
    bar.tintColor = [UIColor whiteColor];
    bar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};    
    //status bar的字体为黑色
    //导航栏的背景色是白色，状态栏的背景色也是白色。
    //self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
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
