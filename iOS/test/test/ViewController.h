//
//  ViewController.h
//  test
//
//  Created by xuyanli on 16/7/15.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) NSArray *dataList;
@property(nonatomic,strong) UITableView *tableView;
@end

