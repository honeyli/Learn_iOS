//
//  APLMineViewController.m
//  testSearch
//
//  Created by xuyanli on 16/7/24.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "APLMineViewController.h"
#import "APLResultsViewController.h"
#import "APLBaseTableViewController.h"
#import "AppDelegate.h"
@interface APLMineViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating,UISearchBarDelegate,UISearchControllerDelegate>

@end

@implementation APLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    APLResultsViewController  *resultsController= [[APLResultsViewController  alloc] init];
    UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:resultsController];
    searchController.searchResultsUpdater = self;
    searchController.searchBar.delegate =self;
    [searchController.searchBar sizeToFit];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = searchController.searchBar;
    
    searchController.dimsBackgroundDuringPresentation = NO;
    self.definesPresentationContext = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
