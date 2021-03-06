//
//  GuideViewController.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/1.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "GuideViewController.h"
#import "AppDelegate.h"
@interface GuideViewController ()
{
    UIScrollView *scrollView;
    UIPageControl *pageController;
    UIImageView *imageViewOne;
    UIImageView *imageViewTwo;
    UIImageView *imageViewThree;
 }
@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    scrollView = [[UIScrollView alloc] initWithFrame:SCREEN_FRAME];
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH *3, SCREEN_HEIGHT);
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    pageController = [[UIPageControl alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 50, SCREEN_WIDTH, 50)];
    pageController.numberOfPages = 3;
    pageController.currentPageIndicatorTintColor=[UIColor colorWithRed:0.153 green:0.533 blue:0.796 alpha:1.0];
    [self.view addSubview:pageController];
    
    
}
-(void)createViewOne
{
    UIView *view = [[UIView alloc] initWithFrame:SCREEN_FRAME];
    imageViewOne = [[UIImageView alloc] initWithFrame:SCREEN_FRAME];
    imageViewOne.contentMode = UIViewContentModeScaleAspectFit;
    imageViewOne.image = [UIImage imageNamed:@"1"];
    [view addSubview:imageViewOne];
    
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonPress1:)];
    imageViewOne.userInteractionEnabled = YES;
    [imageViewOne addGestureRecognizer:singleTap1];
    [scrollView addSubview:view];
}
-(void)createViewTwo
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    imageViewTwo = [[UIImageView alloc] initWithFrame:SCREEN_FRAME];
    imageViewTwo.contentMode = UIViewContentModeScaleAspectFit;
    imageViewTwo.image = [UIImage imageNamed:@"2"];
    [view addSubview:imageViewTwo];
    
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonPress2 :)];
    imageViewTwo.userInteractionEnabled = YES;
    [imageViewTwo addGestureRecognizer:singleTap1];
    [scrollView addSubview:view];
}
-(void)createViewThree
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    imageViewThree = [[UIImageView alloc] initWithFrame:SCREEN_FRAME];
    imageViewThree.contentMode = UIViewContentModeScaleAspectFit;
    imageViewThree.image = [UIImage imageNamed:@"3"];
    [view addSubview:imageViewThree];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(128, 540, 110, 25);
    [btn setTintColor:[UIColor blueColor]];
    [btn setTitle:@"立 即 体 验" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonPress3 :)];
    imageViewThree.userInteractionEnabled = YES;
    [imageViewThree addGestureRecognizer:singleTap1];
    [scrollView addSubview:view];
}

-(void)clickButton:(UIButton *)push
{
    //    LoginViewController *login = [[LoginViewController alloc] init];
    //    [self.navigationController pushViewController:login animated:NO];
    [self dismissViewControllerAnimated:NO completion:nil];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:YES forKey:@"guide1"];
    NSLog(@"点击");
}

-(void)buttonPress1:(id)sender
{
    CGFloat pageWidth = CGRectGetWidth(self.view.bounds);
    CGPoint scrollPoint = CGPointMake(pageWidth, 0);
    [scrollView setContentOffset:scrollPoint animated:YES];
    
    pageController.currentPage = 1;
}

-(void)buttonPress2:(id)sender
{
    CGFloat pageWidth = CGRectGetWidth(self.view.bounds);
    CGPoint scrollPoint = CGPointMake(pageWidth*2, 0);
    [scrollView setContentOffset:scrollPoint animated:YES];
    
    pageController.currentPage = 2;
}

-(void)buttonPress3:(id)sender
{
    
    NSLog(@"引导页完成");
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
