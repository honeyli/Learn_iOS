//
//  FindViewController.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/7/30.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "FindViewController.h"

@interface FindViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发现";
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    NSArray *list1 = @[@{@"title":@"朋友圈",@"image":@"ff_IconShowAlbum"},];
    NSArray *list2 = @[@{@"title":@"扫一扫",@"image":@"ff_IconQRCode"},@{@"title":@"摇一摇",@"image":@"Find_Icon_Shake"}];
    NSArray *list3 = @[@{@"title":@"附近的人",@"image":@"ff_IconLocationService"}];
    NSArray *list4 = @[@{@"title":@"游戏",@"image":@""},@{@"title":@"漂流瓶",@"image":@"find_Icon_Bottle"}];
    NSArray *array = [[NSArray alloc] initWithObjects:list1,list2,list3,list4, nil];
    _datalist = array;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_datalist count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_datalist objectAtIndex:section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifider = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifider];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifider];
    }
    NSArray *array = [_datalist objectAtIndex:indexPath.section];
    NSDictionary *dic = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = [dic objectForKey:@"title"];
    cell.imageView.image = [UIImage imageNamed:[dic objectForKey:@"image"]];
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
