//
//  ContactViewController.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/7/30.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ContactViewController.h"
#import "StyleCellTableViewCell.h"
#import "ContactDetailsTableViewController.h"
#import "ContactModel.h"
#import "SQLManager.h"
@interface ContactViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,UISearchControllerDelegate>
{
    NSMutableArray *searchResultArray;
    NSMutableArray *title;
    UITableView *mytableView;
}
@property (nonatomic,strong) NSMutableArray *datalist;
@property (nonatomic,strong) UISearchController *searchController;
@end

@implementation ContactViewController


- (void)loadContacts {
    ContactModel *datatitle1 = [[ContactModel alloc] init];
    datatitle1.nickName = @"新的朋友";
    datatitle1.imageName = @"contact__ico_newfrident";
    
    
    ContactModel *datatitle2 = [[ContactModel alloc] init];
    datatitle2.nickName = @"群聊";
    datatitle2.imageName = @"contact_icon_groupchat";
    
    ContactModel *datatitle3 = [[ContactModel alloc] init];
    datatitle3.nickName = @"标签";
    datatitle3.imageName = @"Contact_icon_label";
    
    ContactModel *datatitle4 = [[ContactModel alloc] init];
    datatitle4.nickName = @"公共号";
    datatitle4.imageName = @"contact_icon_public";
    
    
    title = [[NSMutableArray alloc] init];
    NSMutableArray *array1 = [[NSMutableArray alloc] initWithObjects:datatitle1,datatitle2,datatitle3,datatitle4,nil];
    NSMutableArray *array2 =  [[SQLManager shareManger] loadAllContacts];
    
    _datalist = [[NSMutableArray alloc] init];
    NSMutableArray *array;
    for (ContactModel *data in array2) {
        NSString *firstLeter = [data.pinyin substringToIndex:1];
        BOOL flag = [title containsObject:firstLeter];
        if (!flag) {
            [title addObject:firstLeter];
            array = [[NSMutableArray alloc] init];
            [_datalist addObject:array];
        } else {
            NSInteger index = [title indexOfObject:firstLeter];
            array = [_datalist objectAtIndex:index];
        }
        [array addObject:data];
    }
    //冒泡排序
    for (int i = 0; i < title.count; i ++) {
        for (int j = i + 1; j < title.count ; j ++) {
            NSString *title1 = title[i];
            NSString *title2 = title[j];
            if (title1 > title2) {
                [title exchangeObjectAtIndex:i withObjectAtIndex:j];
                [_datalist exchangeObjectAtIndex:i withObjectAtIndex: j];
            }
        }
    }
    [title insertObject:@"" atIndex:0];
    [_datalist insertObject:array1 atIndex:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadContacts];
    self.title = @"通讯录";
    searchResultArray = [[NSMutableArray alloc] init];
    mytableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.delegate = self;
    _searchController.searchResultsUpdater = self;
    _searchController.dimsBackgroundDuringPresentation = NO;
    _searchController.obscuresBackgroundDuringPresentation = YES;
    _searchController.hidesNavigationBarDuringPresentation = YES;
    _searchController.definesPresentationContext = YES;
    [self.view addSubview:self.searchController.searchBar];
    mytableView.tableHeaderView = self.searchController.searchBar;
    mytableView.delegate = self;
    mytableView.dataSource = self;
    [self.view addSubview:mytableView];
    
    UIBarButtonItem *addBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:
                                         @"Add" style:UIBarButtonItemStylePlain target:
                                            self action:@selector(clickAddBarButtonItem:)];
    self.navigationItem.rightBarButtonItem = addBarButtonItem;
    
   }

-(void)clickAddBarButtonItem:(id)sender
{
    ContactModel *data1 = [[ContactModel alloc] init];
    data1.nickName = @"爱不等待";
    data1.imageName = @"contact1";
    
    ContactModel *data2 = [[ContactModel alloc] init];
    data2.nickName = @"如果";
    data2.imageName = @"contact2";
    
    ContactModel *data3 = [[ContactModel alloc] init];
    data3.nickName = @"a 豪";
    data3.imageName = @"contact3";
    
    ContactModel *data4 = [[ContactModel alloc] init];
    data4.nickName = @"Da 欢";
    data4.imageName = @"contact4";
    
    ContactModel *data5 = [[ContactModel alloc] init];
    data5.nickName = @"a 豪";
    data5.imageName = @"contact5";
    
    ContactModel *data6 = [[ContactModel alloc] init];
    data6.nickName = @"曾经";
    data6.imageName = @"contact6";
    
    ContactModel *data7 = [[ContactModel alloc] init];
    data7.nickName = @"小红";
    data7.imageName = @"contact7";
    
    ContactModel *data8 = [[ContactModel alloc] init];
    data8.nickName = @"李 Apple";
    data8.imageName = @"contact8";
    
    ContactModel *data9 = [[ContactModel alloc] init];
    data9.nickName = @"淡淡";
    data9.imageName = @"contact9";
    
    ContactModel *data10 = [[ContactModel alloc] init];
    data10.nickName = @"梦---";
    data10.imageName = @"contact10";

   NSMutableArray *array = [[NSMutableArray alloc] initWithObjects: data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,nil];
    for (ContactModel *data in array) {
        [[SQLManager shareManger] insertContact:data];
    }
    [self loadContacts];
    [mytableView reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
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
        return [[searchResultArray objectAtIndex:section] count];
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
        NSMutableArray *dataArray = [[NSMutableArray alloc] init];
        for (ContactModel *data in array) {
            if ([data.nickName  rangeOfString:searchString].location != NSNotFound) {
                [dataArray addObject:data];
            }
        }
        [searchResultArray addObject:dataArray];
    }
         [mytableView reloadData];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifider = @"cell";
    StyleCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifider];
    if (!cell) {
        cell = [[StyleCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifider];

    }
    NSArray *array;
    if(_searchController.active){
        array = [searchResultArray objectAtIndex:indexPath.section];
    }else
    {
        array = [_datalist objectAtIndex:indexPath.section];
    }
    
    NSArray *arr = [_datalist objectAtIndex:indexPath.section];
    ContactModel *data = [arr objectAtIndex:indexPath.row];
    [cell setValue:data];
    return cell;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select");
    if (indexPath.section >= 1) {
        NSArray *array = [_datalist objectAtIndex:indexPath.section];
        ContactModel *data = [array objectAtIndex:indexPath.row];
        ContactDetailsTableViewController *contactDetails = [[ContactDetailsTableViewController alloc] initWithContactModel:data];
        contactDetails.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:contactDetails animated:YES];
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
}

@end
