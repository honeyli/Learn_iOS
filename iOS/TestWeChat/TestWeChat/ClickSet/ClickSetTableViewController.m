//
//  clickSetTableViewController.m
//  TestWeChat
//
//  Created by xuyanli on 16/7/26.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ClickSetTableViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
@interface ClickSetTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ClickSetTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *mytableView = [[UITableView alloc] init];
    mytableView.delegate = self;
    mytableView.dataSource = self;
    [self.view addSubview:mytableView];
    
    NSMutableArray *list1 = [[NSMutableArray alloc] initWithObjects:@"新消息提醒", @"勿扰模式", @"聊天", @"隐私", @"通用",@"账号与安全", nil];
    NSMutableArray *list2 = [[NSMutableArray alloc] initWithObjects:@"关于微信",@"退出", nil];
    NSMutableArray * array = [[NSMutableArray alloc] initWithObjects:list1,list2, nil];
    _dataArray = array;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_dataArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_dataArray objectAtIndex:section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Configure the cell...
    static NSString *identifider = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifider];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifider];
    }
    NSMutableArray *array = [_dataArray objectAtIndex:indexPath.section];
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
    if (section == 0) {
        return 0;
    }
    return 20;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了");
    if (indexPath.row == [_dataArray count] - 1) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *blankAction = [UIAlertAction actionWithTitle:@"退出当前账号" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            
            LoginViewController *login = [[LoginViewController alloc] init];
            [self.tabBarController  presentViewController:login animated:NO completion:^(){}];
        } ];
        UIAlertAction *shutdownAction = [UIAlertAction actionWithTitle:@"关闭微信" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"关闭后你的朋友可能无法及时联系上你，还可能会影响到微信的使用体验。" preferredStyle:UIAlertControllerStyleActionSheet];
            UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            UIAlertAction *shutDown = [UIAlertAction actionWithTitle:@"关闭微信" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:cancleAction];
            [alertController addAction:shutDown];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancelAction];
        [alertController addAction:blankAction];
        [alertController addAction:shutdownAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}
@end
