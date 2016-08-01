//
//  APLBaseTableViewController.h
//  pacticeSearchController
//
//  Created by xuyanli on 16/7/25.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APlProduct.h"
@interface APLBaseTableViewController : UITableViewController
-(void)configureCell:(UITableViewCell*)cell  forProduct:(APLProduct *)product;
@end
