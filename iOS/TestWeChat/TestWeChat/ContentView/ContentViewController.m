//
//  ContentViewController.m
//  TestWeChat
//
//  Created by xuyanli on 16/7/18.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ContentViewController.h"
#import "Image.h"
#import "MessageViewController.h"
@interface ContentViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,UISearchControllerDelegate>
{
    NSArray *title;
    NSMutableArray *searchResultArray;
}
@property(nonatomic,strong) NSArray *datalist;
@property(nonatomic,strong) UISearchController *searchController;
@property(nonatomic,strong) UITableView *mytableView;
@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通讯录";
    searchResultArray = [[NSMutableArray alloc] init];
    
    _mytableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.mytableView.delegate =self;
    self.mytableView.dataSource = self;
    self.mytableView.rowHeight = 55;
    [self.view addSubview:_mytableView];
    
    title = [[NSArray alloc] initWithObjects:@"",@"A",@"D",@"H",@"W", nil];
    NSArray *list1  = @[@{@"title":@"新的朋友", @"image":@"contact__ico_newfrident"},@{@"title":@"群聊", @"image":@"contact_icon_groupchat"},@{@"title":@"标签", @"image":@"Contact_icon_label"},@{@"title":@"公众号", @"image":@"contact_icon_public"}];
    
    NSArray *list2 = @[@{@"title":@"阿豪",@"image":@"9"},@{@"title":@"爱不等待",@"image":@"10"},@{@"title":@"A 特别",@"image":@"11"},@{@"title":@"阿怡",@"image":@"12"}];
    NSArray *list3 = @[@{@"title":@"大欢",@"image":@"13"},@{@"title":@"淡淡",@"image":@"14"}];
    NSArray *list4 = @[@{@"title":@"Honey丽",@"image":@"15"}];
    NSArray *list5 = @[@{@"title":@"忘忧草",@"image":@"16"},@{@"title":@"微笑兔子",@"image":@"17"}];
    NSArray *array = [[NSArray alloc] initWithObjects:list1,list2,list3,list4,list5,nil];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.delegate = self;
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.hidesNavigationBarDuringPresentation = YES;
    self.searchController.obscuresBackgroundDuringPresentation = YES;
    self.definesPresentationContext = YES;
    [self.view addSubview:self.searchController.searchBar];
    _mytableView.tableHeaderView = self.searchController.searchBar;
    self.datalist = array;
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSLog(@"updateSearchResultsForSearchController");
    NSString *searchString = [self.searchController.searchBar text];
    [searchResultArray removeAllObjects];
    for (NSArray *array in _datalist) {
        NSMutableArray *dicArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in array) {
            if ([dic[@"title"] rangeOfString:searchString].location != NSNotFound) {
                [dicArray addObject:dic];
            }
        }
        [searchResultArray addObject: dicArray];
    }
   
    //过滤数据
    //刷新表格
    [_mytableView reloadData];
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

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [title objectAtIndex:section ];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_searchController.active) {
        return [[searchResultArray objectAtIndex:section] count];
    }
    return [[_datalist  objectAtIndex:section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *indentifider = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifider];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifider];

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
    if (_searchController.active) {
        array = [searchResultArray objectAtIndex:indexPath.section];
    } else {
        array = [_datalist objectAtIndex:indexPath.section];
    }
    NSDictionary *dic = [array  objectAtIndex:indexPath.row];
//    cell.textLabel.text = [dic objectForKey:@"title"];
//    cell.imageView.image = [UIImage imageNamed:[dic objectForKey:@"image"]];
        UIImageView *imageView = (UIImageView *) [cell.contentView viewWithTag:101];
    imageView.image = [UIImage imageNamed:[dic objectForKey:@"image"]];
    
    UILabel *label = (UILabel *) [cell.contentView viewWithTag:111];
    label.text = [dic objectForKey:@"title"];
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
