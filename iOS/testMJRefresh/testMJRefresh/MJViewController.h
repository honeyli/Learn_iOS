//
//  MJViewController.h
//  testMJRefresh
//
//  Created by xuyanli on 16/9/27.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    int page;
    BOOL isFirstCome;
    int totalPage;
    BOOL isJu;
}
@property (nonatomic, strong) NSMutableArray *pictures;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSString *maxtime;

-(void)getNetworkData:(BOOL)isRefresh;
@end
