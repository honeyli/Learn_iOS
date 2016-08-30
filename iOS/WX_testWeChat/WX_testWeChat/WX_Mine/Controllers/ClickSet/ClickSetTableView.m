//
//  ClickSetTableView.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/12.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ClickSetTableView.h"
#import "LoginViewController.h"
#import "OtherLogin.h"
@interface ClickSetTableView ()<UITableViewDelegate,UITableViewDataSource>
{
    NSDictionary *dictionary;
}
@end

@implementation ClickSetTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    NSMutableArray *list1 = [[NSMutableArray alloc] initWithObjects:
                             @"新消息提醒",
                             @"勿扰模式",
                             @"聊天",
                             @"隐私",
                             @"通用",
                             @"账号与安全", nil];
    NSMutableArray *list2 = [[NSMutableArray alloc] initWithObjects:
                             @"关于微信",
                             @"退出", nil];
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:list1,list2, nil];
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
    NSString *str = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = str;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [_datalist count] - 1) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *blankAction = [UIAlertAction actionWithTitle:@"退出当前账号" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            LoginViewController *login = [[LoginViewController alloc] init];
            [self.tabBarController  presentViewController:login animated:YES completion:^(){}];
        } ];
        UIAlertAction *shutdownAction = [UIAlertAction actionWithTitle:@"关闭微信" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"关闭后你的朋友可能无法及时联系上你，还可能会影响到微信的使用体验。" preferredStyle:UIAlertControllerStyleActionSheet];
            UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            UIAlertAction *shutDown = [UIAlertAction actionWithTitle:@"关闭微信" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                
                OtherLogin *other = [[OtherLogin alloc] init];
                [other setImage:dictionary];
                [self.tabBarController presentViewController:other animated:YES completion:nil];
            }];
            [alertController addAction:cancleAction];
            [alertController addAction:shutDown];
            [self presentViewController:alertController animated:YES completion:nil];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancelAction];
        [alertController addAction:blankAction];
        [alertController addAction:shutdownAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
@end
