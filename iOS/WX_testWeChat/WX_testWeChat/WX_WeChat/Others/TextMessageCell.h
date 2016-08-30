//
//  Chatdata.h
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/7.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"
@interface TextMessageCell: UITableViewCell
-(void)setChatValue:(MessageModel *)msg;
@end
