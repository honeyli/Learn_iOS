//
//  ToastLabel.m
//  testToast
//
//  Created by xuyanli on 16/12/3.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ToastLabel.h"

#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation ToastLabel

-(instancetype)init {
    self = [super init];
    if (self) {
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor blackColor];
        self.numberOfLines = 0;
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = [UIColor whiteColor];
        self.font = [UIFont systemFontOfSize:15];
    }
    return self;
}


/*
 * 设置显示的文字
 *@param text 文字字体
 */
-(void)setMessageText:(NSString *)text {
    [self setText:text];
    self.frame = CGRectMake((KScreenWidth - 50) / 2, (kScreenHeight) - 50 / 2, 50, 50);
}
@end
