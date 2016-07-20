//
//  ViewController.m
//  testUIAlertController
//
//  Created by xuyanli on 16/7/13.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"TEXTFIELD DIALOG" message:@"ID AND PASSWORD DIALOG" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction  actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){NSLog(@"OK");}];
    [alertController addAction:okAction];//创建两个动作按钮并添加到控制器上
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
    [alertController showViewController:alertController sender:nil];
    //带输入框的对话框
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"Enter  id";
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"Enter password";
        textField.secureTextEntry = YES;
    }];
    //创建一个上拉菜单
   UIAlertController *sheetController = [UIAlertController alertControllerWithTitle:@"保存或删除数据" message:@"删除数据将不可恢复" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction *saveAction){
        NSLog(@"保存");
    }];
    UIAlertAction *delectAction = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDefault handler:^(UIAlertAction *delectAction){
        NSLog(@"删除");
    }];
    //UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [sheetController addAction:saveAction];
    [sheetController addAction:delectAction];
    //[sheetController addAction:cancelAction];
    [self presentViewController:sheetController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
