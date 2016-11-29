//
//  HeardView.m
//  testViewDeck
//
//  Created by xuyanli on 16/9/18.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "HearderView.h"

@implementation HearderView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initHearView];
    }
    return self;
}

-(void)initHearView
{
    UIImageView *imageViewHead = [[UIImageView alloc] init];
    imageViewHead.frame = CGRectMake(15, 20,35,35);
    imageViewHead.image = [UIImage imageNamed:@"Menu_Avatar"];
    [self addSubview:imageViewHead];
    
    
    UIButton *LoginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    LoginButton.frame = CGRectMake(50, 30, 60, 15);
    [LoginButton setTitle:@"请登录" forState:UIControlStateNormal];
    LoginButton.titleLabel.font = [UIFont systemFontOfSize:13];
    LoginButton.tintColor = [UIColor whiteColor];
    [self addSubview:LoginButton];
    
    UIButton *collectButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    collectButton.frame = CGRectMake(15, 75, 20, 20);
    [collectButton setBackgroundImage:[UIImage imageNamed:@"Menu_Icon_Collect"] forState:UIControlStateNormal];
    [self addSubview:collectButton];
    UILabel *collectLabel = [[UILabel alloc] init];
    collectLabel.frame = CGRectMake(15, 96, 40, 10);
    collectLabel.text = @"收藏";
    collectLabel.font = [UIFont systemFontOfSize:10];
    collectLabel.textColor = [UIColor whiteColor];
    [self addSubview:collectLabel];
    
    UIButton *messageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    messageButton.frame = CGRectMake(75, 75, 20, 20);
    [messageButton setBackgroundImage:[UIImage imageNamed:@"Menu_Icon_Message"] forState:UIControlStateNormal];
    [self addSubview:messageButton];
    UILabel *messageLabel = [[UILabel alloc] init];
    messageLabel.frame = CGRectMake(75, 96, 40, 10);
    messageLabel.text = @"消息";
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:messageLabel];
    
    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    settingButton.frame = CGRectMake(135, 75, 20, 20);
    [settingButton setBackgroundImage:[UIImage imageNamed:@"Menu_Icon_Setting"] forState:UIControlStateNormal];
    [self addSubview:settingButton];
    UILabel *settingLable = [[UILabel alloc] init];
    settingLable.frame = CGRectMake(135, 96, 40, 10);
    settingLable.text = @"设置";
    settingLable.textColor = [UIColor whiteColor];
    settingLable.font = [UIFont systemFontOfSize:10];
    [self addSubview:settingLable];
}
@end
