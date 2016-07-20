//
//  ViewController.m
//  testUIActionSheet
//
//  Created by xuyanli on 16/7/13.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIApplicationDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Default actionSheet " delegate:self cancelButtonTitle:@"cancle" destructiveButtonTitle:@"重置" otherButtonTitles:@"0k", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleAutomatic;
    [actionSheet isVisible];
    [self.view addSubview:actionSheet];
    
//    [self.view addSubview:actionSheet];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)willpresentActionSheet:(UIActionSheet *)actionSheet
{
    NSLog(@"hehe");
}
/*
 下面是几种弹出方式，会根据风格不同展现不同的方式
 - (void)showFromToolbar:(UIToolbar *)view;
 - (void)showFromTabBar:(UITabBar *)view;
 - (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated ;
 - (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated ;
 - (void)showInView:(UIView *)view;
 
 
 
 - (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated;
 使用代码将视图收回
 
 三、UIActionSheet代理方法
 
 
 点击按钮时触发的方法
 
 
 - (void)willPresentActionSheet:(UIActionSheet *)actionSheet;
 视图将要弹出时触发的方法
 
 
 - (void)didPresentActionSheet:(UIActionSheet *)actionSheet;
 视图已经弹出式触发的方法
 
 
 - (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex;
 点击按钮后，视图将要收回时触发的方法
 
 
 - (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex;
 点击按钮后，视图已经收回时触发的方法
 */
@end
