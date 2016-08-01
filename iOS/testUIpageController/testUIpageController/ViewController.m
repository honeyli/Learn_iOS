//
//  ViewController.m
//  testUIpageController
//
//  Created by xuyanli on 16/7/27.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    UIPageControl *pageControl;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect bounds = self.view.frame;//获取界面区域
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, bounds.origin.y, bounds.size.width, bounds.size.height)];
    [imageView1 setImage:[UIImage imageNamed:@"image1"]];
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(1*bounds.size.width, bounds.origin.y, bounds.size.width, bounds.size.height)];
    imageView2.image = [UIImage imageNamed:@"image2"];
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height)];
    imageView3.image = [UIImage imageNamed:@"image3"];
    //创建UIscrollView
    scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, 300)];
    [scrollView setContentSize:CGSizeMake(bounds.size.width * 3, [UIScreen mainScreen].bounds.size.height)];//设置全部内容的尺寸，这里帮助图片是三张，所以宽度设为界面的宽度*3，高度和界面一致
    scrollView.pagingEnabled = YES;//设为\(^o^)/YES!会按页滑动
    scrollView.bounces = NO ;//设置scrollView的弹性属性
    scrollView.delegate =self;
    scrollView.showsHorizontalScrollIndicator = NO;//我们使用UIpageControl表示页面进度，所以取消UIscrollerView自己的进度条；
    [scrollView addSubview:imageView1];
    [scrollView addSubview:imageView2];
    [scrollView addSubview:imageView3];//将图片添加到scrollView上去
    [self.view addSubview:scrollView];//讲scrollView添加到View上去
    
    //创建UIpageViewController
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 400, bounds.size.width, 30)];//位置在最下方
    pageControl.numberOfPages = 3 ;//总的图片页数
    pageControl.currentPage = 0;//当前页
    [pageControl addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pageControl];
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
