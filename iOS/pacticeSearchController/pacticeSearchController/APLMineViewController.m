//
//  APLMineViewController.m
//  pacticeSearchController
//
//  Created by xuyanli on 16/7/25.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "APLMineViewController.h"

@interface APLMineViewController ()<UISearchControllerDelegate,UISearchBarDelegate,UISearchResultsUpdating>
{
    UISearchController *searchController;
    APLResultsViewController *resultsController;
}
@end

@implementation APLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    searchController = [[UISearchController alloc] initWithSearchResultsController:resultsController];
    [searchController.searchBar sizeToFit];
    self.tableView.tableHeaderView = searchController.searchBar;
    searchController.dimsBackgroundDuringPresentation = NO;
    searchController.definesPresentationContext = YES;

    resultsController = [[APLResultsViewController alloc] init];
    
    APLProduct *p1 = [[APLProduct alloc] init];
    p1.name = @"MacBook";
    p1.yearIntroduced = [NSNumber numberWithInteger:2009];
    p1.version = [NSNumber numberWithDouble:11.0];
    p1.inToPrice = [NSNumber numberWithDouble:2999.0];
    p1.hardwareType = @"computer";

    
    APLProduct *p2 = [[APLProduct alloc] init];
    p2.name = @"ipone";
    p2.yearIntroduced = [NSNumber numberWithInteger:2008];
    p2.version = [NSNumber numberWithDouble:11.0];
    p2.inToPrice = [NSNumber numberWithDouble:2999.0];
    p2.hardwareType = @"ipone";
    
    APLProduct *p3 = [[APLProduct alloc] init];
    p3.name = @"ipone";
    p3.yearIntroduced = [NSNumber numberWithInteger:2008];
    p3.version = [NSNumber numberWithDouble:11.0];
    p3.inToPrice = [NSNumber numberWithDouble:2999.0];
    p3.hardwareType = @"ipone";
    
    APLProduct *p4 = [[APLProduct alloc] init];
    p4.name = @"ipone";
    p4.yearIntroduced = [NSNumber numberWithInteger:2008];
    p4.version = [NSNumber numberWithDouble:11.0];
    p4.inToPrice = [NSNumber numberWithDouble:2999.0];
    p4.hardwareType = @"ipone";
    
    NSMutableArray  *array = [[NSMutableArray alloc] initWithObjects:p1,p2,p3,p4, nil];
    _datalist = array;
    
    searchController.searchBar.delegate = self;
    searchController.delegate = self;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    searchController.searchResultsUpdater = self;
    
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_datalist count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifider = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifider];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifider];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    APLProduct *p = [_datalist objectAtIndex:indexPath.row];
    [self configureCell:cell forProduct:p];
    return cell;
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchText = searchController.searchBar.text;
    NSMutableArray *searchResult = [[NSMutableArray alloc] init];
    NSString *strippedString = [searchText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    for (int i = 0; i < _datalist.count; i++) {
        APLProduct *prt = [_datalist objectAtIndex:i];
        if ([prt.name rangeOfString:strippedString].location != NSNotFound) {
            [searchResult addObject:prt];
        }
    }
    resultsController.dataArray = searchResult;
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
