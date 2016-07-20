//
//  ViewController.m
//  TestUITableViewCellforWechat
//
//  Created by xuyanli on 16/7/16.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"
#import "Message.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
{
    NSArray *title;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    Message *mag1 = [[Message alloc ] init];
    mag1.imageName = @"image1";
    mag1.nickname = @"曾经";
    mag1.time = @"周一";
    mag1.message = @"你好啊！";
    
    Message *mag2 = [[Message alloc] init];
    mag2.imageName = @"image2";
    mag2.nickname = @"艳红";
    mag2.time = @"7月4日";
    mag2.message = @"干嘛呢？";
    
    Message *mag3= [[Message alloc] init];
    mag3.imageName = @"image3";
    mag3.nickname = @"哥哥";
    mag3.time = @"周五";
    mag3.message = @"知道了";
    
    Message *mag4 = [[Message alloc] init];
    mag4.imageName = @"image4";
    mag4.nickname = @"嫂子";
    mag4.time = @"7月1日";
    mag4.message = @"呵呵哒";

    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:mag1,mag2,mag3,mag4, nil];
    self.datalist = array;
    UITableView *mytableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    mytableView.rowHeight = 90;
    title = [[NSArray alloc] initWithObjects:@"WeChat", nil];
    mytableView.delegate = self;
    mytableView.dataSource = self;
    [self.view addSubview:mytableView];
}



-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ _datalist  count];
}

/*-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
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
}*/

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *indentifider = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indentifider];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifider ];
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(20, 12, 65, 65);
        imageView.tag = 101;
        [cell.contentView addSubview:imageView];
        
        
        UILabel *labelnickName = [[UILabel alloc] init];
        labelnickName.frame = CGRectMake(110, 12, 150, 40);
        labelnickName.tag = 111;
        [cell.contentView addSubview:labelnickName];
        labelnickName.font = [UIFont systemFontOfSize:15 ];
        
        UILabel *labelTime = [[UILabel alloc] init];
        labelTime.frame = CGRectMake(cell.frame.size.width - 40, 12, 60, 25);
        labelTime.tag = 120;
        [cell.contentView addSubview:labelTime];
        labelTime.font = [UIFont systemFontOfSize:12 ];

        
        UILabel *labelMessage = [[UILabel alloc] init];
        labelMessage.frame = CGRectMake(110, 50, 150, 20);
        labelMessage.tag = 130;
        [cell.contentView addSubview:labelMessage];
        labelMessage.font = [UIFont systemFontOfSize:13];
    }
    
    
     Message *msg = [_datalist objectAtIndex:indexPath.row];
    
    
    UIImageView *imageView = (UIImageView *) [cell.contentView viewWithTag:101];
    imageView.image = [UIImage imageNamed:msg.imageName];
    
    UILabel *nickNameLabel = (UILabel *) [cell.contentView viewWithTag:111];
    nickNameLabel.text = msg.nickname;
    
    UILabel *timeLabel = (UILabel *) [cell.contentView viewWithTag:120];
    timeLabel.text = msg.time;
    
    UILabel *messageLabel = (UILabel *) [cell.contentView viewWithTag:130];
    messageLabel.text = msg.message;
    
    return cell;
}
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle ==UITableViewCellEditingStyleDelete) {
        [[_datalist objectAtIndex:indexPath.section] removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil]withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert){};
}
@end


