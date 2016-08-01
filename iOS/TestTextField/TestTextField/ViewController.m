//
//  ViewController.m
//  TestTextField
//
//  Created by xuyanli on 16/7/11.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextField *myTextfield1= [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 150, 50)];
    //field.backgroundColor = [UIColor redColor];
    myTextfield1.borderStyle = UITextBorderStyleRoundedRect;//设置边框样式
    myTextfield1.placeholder = @"Enter password";
    myTextfield1.textAlignment = YES;
    myTextfield1.font = [UIFont fontWithName:@"Arial" size:15.0f];//设置字体
    myTextfield1.textColor = [UIColor redColor];//设置字体的颜色
    myTextfield1.clearButtonMode = UITextFieldViewModeAlways;//一次性删除文本框中的内容
    //myTextfield1.text = @"admin";
    myTextfield1.autocorrectionType = UITextAutocorrectionTypeYes;//设置是否自动纠错
    myTextfield1.clearsOnBeginEditing = YES; //设置是否再次编辑就清空
    myTextfield1.textAlignment = NSTextAlignmentLeft;//设置内容对齐方式
    myTextfield1.adjustsFontSizeToFitWidth = YES;//设置自动缩小显示的最小字体大小
    //当显示文本可以自动调整字体大小时,可调整的最小字体是多大
    myTextfield1.minimumFontSize = 20;
    myTextfield1.keyboardType = UIKeyboardTypeNumberPad;//设置键盘
    myTextfield1.returnKeyType = UIReturnKeyDone;//设置键盘的退出方式
    myTextfield1.keyboardAppearance = UIKeyboardAppearanceLight; //设置键盘外观
    //myTextfield1.editing = YES;//设置是否允许编辑
    [self.view addSubview:myTextfield1];
    myTextfield1.delegate = self;
}
//是否允许编辑，返回YES可编辑返回NO不可编辑
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}
//开始编辑时触发文本字段将成为第一响应者(First responder)
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"textFieldDidBeginEditing");
}
//是否允许文字结束编辑
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return  NO;
}
//当用户使用自动更正功能，把输入的文字修改为推荐的文字时，就会调用这个方法。

//这对于想要加入撤销选项的应用程序特别有用

//可以跟踪字段内所做的最后一次修改，也可以对所有编辑做日志记录,用作审计用途
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}
//返回一个BOOL值指明是否允许根据用户请求清除内容
//可以设置在特定条件下才允许清除内容
-(BOOL)textFieldShouldClear:(UITextField *)textField
{
    return YES;
}
//返回一个BOOL值，指明是否允许在按下回车键时结束编辑
//如果允许要调用resignFirstResponder 方法，这回导致结束编辑，而键盘会被收起[textField resignFirstResponder];
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
