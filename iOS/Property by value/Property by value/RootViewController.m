//
//  RootViewController.m
//  Property by value
//
//  Created by xuyanli on 16/12/6.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "RootViewController.h"
#import "DetailViewController.h"

@interface RootViewController ()<PassingValueDelegate>
@property (nonatomic, strong) UITextField *textField;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textField];
//    UIGestureRecognizer *tapView = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(cancelKeyBoard)];
//    [self.view addGestureRecognizer:tapView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 80, 40);
    [button setTitle:@"点击" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    button.center = self.view.center;
    [button addTarget:self action:@selector(handlePush:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(UITextField *)textField{
    if (!_textField) {
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 100, 40)];
        self.textField.borderStyle = UITextBorderStyleLine;
    }
    return _textField;
}

-(void)handlePush:(id)sender{
    DetailViewController *detail = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
    detail.textString = self.textField.text;
    detail.delegate = self;//为detail指定代理对象
    
    //block传值
//    detail.passingValue = ^(UILabel *label) {
//        label.text = self.textField.text;
//    }
}

-(void)viewController:(DetailViewController *)viewController didPassingValueWithInfo:(id)info
{
    //把第二个视图的颜色传递给第一个视图
    self.view.backgroundColor = info;
}

-(void)cancelKeyBoard{
    [self.textField resignFirstResponder];
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
