//
//  AppDelegate.m
//  MyThread
//
//  Created by xuyanli on 16/8/16.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    tickets = 100;
    count = 0;
    theLock = [[NSLock alloc] init];
    //锁对象
    ticketsCondition = [[NSCondition alloc] init];
    ticketsThreadOne = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    [ticketsThreadOne setName:@"Thread - 1"];
    [ticketsThreadOne start];
    
    ticketsThreadTwo = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    [ticketsThreadTwo setName:@"Thread - 2"];
    [ticketsThreadTwo start];
    
    ticketsThreadThree = [[NSThread alloc] initWithTarget:self selector:@selector(run3) object:nil];
    [ticketsThreadThree setName:@"Thread - 3"];
    [ticketsThreadThree start];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.viewController = [[UIViewController alloc] init];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(void)run3
{
    while (YES) {
        [ticketsCondition lock];
        [NSThread sleepForTimeInterval:3];
        [ticketsCondition signal];
        [ticketsCondition lock];
        
    }
}

-(void)run
{
    while (true) {
        //上锁
        [theLock lock];
        if (tickets >= 0) {
            [NSThread sleepForTimeInterval:0.09];
            count = 100 - tickets;
            NSLog(@"当前票数是：%d, 售出：%d, 线程名：%@", tickets, count, [[NSThread currentThread] name]);
            tickets --;
        }else
        {
            break;
        }
        [theLock unlock];
        [ticketsCondition unlock];
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
