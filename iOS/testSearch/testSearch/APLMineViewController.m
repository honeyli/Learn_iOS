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
#import "APLProduct.h"
#import "AppDelegate.h"
@interface APLMineViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating,UISearchBarDelegate,UISearchControllerDelegate>
{
    APLResultsViewController  *resultsController;
    UISearchController *searchController;
}
@end

@implementation APLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    resultsController= [[APLResultsViewController  alloc] init];
    searchController = [[UISearchController alloc] initWithSearchResultsController:resultsController];
    searchController.searchResultsUpdater = self;
    searchController.searchBar.delegate =self;
    [searchController.searchBar sizeToFit];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = searchController.searchBar;
    
    searchController.dimsBackgroundDuringPresentation = NO;
    self.definesPresentationContext = YES;
    
    APLProduct *p1 = [[APLProduct  alloc] init];
    p1.name = @"MacBook";
    p1.type = @"Computer";
    p1.inToPrice = [NSNumber numberWithDouble:2999.00];
    
    APLProduct *p2 = [[APLProduct alloc] init];
    p2.name = @"ipad";
    p2.type = @"tablet computer";
    p2.inToPrice = [NSNumber numberWithDouble:3999.12];
    
    APLProduct *p3 = [[APLProduct alloc] init];
    p3.name = @"ipone";
    p3.type = @"mobile phone";
    p3.inToPrice = [NSNumber numberWithDouble:1999.00];
    
    APLProduct *p4 = [[APLProduct alloc] init];
    p4.name = @"MEIZU";
    p4.type = @"mobile phone";
    p4.inToPrice = [NSNumber numberWithDouble:1880.32];
    
    APLProduct *p5 = [[APLProduct alloc] init];
    p5.name = @"oppp";
    p5.type = @"mobile phone";
    p5.inToPrice = [NSNumber numberWithDouble:1550.0];
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:p1,p2,p3,p4,p5, nil];
    self.datalist = array;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_datalist count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifider = @"cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifider];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifider];
    }
    APLProduct *p = [_datalist objectAtIndex:indexPath.row];
    [self configureCell:cell forProduct:p];
    return cell;
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSMutableArray *searchResults = [[NSMutableArray alloc] init];
    NSString *seachText = searchController.searchBar.text;
    NSString *strippedString = [seachText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    for (int i = 0; i < _datalist.count; i ++) {
        APLProduct *prt = [_datalist objectAtIndex:i];
        if ([prt.name rangeOfString:strippedString].location != NSNotFound) {
            [searchResults addObject:prt];
        }
    }
    resultsController.dataArray = searchResults;
    [resultsController.tableView reloadData];
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
