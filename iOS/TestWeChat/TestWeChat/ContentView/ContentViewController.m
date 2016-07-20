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
@interface ContentViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *title;
}
@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通讯录";

//    Image  *img1 = [[Image alloc] init];
//    img1.title = @"新的朋友";
//    img1.image = @"contact__ico_newfrident";
//    
//    Image *img2 = [[Image alloc] init];
//    img2.title = @"群聊";
//    img2.image = @"contact_icon_groupchat";
//    
//    Image *img3 = [[Image alloc] init];
//    img3.title = @"标签";
//    img3.image = @"Contact_icon_label";
//    
//    Image *img4 = [[Image alloc] init];
//    img4.title = @"公众号";
//    img4.image = @"contact_icon_public";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate =self;
    tableView.dataSource = self;
    tableView.rowHeight = 55;
    [self.view addSubview:tableView];
    
    title = [[NSArray alloc] initWithObjects:@"A",@"D",@"H",@"W", nil];
    NSArray *list1  = @[@{@"title":@"新的朋友", @"image":@"contact__ico_newfrident"}];
    NSArray *list2  = @[@{@"title":@"群聊", @"image":@"contact_icon_groupchat"}];
    NSArray *list3  = @[@{@"title":@"标签", @"image":@"Contact_icon_label"}];
    NSArray *list4  = @[@{@"title":@"公众号", @"image":@"contact_icon_public"}];
    NSArray *list5 = @[@{@"title":@"阿豪",@"image":@"9"},@{@"title":@"爱不等待",@"image":@"10"},@{@"title":@"A 特别",@"image":@"11"},@{@"title":@"阿怡",@"image":@"12"}];
    NSArray *list6 = @[@{@"title":@"大欢",@"image":@"13"},@{@"title":@"淡淡",@"image":@"14"}];
    NSArray *list7 = @[@{@"title":@"Honey丽",@"image":@"15"}];
    NSArray *list8 = @[@{@"title":@"忘忧草",@"image":@"16"},@{@"title":@"微笑兔子",@"image":@"17"}];
    NSArray *array = [[NSArray alloc] initWithObjects:list1,list2,list3,list4,list5,list6,list7,list8,nil];
    self.datalist = array;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 15;。
//}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   return [_datalist count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
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
        label.frame = CGRectMake(94, 23, 104, 35);
        label.tag = 111;
        [cell.contentView addSubview:label];
    }
    NSArray *array = [_datalist objectAtIndex:indexPath.section];
    NSDictionary *dic = [array  objectAtIndex:indexPath.row];
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
