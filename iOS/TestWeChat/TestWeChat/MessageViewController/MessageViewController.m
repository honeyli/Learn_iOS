//
//  MessageViewController.m
//  TestWeChat
//
//  Created by xuyanli on 16/7/18.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "MessageViewController.h"
#import "Message1.h"
@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"消息";
    Message1 *mag1 = [[Message1 alloc ] init];
    mag1.imageName = @"0";
    mag1.nickname = @"曾经";
    mag1.time = @"周一";
    mag1.message = @"你好啊！";
    
    Message1 *mag2 = [[Message1 alloc] init];
    mag2.imageName = @"1";
    mag2.nickname = @"弃怀";
    mag2.time = @"7月4日";
    mag2.message = @"干嘛呢？";
    
    Message1 *mag3= [[Message1 alloc] init];
    mag3.imageName = @"2";
    mag3.nickname = @"假如没有如果";
    mag3.time = @"周五";
    mag3.message = @"happy new year！！！";
    
    Message1 *mag4 = [[Message1 alloc] init];
    mag4.imageName = @"3";
    mag4.nickname = @"你似不似傻~";
    mag4.time = @"7月1日";
    mag4.message = @"最近过的怎么样";
    
    Message1 *mag5 = [[Message1 alloc] init];
    mag5.imageName = @"4";
    mag5.nickname = @"法海你不懂爱";
    mag5.time = @"7月8日";
    mag5.message = @"🐷你生日快乐";
    
    Message1 *mag6 = [[Message1 alloc] init];
    mag6.imageName = @"5";
    mag6.nickname = @"一诺千金";
    mag6.time = @"7月8日";
    mag6.message = @"呼呼~";

    Message1 *mag7= [[Message1 alloc] init];
    mag7.imageName = @"6";
    mag7.nickname = @"凉**白开";
    mag7.time = @"周六";
    mag7.message = @"最近有没有什么好玩的事情！";

    Message1 *mag8 = [[Message1 alloc] init];
    mag8.imageName = @"7";
    mag8.nickname = @"traller";
    mag8.time = @"7月10日";
    mag8.message = @"恩恩好的。";

    Message1 *mag9 = [[Message1 alloc] init];
    mag9.imageName = @"8";
    mag9.nickname = @"Butter girl";
    mag9.time = @"周日";
    mag9.message = @"晚安";
    
    Message1 *mag10 = [[Message1 alloc] init];
    mag10.imageName = @"9";
    mag10.nickname = @"幻城";
    mag10.time = @"8月1日";
    mag10.message = @"一块去玩吗？";
    
    Message1 *mag11 = [[Message1 alloc] init];
    mag11.imageName = @"10";
    mag11.nickname =@"Sky";
    mag11.time = @"周五";
    mag11.message = @"哈喽，你好！";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:mag1,mag2,mag3,mag4,mag5,mag6,mag7,mag8,mag9,mag10,mag11,nil];
    self.datalist = array;
    
    //tableView.sectionHeaderHeight = 80;
    tableView.rowHeight = 65;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.datalist count];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *indentifider = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indentifider];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifider ];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(15, 8, 49, 49);
        imageView.tag = 101;
        [cell.contentView addSubview:imageView];
        
        UILabel *labelnickName = [[UILabel alloc] init];
        labelnickName.frame = CGRectMake(75, 12, 145, 18);
        labelnickName.tag = 111;
        [cell.contentView addSubview:labelnickName];
        labelnickName.font = [UIFont systemFontOfSize:18 ];
        
        UILabel *labelTime = [[UILabel alloc] init];
        labelTime.frame = CGRectMake(350, 15, 62, 25);
        labelTime.tag = 120;
        [cell.contentView addSubview:labelTime];
        labelTime.font = [UIFont systemFontOfSize:12 ];
        
        
        UILabel *labelMessage = [[UILabel alloc] init];
        labelMessage.frame = CGRectMake(75, 35, 105, 18);
        labelMessage.tag = 130;
        [cell.contentView addSubview:labelMessage];
        labelMessage.font = [UIFont systemFontOfSize:13];

    }
    
    Message1 *msg = [_datalist objectAtIndex:indexPath.row];
    
    UIImageView *imageView = (UIImageView *) [cell.contentView viewWithTag:101];
    imageView.image = [[UIImage imageNamed:msg.imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    
    UILabel *nickNameLabel = (UILabel *) [cell.contentView viewWithTag:111];
    nickNameLabel.text = msg.nickname;
    
    UILabel *timeLabel = (UILabel *) [cell.contentView viewWithTag:120];
    timeLabel.text = msg.time;
    
    UILabel *messageLabel = (UILabel *) [cell.contentView viewWithTag:130];
    messageLabel.text = msg.message;

    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[_datalist objectAtIndex:indexPath.section ]removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"响应单击时间");
    
    UIViewController *viewController= [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.hidesBottomBarWhenPushed = YES;
//    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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