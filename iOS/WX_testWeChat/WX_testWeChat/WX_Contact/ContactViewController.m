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
#import "ContactDatas.h"
@interface ContactViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,UISearchControllerDelegate>
{
    NSMutableArray *searchResultArray;
    NSMutableArray *title;
}
@property (nonatomic,strong) NSMutableArray *datalist;
@property (nonatomic,strong) UISearchController *searchController;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation ContactViewController

- (void)data_method {
    ContactDatas *datatitle1 = [[ContactDatas alloc] init];
    datatitle1.name = @"新的朋友";
    datatitle1.image = @"contact__ico_newfrident";
    
    
    ContactDatas *datatitle2 = [[ContactDatas alloc] init];
    datatitle2.name = @"群聊";
    datatitle2.image = @"contact_icon_groupchat";
    
    ContactDatas *datatitle3 = [[ContactDatas alloc] init];
    datatitle3.name = @"标签";
    datatitle3.image = @"Contact_icon_label";
    
    ContactDatas *datatitle4 = [[ContactDatas alloc] init];
    datatitle4.name = @"公共号";
    datatitle4.image = @"contact_icon_public";
    
    ContactDatas *data1 = [[ContactDatas alloc] init];
    data1.name = @"爱不等待";
    data1.image = @"contact1";
    data1.gender = @"女";
    
    ContactDatas *data2 = [[ContactDatas alloc] init];
    data2.name  = @"大欢";
    data2.image = @"contact2";
    data2.gender = @"高欢";

    
    ContactDatas *data3 = [[ContactDatas alloc] init];
    data3.name = @"A  特别";
    data3.image = @"contact3";
    data3.gender = @"男";
    
    ContactDatas *data4 = [[ContactDatas alloc] init];
    data4.name = @"淡淡";
    data4.image = @"contact4";
    data4.gender = @"女";
    
    ContactDatas *data5 = [[ContactDatas alloc] init];
    data5.name = @"快乐是情人";
    data5.image = @"contact5";
    data5.gender = @"男";
    
    ContactDatas *data6 = [[ContactDatas alloc] init];
    data6.name = @"冷夜雨";
    data6.image = @"contact6";
    data6.gender = @"男";
    
    ContactDatas *data7 = [[ContactDatas alloc] init];
    data7.name = @"李apple";
    data7.image = @"contact7";
    data7.gender = @"女";
    
    ContactDatas *data8 = [[ContactDatas alloc] init];
    data8.name = @"梦烟";
    data8.image = @"contact8";
    data8.gender = @"女";
    
    ContactDatas *data9 = [[ContactDatas alloc] init];
    data9.name = @"Mr.L";
    data9.image = @"contact9";
    data9.gender = @"男";
    
    ContactDatas *data10 = [[ContactDatas alloc] init];
    data10.name = @"BBB";
    data10.image = @"contact9";
    data10.gender = @"男";
    
    title = [[NSMutableArray alloc] initWithObjects:@"", nil];
    NSMutableArray *array1 = [[NSMutableArray alloc] initWithObjects:datatitle1,datatitle2,datatitle3,datatitle4,nil];
    NSMutableArray *array2 = [[NSMutableArray alloc] initWithObjects: data1,data2,data3,data4,data5,data6,data7,data8,data9,data10, nil];
    
    _datalist = [[NSMutableArray alloc] initWithObjects:array1, nil];
    NSMutableArray *array;
    for (ContactDatas *data in array2) {
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
        NSString *title1 = title[i];
        for (int j = i+1;j < title.count;j ++) {
            NSString *title2 = title[j];
            if (title1 > title2) {
                [title exchangeObjectAtIndex:i withObjectAtIndex:j];
                [_datalist exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self data_method];
    self.title = @"通讯录";
    searchResultArray = [[NSMutableArray alloc] init];
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
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
    
    CGFloat Width = self.view.bounds.size.width;
    
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
        for (ContactDatas *data in array) {
            if ([data.name  rangeOfString:searchString].location != NSNotFound) {
                [dataArray addObject:data];
            }
        }
        [searchResultArray addObject:dataArray];
    }
         [_tableView reloadData];
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
    ContactDatas *data = [arr objectAtIndex:indexPath.row];
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
        ContactDatas *data = [array objectAtIndex:indexPath.row];
        ContactDetailsTableViewController *contactDetails = [[ContactDetailsTableViewController alloc] initWithContactDatas:data];
        contactDetails.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:contactDetails animated:YES];
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
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
