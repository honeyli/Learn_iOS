//
//  AddLoginViews.m
//  布喇叭
//
//  Created by xuyanli on 16/12/1.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "AddLoginViews.h"

#define areaViewHeght 45.0f
#define leftIntervalX 17.0f

@implementation AddLoginViews
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addAreaViews];
        [self addInputViews];
        [self senderMessagecode];
    }
    return  self;
}

-(void)addAreaViews
{
    UIView *areaView = [[UIView alloc] initWithFrame:CGRectMake(leftIntervalX, 90, 285, areaViewHeght)];
    areaView.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickLoginView:)];
    [areaView addGestureRecognizer:tapGesture];
    [self addSubview:areaView];
    
    UILabel *areaLabel = [[UILabel alloc] init];
    areaLabel.frame = CGRectMake(10 , 10, 75, 30);
    areaLabel.text = @"国家/地区";
    areaLabel.textColor = [UIColor grayColor];
    areaLabel.font = [UIFont systemFontOfSize:17];
    [areaView addSubview:areaLabel];
    
    UILabel *countryLabel = [[UILabel alloc] init];
    countryLabel.frame = CGRectMake(204, 10, 40, 30);
    countryLabel.text = @"中国";
    countryLabel.font = [UIFont systemFontOfSize:17];
    [areaView addSubview:countryLabel];
    
    UIImageView *selectImageView = [[UIImageView alloc] init];
    selectImageView.frame = CGRectMake(247, 20, 12, 8);
    selectImageView.image = [UIImage imageNamed:@"Arrow_right"];
    [areaView addSubview:selectImageView];
}

-(void)addInputViews
{
    UIView *inputView = [[UIView alloc] init];
    inputView.frame = CGRectMake(leftIntervalX, 150, 70, areaViewHeght);
    inputView.backgroundColor = kWhiteColor;
    [self addSubview:inputView];
    
    UITextField *areaTextField = [[UITextField alloc] init];
    areaTextField.borderStyle = UITextBorderStyleNone;
    areaTextField.frame = CGRectMake(10, 10, 50, 30);
    areaTextField.textAlignment = NSTextAlignmentLeft;
    areaTextField.text = @"+86";
    areaTextField.textColor = [UIColor blackColor];
    areaTextField.font = [UIFont systemFontOfSize:17];
    [inputView addSubview:areaTextField];
    
    UIView *numberView = [[UIView alloc] init];
    numberView.frame = CGRectMake(97, 150, 205, areaViewHeght);
    numberView.backgroundColor = kWhiteColor;
    [self addSubview:numberView];
    
    _numberTextField = [[UITextField alloc] init];
    _numberTextField.frame = CGRectMake(10, 10, 175, 30);
    _numberTextField.textAlignment = NSTextAlignmentLeft;
    _numberTextField.borderStyle = UITextBorderStyleNone;
    _numberTextField.placeholder = @"请输入手机号";
    _numberTextField.font = [UIFont systemFontOfSize:17];
    _numberTextField.textColor = [UIColor blackColor];
    [numberView addSubview:_numberTextField];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"test" object:nil];
}

-(void)senderMessagecode
{
    _senderButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _senderButton.frame = CGRectMake(leftIntervalX, 225, 285, areaViewHeght);
    _senderButton.backgroundColor = [UIColor colorWithRed:189/255.0 green:189/255.0 blue:189/255.0 alpha:1];
    [_senderButton setTitle:@"发送短信验证码" forState:UIControlStateNormal];
    [_senderButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [self addSubview:_senderButton];
}

-(void)clickLoginView:(id)sender
{
    
}


@end
