//
//  NewCellStyle.h
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/3.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConversionDatasModel.h"
@interface NewCell : UITableViewCell
-(void)configureCell:(ConversionDatasModel *)msg;
@end
