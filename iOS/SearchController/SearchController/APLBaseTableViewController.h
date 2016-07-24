//
//  APLBaseTableViewController.h
//  SearchController
//
//  Created by xuyanli on 16/7/23.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APLProduct.h"
@interface APLBaseTableViewController : UITableViewController
-(void)configureCell:(UITableViewCell *)cell  forProduct:(APLProduct *)product;
@end
