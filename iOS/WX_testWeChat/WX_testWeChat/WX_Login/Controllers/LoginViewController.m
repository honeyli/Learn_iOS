//
//  LoginViewController.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/1.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "LoginViewController.h"
#import "ConversionViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>
{
    UIButton *btn;
    UITextField *textField1;
    UITextField *textField2;
}
@end
#define LoginPhoneNumber @"TW_PhoneNumber"

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat boundsWidth = self.view.bounds.size.width;
    CGFloat offsetX = 18.0;
    CGFloat labelWidth = 85.0;
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 76, 177, 29)];
    label1.text = @"使用手机号登录";
    label1.font = [UIFont systemFontOfSize:25];
    [self.view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(115, 425, 155, 17)];
    label2.text = @"通过短信验证码登录";
    label2.textColor = [UIColor colorWithRed:109/255.0 green:121/255.0 blue:158/255.0 alpha:1];
    label2.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(65, 600, 160, 18)];
    label3.text = @"登录遇到问题？";
    label3.font = [UIFont systemFontOfSize:18];
    label3.textColor = [UIColor colorWithRed:109/255.0 green:121/255.0 blue:158/255.0 alpha:1];
    [self.view addSubview:label3];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(222, 600, 160, 18)];
    label4.font = [UIFont systemFontOfSize:18];
    label4.text = @"其他方式登录";
    label4.textColor = [UIColor colorWithRed:109/255.0 green:121/255.0 blue:158/255.0 alpha:1];
    [self.view addSubview:label4];
    
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(offsetX, 158, labelWidth, 20)];
    label5.text = @"国家/地区";
    [self.view addSubview:label5];
    
    UILabel *label6 = [[UILabel alloc] initWithFrame:CGRectMake(offsetX, 205, labelWidth, 20)];
    label6.text = @"+86";
    [self.view addSubview:label6];
    
    UILabel *label7 = [[UILabel alloc] initWithFrame:CGRectMake(offsetX, 260, labelWidth, 20)];
    label7.text = @"密码";
    [self.view addSubview:label7];
    
    UILabel *label9 = [[UILabel alloc] initWithFrame:CGRectMake(111, 158, 44 , 20)];
    label9.text = @"中国";
    [self.view addSubview:label9];
    
    UILabel *label10 = [[UILabel alloc] initWithFrame:CGRectMake(offsetX, 242, boundsWidth - 18, 1)];;
    label10.text = @"";
    label10.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    [self.view addSubview:label10];
    
    UILabel *label11 = [[UILabel alloc] initWithFrame:CGRectMake(offsetX, 295, boundsWidth - 18, 1)];
    label11.text = @"";
    label11.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:2];
    
    UILabel *label12 = [[UILabel alloc] initWithFrame:CGRectMake(offsetX, 297, boundsWidth - 18, 1)];
    label12.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:230/255.0];
    [self.view addSubview:label12];
    
    UILabel *label8 = [[UILabel alloc] initWithFrame:CGRectMake(18, 189, boundsWidth - 18, 1)];
    label8.text = @"";
    label8.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    [self.view addSubview:label8];
    
    UILabel *label13 = [[UILabel alloc] initWithFrame:CGRectMake(200, 600, 1, 20)];
    label13.text = @"";
    label13.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    [self.view addSubview:label13];
    
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(offsetX , 345, boundsWidth -18 - 18, 55);
    [btn setTitle:@"登 录" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    btn.adjustsImageWhenHighlighted = NO;
    btn.backgroundColor = [UIColor colorWithRed:149/255.0 green:219/255.0 blue:146/255.0 alpha:1];
    //    btn.userInteractionEnabled= NO;
    [btn addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = 5.5;
    btn.enabled = NO;
    [self.view addSubview:btn];
    
    offsetX = offsetX + labelWidth + 5;
    labelWidth = boundsWidth - offsetX;
    textField1 = [[UITextField alloc] init];
    textField1.frame = CGRectMake(offsetX, 192,labelWidth, 50);
    textField1.textAlignment = NSTextAlignmentLeft;
    textField1.borderStyle = UITextBorderStyleNone;
    textField1.placeholder = @"请填写手机号码";
    textField1.returnKeyType = UIReturnKeyDone;
    textField1.textColor = [UIColor grayColor];
    textField1.keyboardType = UIKeyboardTypeNumberPad;
    textField1.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:textField1];
    
    textField2 = [[UITextField alloc] init];
    textField2.frame = CGRectMake(offsetX, 242, labelWidth, 50);
    textField2.textAlignment = NSTextAlignmentLeft;
    textField2.placeholder = @"请填写密码";
    textField2.clearButtonMode = UITextFieldViewModeAlways;
    textField2.keyboardType = UIKeyboardTypeNumberPad;
    textField2.borderStyle = UITextBorderStyleNone;
    textField2.textColor = [UIColor grayColor];
    textField2.secureTextEntry = YES;
    textField2.returnKeyType = UIReturnKeyDone;
    textField2.keyboardType = UIKeyboardTypeDefault;
    textField2.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didInputPassword:) name:UITextFieldTextDidChangeNotification object:textField2];
    [self.view addSubview:textField2];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *phoneNumber = [userDefaults  objectForKey:LoginPhoneNumber];
    textField1.text = phoneNumber;
}
-(void)buttonPress:(id)sender
{
    NSLog(@"点击了btn按钮");
    NSString *phoneNumber = textField1.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:phoneNumber forKey:LoginPhoneNumber];
    [textField2 resignFirstResponder];
    [self dismissViewControllerAnimated:NO completion:nil];
    [defaults setBool:YES forKey:@"login"];
}

-(void)didInputPassword:(NSNotification *)sender
{
    UITextField *textField = sender.object;
    if (textField.text.length > 0 ) {
        btn.enabled = YES;
    }
    else
    {
        btn.enabled = NO;
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    if (textField.text.length >= 5 && ![string isEqualToString:@""]) {
//        return NO;
//    }
//}
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
