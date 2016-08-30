//
//  AppDelegate.h
//  MyThread
//
//  Created by xuyanli on 16/8/16.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    int tickets;//票
    int count;
    NSThread *ticketsThreadOne;
    NSThread *ticketsThreadTwo;
    NSThread *ticketsThreadThree;
    NSCondition *ticketsCondition;
    NSLock *theLock;
    
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *viewController;

@end

