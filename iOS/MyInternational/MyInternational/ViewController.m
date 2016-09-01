//
//  ViewController.m
//  MyInternational
//
//  Created by xuyanli on 16/9/1.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"
#import "International.h"
@interface ViewController ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //注册通知，用于改变语言通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLanguage:) name:@"changeLanguage" object:nil];
    [International initUserLanguage];//初始化应用语言
    NSBundle *bundle = [International bundle];
    
    NSString *inviteMsg = [bundle localizedStringForKey:@"invite" value:nil table:@"Localizable"];
    
    NSString *buttonInfo = [bundle localizedStringForKey:@"buttonInfo" value:nil table:@"Localizable"];

    _label = [[UILabel alloc] init];
    _label.frame = CGRectMake(100, 200, 60, 60);
    _label.text = inviteMsg;
    
    [self.view addSubview:_label];
    
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button.frame = CGRectMake(100, 250, 60, 60);
    [_button setTitle:buttonInfo forState:UIControlStateNormal];
    [_button setTintColor:[UIColor blueColor]];
    [_button addTarget:self action:@selector(changeLanguage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];

    [super viewDidLoad];
}

//点击修改语言的方法
- (void)changeLanguage:(id)sender {
    
    NSString *lan = [International userLanguage];
    
    if([lan isEqualToString:@"en"]){//判断当前的语言，进行改变
        
        [International setUserLanguage:@"zh-Hans"];
        
    }else{
        
        [International setUserLanguage:@"en"];
    }
    
    //改变完成之后发送通知，告诉其他页面修改完成，提示刷新界面
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeLanguage" object:nil];
}

-(void)changeLanguage{
    
    [_button setTitle:[[International bundle] localizedStringForKey:@"buttonInfo" value:nil table:@"hello"] forState:UIControlStateNormal];
    
    _label.text =[[International bundle] localizedStringForKey:@"invite" value:nil table:@"hello"];
}

@end
