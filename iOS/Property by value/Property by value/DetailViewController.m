//
//  DetailViewController.m
//  Property by value
//
//  Created by xuyanli on 16/12/6.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] init];
    label.frame =  CGRectMake(100, 100, 100, 100);
    label.text = self.textString;
    label.font = [UIFont systemFontOfSize:20];
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
    
}

//首次判断代理是否存在并且代理能够响应代理方法，才执行代理方法
-(void)viewWillDisappear:(BOOL)animated
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(viewController:didPassingValueWithInfo:)]) {
        [self.delegate viewController:self didPassingValueWithInfo:self.view.backgroundColor];
    }
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
