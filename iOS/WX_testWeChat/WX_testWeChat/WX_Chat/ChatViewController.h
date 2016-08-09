//
//  ChatViewController.h
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/2.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"
@interface ChatViewController : UIViewController
-(id) initWithMessage:(Message *)msg;
@property(nonatomic,strong)NSMutableArray *resultArray;
@end
