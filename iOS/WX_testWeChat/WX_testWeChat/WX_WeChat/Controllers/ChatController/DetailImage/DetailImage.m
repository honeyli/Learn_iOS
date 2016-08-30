//
//  DetailImage.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/28.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "DetailImage.h"

@interface DetailImage ()

@end

@implementation DetailImage

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIScrollView *scrollView = [[UIScrollView alloc] init];
//    scrollView.frame = self.view.frame;
//    scrollView.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:scrollView];
//    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y/2, 200, 200);
    [self.view addSubview:imageView];
    
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
