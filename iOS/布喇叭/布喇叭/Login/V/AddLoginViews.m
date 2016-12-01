//
//  AddLoginViews.m
//  布喇叭
//
//  Created by xuyanli on 16/12/1.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "AddLoginViews.h"

@implementation AddLoginViews
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addAreaViews];
        [self addInputViews];
    }
    return  self;
}

-(void)addAreaViews
{
    UIView *areaView = [[UIView alloc] initWithFrame:CGRectMake(17, 90, 285, 50)];
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
    inputView.frame = CGRectMake(17, 150, 70, 50);
    inputView.backgroundColor = [UIColor whiteColor];
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
    numberView.frame = CGRectMake(97, 150, 205, 50);
    numberView.backgroundColor = [UIColor whiteColor];
    [self addSubview:numberView];
    
    UITextField *numberTextField = [[UITextField alloc] init];
    numberTextField.frame = CGRectMake(10, 10, 175, 30);
    numberTextField.textAlignment = NSTextAlignmentLeft;
    numberTextField.borderStyle = UITextBorderStyleNone;
    numberTextField.placeholder = @"请输入手机号";
    numberTextField.font = [UIFont systemFontOfSize:17];
    numberTextField.textColor = [UIColor blackColor];
    [numberView addSubview:numberTextField];
}

-(void)senderMessagecode
{
    UIButton *senderButton = [[UIButton alloc] init];
    
}

-(void)clickLoginView:(id)sender
{
    
}


@end
