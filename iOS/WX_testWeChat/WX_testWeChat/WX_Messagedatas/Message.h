//
//  Message.h
//  WX_testWeChat
//
//  Created by xuyanli on 16/7/30.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject
@property (nonatomic) BOOL isMyself;
@property (nonatomic,strong) NSString *nickName;
@property (nonatomic,strong) NSString *time;
@property (nonatomic,strong) NSString *message;
@property (nonatomic,strong) NSString *imageName;
@end
