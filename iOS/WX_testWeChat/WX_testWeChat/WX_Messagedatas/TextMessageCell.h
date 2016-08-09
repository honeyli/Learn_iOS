//
//  Chatdata.h
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/7.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"
@interface TextMessageCell: UITableViewCell
-(void)setChatValue:(Message *)msg;
@end
