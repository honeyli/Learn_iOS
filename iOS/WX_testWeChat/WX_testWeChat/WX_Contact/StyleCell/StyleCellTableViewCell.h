//
//  StyleCellTableViewCell.h
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/4.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactViewController.h"
#import "ContactDatas.h"
@interface StyleCellTableViewCell : UITableViewCell
-(void)setValue:(ContactDatas *)data;
@end
