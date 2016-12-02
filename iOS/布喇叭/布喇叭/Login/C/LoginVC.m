//
//  LoginVC.m
//  布喇叭
//
//  Created by xuyanli on 16/11/30.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "LoginVC.h"
#import "AddLoginViews.h"
@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavBar];
    
    AddLoginViews *loginView = [[AddLoginViews alloc] init];
    loginView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    loginView.backgroundColor = [UIColor colorWithRed:232/255.0 green:233/255.0 blue:232/255.0 alpha:1];
    [self.view addSubview:loginView];
}
-(void)setNavBar
{
    self.title = @"登录";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor], NSFontAttributeName : [UIFont boldSystemFontOfSize:17]};
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
