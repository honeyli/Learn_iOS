 //
//  Toast.h
//  testToast
//
//  Created by xuyanli on 16/12/3.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToastLabel.h"

@interface Toast : NSObject
{
    ToastLabel *toastLabel;
    NSTimer *countTimer;
    CGFloat changeCount;
}

+(instancetype)shareInstance;

-(void)makeToast:(NSString *)message duration:(CGFloat) duration;
@end
