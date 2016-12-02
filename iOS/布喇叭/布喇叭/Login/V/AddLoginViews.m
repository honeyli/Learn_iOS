//
//  AddLoginViews.m
//  布喇叭
//
//  Created by xuyanli on 16/12/1.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "AddLoginViews.h"

#define areaViewHeght 45.0f
#define kWidth kScreenWidth - 34
#define leftIntervalX 17.0f

@interface AddLoginViews () <UITextFieldDelegate>
{
    UITextField *numberTextField;
    UIButton *senderButton;
}
@end

@implementation AddLoginViews

-(void)drawRect:(CGRect)rect
{
    self.backgroundColor = [UIColor colorWithRed:232/255.0 green:233/255.0 blue:232/255.0 alpha:1];
    [self addAreaViews];
    [self addInputViews];
    [self senderMessagecode];
    [self addUserProtocol];
}

-(void)addAreaViews
{
    UIView *areaView = [[UIView alloc] initWithFrame:CGRectMake(leftIntervalX, 90, kWidth, areaViewHeght)];
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

-(void)addInputViews {
    
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
    numberView.frame = CGRectMake(97, 150, kWidth - inputView.frame.size.width - 10, areaViewHeght);
    numberView.backgroundColor = kWhiteColor;
    [self addSubview:numberView];
    
    numberTextField = [[UITextField alloc] init];
    numberTextField.frame = CGRectMake(10, 10, numberView.frame.size.width - 25, 30);
    numberTextField.textAlignment = NSTextAlignmentLeft;
    numberTextField.borderStyle = UITextBorderStyleNone;
    numberTextField.placeholder = @"请输入手机号";
    numberTextField.font = [UIFont systemFontOfSize:17];
    numberTextField.textColor = [UIColor blackColor];
    numberTextField.keyboardType = UIKeyboardTypeNumberPad;
//    numberTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [numberView addSubview:numberTextField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeColor) name:UITextFieldTextDidChangeNotification object:nil];
}

-(void)senderMessagecode {
    
    senderButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    senderButton.frame = CGRectMake(leftIntervalX, 225, kWidth, areaViewHeght);
    senderButton.backgroundColor = [UIColor colorWithRed:189/255.0 green:189/255.0 blue:189/255.0 alpha:1];
    [senderButton addTarget:self action:@selector(clickSenderButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:senderButton];
    
    UILabel *senderLabel = [[UILabel alloc] init];
    senderLabel.frame = CGRectMake((kWidth - 130) / 2, (areaViewHeght - 30) /2, 130, 30);
    senderLabel.text = @"发送短信验证码";
    senderLabel.textColor = kWhiteColor;
    senderLabel.font = [UIFont systemFontOfSize:18];
    [senderButton addSubview:senderLabel];
}

-(void)addUserProtocol{
    UILabel *userlabel = [[UILabel alloc] init];
    userlabel.frame = CGRectMake(leftIntervalX, 285, kWidth, 20);
    userlabel.text = @"轻触上面按钮，即表示您已同意";
    userlabel.textColor = [UIColor grayColor];
    userlabel.textAlignment = NSTextAlignmentLeft;
    NSMutableAttributedString *userString = [[NSMutableAttributedString alloc] initWithString:@"https://resource-testing.bulaba.com/user_agreement_zh.html"];
    [userString addAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:124/255.0 green:201/255.0 blue:189/255.0 alpha:1], NSFontAttributeName: [UIFont systemFontOfSize:12]} range:NSMakeRange(2,2)];
    userlabel.attributedText = userString;
    [self addSubview:userlabel];
}

-(void)clickSenderButton {
    
}


                                     
-(void)clickLoginView:(id)sender {

}

-(void)changeColor {
    if ( [numberTextField.text  isEqualToString:@""]) {
        senderButton.backgroundColor = [UIColor colorWithRed:189/255.0 green:189/255.0 blue:189/255.0 alpha:1];
    }else
    {
        senderButton.backgroundColor = [UIColor colorWithRed:67/255.0 green:184/255.0 blue:168/255.0 alpha:1];
    }
}


@end
