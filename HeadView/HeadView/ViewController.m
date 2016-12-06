//
//  ViewController.m
//  HeadView
//
//  Created by xuyanli on 16/11/30.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.scrollEnabled = YES;
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.showsHorizontalScrollIndicator = YES;
    [self.view addSubview:scrollView];
    
    UIView *headView = [[UIView alloc] init];
    headView.backgroundColor = [UIColor clearColor];
    headView.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    [scrollView addSubview:headView];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = headView.frame;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    imageView.image = [UIImage imageNamed:@"2"];
    [headView addSubview:imageView]; 
     */
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
