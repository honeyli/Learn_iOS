//
//  ViewController.m
//  testPageController
//
//  Created by xuyanli on 16/9/21.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIScrollView *scrollView;
    UIPageControl *pageControl;
    UIImageView *imageView;
    NSMutableArray *array;
    int i;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    array = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"1"] ,[UIImage imageNamed:@"2"] ,[UIImage imageNamed:@"3"], nil];
    for ( i = 0; i < array.count; i ++) {
        imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
        
    }
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.frame = scrollView.frame;
    [scrollView addSubview:imageView];
}

-(void)initUI{

    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.scrollEnabled = NO;
    scrollView.contentSize = CGSizeMake(i * 320, self.view.frame.size.height);
    [self.view addSubview:scrollView];
    
    pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(0, 400, self.view.bounds.size.width, 30);
    pageControl.currentPage = 0;
    pageControl.numberOfPages = array.count;
    [pageControl addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pageControl];
}

-(void)createLabel
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(128, 540, 110, 25);
    [btn setTintColor:[UIColor blueColor]];
    [btn setTitle:@"立 即 体 验" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:btn];
    
}

-(void)clickButton:(UIButton *)push
{
    [self dismissViewControllerAnimated:NO completion:nil];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:YES forKey:@"guide1"];
    NSLog(@"点击");
}

-(void)buttonPress:(id)sender
{
    CGFloat pageWidth = CGRectGetWidth(self.view.bounds);
    CGPoint scrollPoint = CGPointMake(pageWidth, 0);
    [scrollView setContentOffset:scrollPoint animated:YES];
    
    pageControl.currentPage = array.count;
}
//用户滑动页面停下后调用改函数
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //更新UIpageController的当前页
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    [pageControl setCurrentPage:offset.x / bounds.size.width];
    NSLog(@"%f",offset.x / bounds.size.width);
}
//点击UipageController时响应函数pagerTurn
-(void)pageTurn:(UIPageControl *)sender
{
    //另scrollView做出相应的滑动显示
    CGSize viewSize = scrollView.frame.size;
    CGRect rect = CGRectMake(sender.currentPage * viewSize.width, 0, viewSize.width, viewSize.height);
    [scrollView scrollRectToVisible:rect animated:YES];
}

@end
