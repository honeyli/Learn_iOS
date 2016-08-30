//
//  ChatViewController.h
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/2.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"
#import "ConversionDatasModel.h"
#import "ImageCellModelTableViewCell.h"
@interface ChatViewController : UIViewController
-(id) initWithConversion:(ConversionDatasModel *)model;
@end
