//
//  Message.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/7/30.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel
- (instancetype)init
{
    if (self = [super init]) {
        self.msgId = [self uuid];
    }
    return self;
}
@end
