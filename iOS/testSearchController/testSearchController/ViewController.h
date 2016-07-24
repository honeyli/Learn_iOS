//
//  ViewController.h
//  testSearchController
//
//  Created by xuyanli on 16/7/21.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property(nonatomic,strong) UITableView *mytableView;
@property(nonatomic,strong) UISearchController *searchController;
//数据源
@property(nonatomic,strong) NSMutableArray *datalist;
@property(nonatomic,strong) NSMutableArray *searchlist;
@end

