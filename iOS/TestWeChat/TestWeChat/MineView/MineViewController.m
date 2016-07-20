//
//  MineViewController.m
//  TestWeChat
//
//  Created by xuyanli on 16/7/18.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "MineViewController.h"
#import "MineImage.h"
@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*MineImage *mImage1 = [[MineImage alloc] init];
    mImage1.title = @"Honey丽";
    mImage1.image = @"head portrait";
    
    MineImage *mImage2 = [[MineImage alloc] init];
    mImage2.title = @"相册";
    mImage2.image = @"mine_photo album";
    
    MineImage *mImage3 = [[MineImage alloc] init];
    mImage3.title = @"收藏";
    mImage3.image = @"MineMyFavorites";
    
    MineImage *mImage4 = [[MineImage alloc] init];
    mImage4.title = @"钱包";
    mImage4.image = @"mine_ wallet_icon";
    
    MineImage *mImage5 = [[MineImage alloc] init];
    mImage5.title = @"卡包";
    mImage5.image = @"MineCardPackageIcon";
    
    MineImage *mImage6 = [[MineImage alloc] init];
    mImage6.title = @"表情";
    mImage6.image = @"mine_face_icon";
    
    MineImage *mImage7 = [[MineImage alloc] init];
    mImage7.title = @"设置";
    mImage7.image = @"MineSetting";*/
    self.title = @"我的";
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = 50;
    [self.view addSubview:tableView];
    tableView.rowHeight = 60;
    
    NSArray *list1 = @[@{@"title":@"Honey丽",@"image":@"touxiang"}];
    NSArray *list2 = @[@{@"title":@"相册",@"image":@"mine_photo album"},@{@"title":@"收藏",@"image":@"MineMyFavorites"}];
    NSArray *list3 = @[@{@"title":@"钱包",@"image":@"mine_ wallet_icon"},@{@"title":@"卡包",@"image":@"MineCardPackageIcon"}];
    NSArray *list4 = @[@{@"title":@"表情",@"image":@"mine_face_icon"}];
    NSArray *list5 = @[@{@"title":@"设置",@"image":@"MineSetting"}];
    NSArray *array = [[NSArray alloc] initWithObjects:list1,list2,list3,list4,list5, nil];
    _datalist = array;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15.0;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 5.0;
//}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_datalist count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_datalist  objectAtIndex:section]count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 90;
    }
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifider = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifider];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifider];
//        UIImageView *imageView = [[UIImageView alloc] init];
//        imageView.frame = CGRectMake(20, 9, 40, 40);
//        imageView.tag = 1;
//        [cell.contentView addSubview:imageView];
//        
//        UILabel *label = [[UILabel alloc] init];
//        label.frame = CGRectMake(80, 10, 206, 39);
//        label.tag = 2;
//        [cell.contentView addSubview:label];
    }
    
    NSArray *array = [_datalist objectAtIndex:indexPath.section];
    
    NSDictionary *dic = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = [dic objectForKey:@"title"];
    cell.imageView.image = [UIImage imageNamed:[dic objectForKey:@"image"]];
//    if (indexPath.section == 0) {
//        
//        imageView.image = [UIImage imageNamed:mImage.image];
//        label.frame = CGRectMake(80, 10, 206, 39);
//    } else {
//        label.frame =CGRectMake(20, 10, 206 , 40);
//        imageView.image = nil;
//    }
    
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
