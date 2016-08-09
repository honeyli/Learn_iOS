//
//  MessageViewController.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/7/30.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "MessageViewController.h"
#import "Message.h"
#import "ChatViewController.h"
#import "NewCell.h"
@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>
{

}
@property (nonatomic,strong) NSMutableArray *datalist;
@end

@implementation MessageViewController


- (void)createData {
    self.title = @"消息";
    Message *msg1 = [[Message alloc] init];
    msg1.nickName = @"曾经";
    msg1.imageName = @"Message_image";
    msg1.time = @"7月10日";
    msg1.message = @"hello~";
    
    Message *msg2 = [[Message alloc] init];
    msg2.nickName = @"新生活";
    msg2.imageName = @"Message_image1";
    msg2.time = @"8月1日";
    msg2.message = @"你现在在干嘛呢?方便吗?";
    
    Message *msg3 = [[Message alloc] init];
    msg3.imageName = @"Message_image2";
    msg3.nickName = @"假如没有如果";
    msg3.time = @"周五";
    msg3.message = @"happy new year！！！";
    
    Message *msg4 = [[Message alloc] init];
    msg4.imageName = @"Message_image3";
    msg4.nickName = @"你似不似傻~";
    msg4.time = @"7月1日";
    msg4.message = @"最近过的怎么样";
    
    Message *msg5 = [[Message alloc] init];
    msg5.imageName = @"Message_image4";
    msg5.nickName = @"法海你不懂爱";
    msg5.time = @"7月8日";
    msg5.message = @"🐷你生日快乐";
    
    Message *msg6 = [[Message alloc] init];
    msg6.imageName = @"Message_image5";
    msg6.nickName = @"一诺千金";
    msg6.time = @"7月8日";
    msg6.message = @"呼呼~";
    
    Message *msg7 = [[Message alloc] init];
    msg7.imageName = @"Message_image6";
    msg7.nickName = @"凉**白开";
    msg7.time = @"周六";
    msg7.message = @"最近有没有什么好玩的事情！";
    
    Message *msg8 = [[Message alloc] init];
    msg8.imageName = @"Message_image7";
    msg8.nickName = @"traller";
    msg8.time = @"7月10日";
    msg8.message = @"恩恩好的。";
    
    Message *msg9 = [[Message alloc] init];
    msg9.imageName = @"Message_image8";
    msg9.nickName = @"Butter girl";
    msg9.time = @"周日";
    msg9.message = @"晚安";
    
    Message *msg10 = [[Message alloc] init];
    msg10.imageName = @"Message_image9";
    msg10.nickName = @"幻城";
    msg10.time = @"8月1日";
    msg10.message = @"一块去玩吗？";

    Message *msg11 = [[Message alloc] init];
    msg11.imageName = @"Message_image10";
    msg11.nickName =@"Sky";
    msg11.time = @"周五";
    msg11.message = @"哈喽，你好！";
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:msg1,msg2,msg3,msg4,msg5,msg6,msg7,msg8,msg9,msg10,msg11, nil];
    _datalist = array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createData];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 65;
    [self.view addSubview:tableView];
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
    
    Message *msg = [_datalist objectAtIndex:indexPath.row];
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
    ChatViewController *chatView = [[ChatViewController alloc] initWithMessage:[_datalist objectAtIndex:indexPath.row]];
    chatView.hidesBottomBarWhenPushed = YES;
//    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatView animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
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
