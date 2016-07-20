//
//  ViewController.h
//  testUItableView
//
//  Created by xuyanli on 16/7/14.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) NSArray *datalist;
@property(nonatomic,strong) UITableView *tableView;
@end

