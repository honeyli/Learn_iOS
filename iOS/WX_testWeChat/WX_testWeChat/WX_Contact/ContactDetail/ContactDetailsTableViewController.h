//
//  ContactDetailsTableViewController.h
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/4.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactDatas.h"
@interface ContactDetailsTableViewController : UIViewController
@property (nonatomic,strong) NSArray *datalist;
-(id)initWithContactDatas:(ContactDatas *)data;
@end
