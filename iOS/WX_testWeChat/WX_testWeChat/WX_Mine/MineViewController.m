//
//  MineViewController.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/7/30.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MineViewController

- (void)createArrayData {
    self.title = @"我的";
    NSArray *list1 = @[@{@"title":@"Honey",@"image":@"touxiang"}];
    NSArray *list2 = @[@{@"title":@"相册",@"image":@"mine_photo album"},@{@"title":@"收藏",@"image":@"MineMyFavorites"}];
    NSArray *list3 = @[@{@"title":@"钱包",@"image":@"mine_ wallet_icon"},@{@"title":@"卡包",@"image":@"MineCardPackageIcon"}];
    NSArray *list4 = @[@{@"title":@"表情",@"image":@"mine_face_icon"}];
    NSArray *list5 = @[@{@"title":@"设置",@"image":@"MineSetting"}];
    NSArray *array = [[NSArray alloc] initWithObjects:list1,list2,list3,list4,list5, nil];
    _datalist = array;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createArrayData];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = 55;
    [self.view addSubview:tableView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 15;
    }
    return 18;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_datalist count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_datalist objectAtIndex:section ] count];
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
    cell.imageView.layer.cornerRadius = 5;
    cell.imageView.layer.masksToBounds = YES;
    if (indexPath.section == 0) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"touxiang"];
        imageView.frame = CGRectMake(18, 143, 101, 103);
    }else
    {
        cell.imageView.image = [UIImage imageNamed:[dic objectForKey:@"image"]];
    }
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
