//
//  ViewController.m
//  test
//
//  Created by xuyanli on 16/7/15.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *title;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];

    NSMutableArray *list1 = [[NSMutableArray alloc] initWithObjects:@"深圳",@"上海",@"北京", nil];
    NSMutableArray *list2 = [[NSMutableArray alloc] initWithObjects:@"郑州",@"商丘",@"天津", nil];
    NSMutableArray *list3 = [[NSMutableArray alloc] initWithObjects:@"香港",@"珠海",@"新加坡", nil];
  NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:list1,list2,list3, nil];
    self.dataList = array;
   
    title = [[NSMutableArray alloc] initWithObjects:@"A",@"B",@"C", nil];
   }

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataList count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_dataList objectAtIndex:section]count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [title objectAtIndex:section];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  YES;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击响应事件");
    NSMutableArray *myarray = [_dataList objectAtIndex:indexPath.section];//取区
    NSString *string = [myarray objectAtIndex:indexPath.row];//取行
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"您选择了：%@",string] message:@"请确认" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    [alertController showViewController:alertController sender:nil];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indertifider = @"indertifider";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indertifider];
    if (!cell) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:
                indertifider];
        
    }
    
    NSMutableArray *myarray  =  [_dataList objectAtIndex:indexPath.section];//取区
    NSString *string = [myarray objectAtIndex:indexPath.row];//取行
    cell.textLabel.text = string;
    return cell;
 
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[_dataList objectAtIndex:indexPath.section] removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
 }
}
@end
