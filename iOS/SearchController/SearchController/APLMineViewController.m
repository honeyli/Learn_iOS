//
//  APLMineViewController.m
//  SearchController
//
//  Created by xuyanli on 16/7/23.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "APLMineViewController.h"
#import "AppDelegate.h"
#import "APLProduct.h"
#import "APLResultsViewController.h"
#import "APLBaseTableViewController.h"
@interface APLMineViewController ()<UISearchResultsUpdating,UISearchControllerDelegate, UISearchBarDelegate>
{
    UISearchController *searchController;
    APLResultsViewController *resultsController;
}
@end

@implementation APLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    resultsController = [[APLResultsViewController alloc] init];
    searchController = [[UISearchController alloc] initWithSearchResultsController:resultsController];
    searchController.searchResultsUpdater = self;
    [searchController.searchBar sizeToFit];
    self.tableView.tableHeaderView = searchController.searchBar;
    
    searchController.delegate = self;
    searchController.searchBar.delegate = self;
    searchController.dimsBackgroundDuringPresentation = NO;
    self.definesPresentationContext = YES;
    
    APLProduct *p1 = [[APLProduct alloc] init];
    p1.title = @"MacBook";
    p1.yearIntroduced = [NSNumber numberWithInteger:2009];
    p1.version = [NSNumber numberWithDouble:11.0];
    p1.inToPrice = [NSNumber numberWithDouble:2999.0];
    p1.hardwareType = @"computer";
    
    APLProduct *p2 = [[APLProduct alloc] init];
    p2.title = @"ipone";
    p2.yearIntroduced = [NSNumber numberWithInteger:2008];
    p2.version = [NSNumber numberWithDouble:11.0];
    p2.inToPrice = [NSNumber numberWithDouble:2999.0];
    p2.hardwareType = @"ipone";
    
    APLProduct *p3 = [[APLProduct alloc] init];
    p3.title = @"ipone";
    p3.yearIntroduced = [NSNumber numberWithInteger:2008];
    p3.version = [NSNumber numberWithDouble:11.0];
    p3.inToPrice = [NSNumber numberWithDouble:2999.0];
    p3.hardwareType = @"ipone";

    APLProduct *p4 = [[APLProduct alloc] init];
    p4.title = @"ipone";
    p4.yearIntroduced = [NSNumber numberWithInteger:2008];
    p4.version = [NSNumber numberWithDouble:11.0];
    p4.inToPrice = [NSNumber numberWithDouble:2999.0];
    p4.hardwareType = @"ipone";

    NSMutableArray  *array = [[NSMutableArray alloc] initWithObjects:p1,p2,p3,p4, nil];
    _datalist = array;
    [self.tableView reloadData];
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
#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_datalist count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *indentifider = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indentifider];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:indentifider ];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    APLProduct *prt = [_datalist objectAtIndex:indexPath.row];
    [self configureCell:cell forProduct:prt];
    return cell;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *seachText = searchController.searchBar.text;
    NSMutableArray *searchResults = [[NSMutableArray alloc] init];
    NSString *strippedString = [seachText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    for (int i = 0; i < _datalist.count; i++) {
        APLProduct *prt = [_datalist objectAtIndex:i];
        if ([prt.title rangeOfString:strippedString].location != NSNotFound) {
            [searchResults addObject:prt];
        }
    }
    resultsController.dataArray = searchResults;
    [resultsController.tableView reloadData];
}
@end
