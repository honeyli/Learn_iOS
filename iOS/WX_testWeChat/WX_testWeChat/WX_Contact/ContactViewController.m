//
//  ContactViewController.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/7/30.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,UISearchControllerDelegate>
{
    NSMutableArray *searchResultArray;
    NSArray *title;
}
@property (nonatomic,strong) NSArray *datalist;
@property (nonatomic,strong) UISearchController *searchController;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation ContactViewController

- (void)data_method {
    NSArray *list1 = @[@{@"title":@"新的朋友",@"image":@"contact__ico_newfrident"},@{@"title":@"群聊",@"image":@"contact_icon_groupchat"},@{@"title":@"标签",@"image":@"Contact_icon_label"},@{@"title":@"公众号",@"image":@"contact_icon_public"}];
    title = [[NSArray alloc] initWithObjects:@"A",@"D",@"K"@"M"@"H", nil];
    NSArray *list2 = @[@{@"title":@"A阿豪",@"image":@"contact1"},@{@"title":@"A   特别",@"image":@"contact2"},@{@"title":@"爱不等待",@"image":@"contact3"},@{@"title":@"阿怡",@"image":@"contact4"}];
    NSArray *list3 = @[@{@"title":@"大欢",@"image":@"contact5"},@{@"title":@"淡淡",@"image":@"contact6"}];
    NSArray *list4 = @[@{@"title":@"快乐",@"image":@"contact7"}];
    NSArray *list5 = @[@{@"title":@"满城花",@"image":@"contact8"},@{@"title":@"MIN",@"image":@"contact9"},@{@"title":@"米小米",@"image":@"contact10"}];
    NSArray *list6 = @[@{@"title":@"欢欢",@"image":@"contact11"}];
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:list1,list2,list3,list4,list5,list6, nil];
    self.datalist = array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self data_method];
    self.title = @"通讯录";
    searchResultArray = [[NSMutableArray alloc] init];
    _tableView = [[UITableView alloc] init];
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.delegate = self;
    _searchController.searchResultsUpdater = self;
    _searchController.dimsBackgroundDuringPresentation = NO;
    _searchController.obscuresBackgroundDuringPresentation = YES;
    _searchController.hidesNavigationBarDuringPresentation = YES;
    _searchController.definesPresentationContext = YES;
    [self.view addSubview:self.searchController.searchBar];
    self.tableView.tableHeaderView = self.searchController.searchBar;
    _tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 20;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_searchController.active) {
        return [searchResultArray count];
    }
    return [_datalist count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_searchController.active) {
        return [[searchResultArray objectAtIndex:section ] count];
    }
    return [[_datalist objectAtIndex:section] count];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [title objectAtIndex:section];
}
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchString = [self.searchController.searchBar text];
    [searchResultArray removeAllObjects];
    for (NSArray *array in _datalist) {
        NSMutableArray *dicArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in array) {
            if ([dic [@"title"]rangeOfString:searchString].location != NSNotFound) {
                [dicArray addObject:dic];
            }
        }
        [searchResultArray addObject:dicArray];
    }
         [_tableView reloadData];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifider = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifider];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifider];
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(15, 9, 37, 37);;
        imageView.tag = 101;
        [cell.contentView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(65, 16, 80, 18);
        label.tag = 111;
        [cell.contentView addSubview:label];

    }
    NSArray *array;
    if(_searchController.active){
        array = [searchResultArray objectAtIndex:indexPath.section];
    }else
    {
        array = [_datalist objectAtIndex:indexPath.section];
    }
    NSDictionary *dictionary = [array objectAtIndex:indexPath.row];
    
    UIImageView *imageView = (UIImageView *) [cell.contentView viewWithTag:101];
    imageView.image = [UIImage imageNamed:[dictionary objectForKey:@"image"]];
    
    UILabel *label = (UILabel *) [cell.contentView viewWithTag:111];
    label.text = [dictionary objectForKey:@"title"];
    return cell;
    
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
