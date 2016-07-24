//
//  ViewController.m
//  testSearchController
//
//  Created by xuyanli on 16/7/21.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,UISearchControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *list1 = [[NSMutableArray alloc] initWithObjects:@"深圳",@"上海",@"广州",@"天津",@"珠海",@"北京", nil];
    NSMutableArray *list2 = [[NSMutableArray alloc] initWithObjects:@"商丘",@"郑州",@"香港", nil];
    NSMutableArray *arrary = [[NSMutableArray alloc] initWithObjects:list1,list2, nil];
    _datalist = arrary;
    _searchlist = [NSMutableArray array];
    
    _mytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20,[UIScreen  mainScreen].bounds.size.width ,[UIScreen  mainScreen].bounds.size.height)];
    _mytableView.delegate = self;
    _mytableView.dataSource = self;
    _mytableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    //设置代理
    _searchController.delegate = self;
    _searchController.searchResultsUpdater= self;
    
    //设置UISearchController的显示属性，以下3个属性默认为YES
    //搜索时，背景变暗色
    _searchController.dimsBackgroundDuringPresentation = NO;
    //搜索时，背景变模糊
    _searchController.obscuresBackgroundDuringPresentation = NO;
    //隐藏导航栏
    _searchController.hidesNavigationBarDuringPresentation = NO;
    
    _searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0);
    
    // 添加 searchbar 到 headerview
    self.mytableView.tableHeaderView = _searchController.searchBar;
    [self.view addSubview:_mytableView];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_datalist count];
    return [_searchlist count];
}
//返回单元格内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *flag=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:flag];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:flag];
    }
    if (self.searchController.active) {
        [cell.textLabel setText:self.searchlist [indexPath.row]];
    }
    else{
        [cell.textLabel setText:self.datalist[indexPath.row]];
    }
    return cell;
}
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSLog(@"updateSearchResultsForSearchController");
    NSString *searchString = [self.searchController.searchBar text];
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
    if (self.searchlist!= nil) {
        [self.searchlist removeAllObjects];
    }
    //过滤数据
    self.searchlist= [NSMutableArray arrayWithArray:[_datalist filteredArrayUsingPredicate:preicate]];
    //刷新表格
    [self.mytableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
