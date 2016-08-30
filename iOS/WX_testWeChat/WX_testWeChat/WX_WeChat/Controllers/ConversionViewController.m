//
//  MessageViewController.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/7/30.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ConversionViewController.h"
#import "MessageModel.h"
#import "ChatViewController.h"
#import "NewCell.h"
#import "SQLManager.h"
#import "AppDelegate.h"
#import "ContactModel.h"
@interface ConversionViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *mytableView;
}
@property (nonatomic,strong) NSMutableArray *datalist;
@end

@implementation ConversionViewController

- (void)loadData {
    _datalist = [[SQLManager shareManger] loadAllConversions];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息";
    [self loadData];
    mytableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    mytableView.delegate = self;
    mytableView.dataSource = self;
    mytableView.rowHeight = 65;
    [self.view addSubview:mytableView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sendMessage:) name:@"sendMessage" object:nil];
    [mytableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_datalist count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identidifider = @"cell";
    NewCell *cell = [tableView dequeueReusableCellWithIdentifier:identidifider];
    if (!cell) {
        cell = [[NewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identidifider];
    }
    
    ConversionDatasModel *msg = [_datalist objectAtIndex:indexPath.row];
    [cell configureCell:msg];
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[_datalist objectAtIndex:indexPath.section ]removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"响应单击事件");
    ChatViewController *chatView = [[ChatViewController alloc] initWithConversion:[_datalist objectAtIndex:indexPath.row]];
    chatView.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatView animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(void)sendMessage:(NSNotification *)notification
{
    ContactModel *model = notification.object;
    [self.tabBarController setSelectedIndex:0];
    
    ConversionDatasModel *data = [[ConversionDatasModel alloc] init];
    data.nickName = model.nickName;
    data.imageName = model.imageName;
    data.conversionID = model.contactID;
    [[SQLManager shareManger] insertConversion:data];
    
    ChatViewController *chat = [[ChatViewController alloc] initWithConversion:data];
    chat.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chat animated:YES];
    [self loadData];
    [mytableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
