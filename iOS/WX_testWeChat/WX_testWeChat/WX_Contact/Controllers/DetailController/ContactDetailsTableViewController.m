//
//  ContactDetailsTableViewController.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/4.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ContactDetailsTableViewController.h"
#import "ContactViewController.h"
#import "ContactModel.h"
#import "ChatViewController.h"
@interface ContactDetailsTableViewController ()
{
    ContactModel *model;
}
@end

@implementation ContactDetailsTableViewController
-(id)initWithContactModel:(ContactModel *)data;
{
    if (self = [super init]) {
        model = data;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详 细 资 料";
    CGFloat  boundsWidth = self.view.bounds.size.width;
    CGFloat offsetX =120;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    [self.view addSubview:scrollView];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 25, 570, 100)];
    view1.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:view1];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 80, 80)];
    imageView.layer.cornerRadius = 5;
    imageView.image = [UIImage imageNamed:model.imageName];
    [view1 addSubview:imageView];
    
    UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake(offsetX, 13, 90, 30)];
    labelName.text = model.nickName;
    labelName.font = [UIFont systemFontOfSize:18];
    [view1 addSubview:labelName];
    
    UILabel *labelID = [[UILabel alloc ] initWithFrame:CGRectMake(offsetX, 45, 204, 20)];
    labelID.font = [UIFont  systemFontOfSize:15];
    labelID.textColor = [UIColor grayColor];
    labelID.text = @"微信号：tlyy16888";
    [view1 addSubview:labelID];
    
    UILabel *labelNickName = [[UILabel alloc] initWithFrame:CGRectMake(offsetX, 70, 116, 14)];
    labelNickName.text = @"昵称：Honey丽";
    labelNickName.textColor = [UIColor grayColor];
    labelNickName.font = [UIFont systemFontOfSize:15];
    [view1 addSubview:labelNickName];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 160, 570, 55)];
    view2.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:view2];
    
    UILabel *labelComment = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 125, 25)];
    labelComment.text = @"设置备注和标签";
    [view2 addSubview:labelComment];
    
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 245, 570, 90)];
    view3.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:view3];
    
    UILabel *labelPhotos = [[UILabel alloc] initWithFrame:CGRectMake(15, 30, 70, 20)];
    labelPhotos.text = @"个人相册";
    [view3 addSubview:labelPhotos];
    
    UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(95, 15, 57, 57)];
    image1.image = [UIImage imageNamed:@"contact3"];
    [view3 addSubview:image1];
    
    UIImageView *image2 = [[UIImageView alloc] initWithFrame:CGRectMake(170, 15, 57, 57)];
    image2.image = [UIImage imageNamed:@"contact5"];
    [view3 addSubview:image2];
    
    UIImageView *image3 = [[UIImageView alloc] initWithFrame:CGRectMake(245, 15, 57, 57)];
    image3.image = [UIImage imageNamed:@"contact6"];
    [view3 addSubview:image3];

    UILabel *labelLine = [[UILabel alloc] initWithFrame:CGRectMake(15, 325, boundsWidth, 1)];
    labelLine.text = @" ";
    labelLine.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];
    [scrollView addSubview:labelLine];
    
    
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 335, 570, 41)];
    view4.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:view4];
    UILabel *labelMore = [[UILabel alloc] initWithFrame:CGRectMake(17, 8, 45, 12)];
    labelMore.text = @"更多";
    [view4 addSubview:labelMore];
    
    UIButton *buttonSender = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonSender addTarget:self action:@selector(clickSendMessage:) forControlEvents:UIControlEventTouchUpInside];
    buttonSender.frame = CGRectMake(15, 460, boundsWidth - 15 - 15, 60);
    buttonSender.layer.cornerRadius = 5;
    buttonSender.backgroundColor = [UIColor colorWithRed:37/255.0 green:160/255.0 blue:20/255.0 alpha:1];
    [buttonSender setTitle:@"发 送 消 息" forState:UIControlStateNormal];
    buttonSender.font = [UIFont systemFontOfSize:18];
    buttonSender.tintColor = [UIColor whiteColor];
    [self.view addSubview:buttonSender];
    
    UIButton *buttonVideoChat = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonVideoChat.frame = CGRectMake(15, 550, boundsWidth - 15 - 15, 60);
    buttonVideoChat.backgroundColor = [UIColor whiteColor];
    buttonVideoChat.font = [UIFont systemFontOfSize:18];
    buttonVideoChat.layer.cornerRadius = 5;
    [buttonVideoChat setTitle:@"视 频 聊 天" forState:UIControlStateNormal];
    [buttonVideoChat setTintColor:[UIColor blackColor]];
    [self.view addSubview:buttonVideoChat];
    
}

-(void)clickSendMessage:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sendMessage" object:model];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
