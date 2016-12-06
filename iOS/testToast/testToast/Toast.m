//
//  Toast.m
//  testToast
//
//  Created by xuyanli on 16/12/3.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "Toast.h"
#import "ToastLabel.h"
@implementation Toast

/*
 *实现声明单例的方法GCD
 *
 */
+(instancetype)shareInstance{
    static Toast *single = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        single = [[Toast alloc] init];
    });
    return single;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        toastLabel = [[ToastLabel alloc] init];
        countTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(changeTime) userInfo:nil repeats:YES];
        countTimer.fireDate = [NSDate distantFuture]; //关闭定时器
    }
    return self;
}

-(void)makeToast:(NSString *)message duration:(CGFloat)duration {
    if ([message length] == 0) {
        return;
    }
    [toastLabel setMessageText:message];
    [[[UIApplication sharedApplication] keyWindow] addSubview:toastLabel];
    toastLabel.alpha = 0.8;
    countTimer.fireDate = [NSDate distantPast]; //开启定时器
    changeCount = duration;
}

-(void)changeTime {
    if (changeCount-- <= 0) {
        countTimer.fireDate = [NSDate distantFuture];
        [UIView animateWithDuration:0.2f animations:^{
            toastLabel.alpha = 0;
        } completion:^(BOOL finished) {
            [toastLabel removeFromSuperview];
        }];
    }
}
@end
