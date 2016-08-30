//
//  Message.h
//  WX_testWeChat
//
//  Created by xuyanli on 16/7/30.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,MsgType) {
    
    TypeMsgText=0,
    TypeMsgImage,
    
};
@interface MessageModel : NSObject
@property (nonatomic) BOOL isMyself;
@property (nonatomic,strong) NSString *nickName;
@property (nonatomic,strong) NSString *time;
@property (nonatomic,strong) NSString *message;
@property (nonatomic,strong) NSString *imageName;
@property (nonatomic,strong) NSString *msgId;
@property (nonatomic,strong) NSString *conversionID;
@property (nonatomic,assign) MsgType messageType;
@end
