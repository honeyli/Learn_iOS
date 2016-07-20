//
//  ViewController.m
//  testUItableView
//
//  Created by xuyanli on 16/7/14.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *titile;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    titile = [[NSArray alloc] initWithObjects:@"A",@"B" ,nil];
    NSArray *list1 = [[NSArray alloc] initWithObjects:@"深圳",@"上海",@"广州",@"天津",@"珠海",@"北京", nil];
    NSArray *list2 = [[NSArray alloc] initWithObjects:@"商丘",@"郑州",@"香港", nil];
    NSArray *arrary = [[NSArray alloc] initWithObjects:list1,list2, nil];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.datalist = arrary;
    //设置tableview的数据
    tableView.dataSource = self;
    //设置tableview的委托
    tableView.delegate = self;
    //设置tableview的背景图
    tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image-1"]];
    //cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    tableView.editing = NO;//是否可以编辑，默认为NO
    tableView.allowsSelection = YES;//在非编辑状态下，行是否可以选中默认为yes
    tableView.allowsSelectionDuringEditing = NO;//控制某一行时是否可以选中，默认为NO
    tableView.allowsMultipleSelection = NO;//是否可以选中多行，默认为NO
    tableView.allowsMultipleSelectionDuringEditing = NO;//在选择多行的情况下是否可以编辑
    tableView.sectionHeaderHeight = 100;//设置组表视图的头标签高度
    tableView.sectionFooterHeight = 20;//设置级表视图的尾标签高度
    [self.view addSubview:tableView];
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
//分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.datalist count];
}
//设置每一区有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [_datalist count];
    return [[_datalist objectAtIndex:section] count];
}
//设置区域的名称
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [titile objectAtIndex:section];
}
//是否允许行移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"响应单击事件");
    NSArray *arrary = [_datalist objectAtIndex:indexPath.section];
    NSString *string = [arrary objectAtIndex:indexPath.row];
   
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"您选择了%@",string ] message:@"请确认" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {NSLog(@"ok");}];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    [alertController showViewController:alertController sender:nil];
}
//设置滑动
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  YES;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifider = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indentifider];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifider ];
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.tag = 101;
        imgView.frame = CGRectMake(10, 5, 45, 45);
        [cell.contentView addSubview:imgView];
    }
    NSArray *arrary = [_datalist objectAtIndex:indexPath.section];
    NSString *string = [arrary objectAtIndex:indexPath.row];
    UIImageView *imgView = (UIImageView *)[cell.contentView viewWithTag:101];
    imgView.image = [UIImage imageNamed:@"1111"];
    cell.textLabel.text = string;
    return cell;
}

@end

