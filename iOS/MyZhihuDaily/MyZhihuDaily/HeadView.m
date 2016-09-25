//
//  HeadView.m
//  test_ZhihuDaily
//
//  Created by xuyanli on 16/9/20.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "HeadView.h"
#import "NewsListResponseModel.h"
#import "UIImageView+webCache.h"
#import "TopNewsResponseModel.h"
#define   kScreenWidth  [UIScreen mainScreen].bounds.size.width

@implementation HeadView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initHeadViewUI];
    }
    return  self;
}

-(void)initHeadViewUI
{
    int i;
    self.frame = CGRectMake(0, 0, kScreenWidth, 200);
    _imageArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"bg"], [UIImage imageNamed:@"bg"], nil];
    for ( i = 0; i < _imageArray.count; i ++) {
        _headImageView = [[UIImageView alloc] init];
        _headImageView.image = [UIImage animatedImageWithImages:_imageArray duration:5.0];
    }
    _scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
    _scrollView.contentSize = CGSizeMake(i * 320, 200);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.scrollEnabled = YES;
    [self addSubview:_scrollView];
    [self pageControl];
    [self initImageView];
}
//-(void)initScrollView
//{
//    _scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
//    _scrollView.contentSize = CGSizeMake(i * 320, 200);
//    _scrollView.showsHorizontalScrollIndicator = NO;
//    _scrollView.showsVerticalScrollIndicator = NO;
//    _scrollView.pagingEnabled = NO;
//    [self addSubview:_scrollView];
//}
-(void)initImageView
{
    _headImageView.frame = self.frame;
    _headImageView.contentMode = UIViewContentModeScaleToFill;
    [_scrollView addSubview:_headImageView];
}

-(void)initPageControl
{
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.frame = self.frame;
        _pageControl.numberOfPages = _imageArray.count ;//总的图片页数
        _pageControl.currentPage = 0;//当前页
        [_scrollView addSubview:_pageControl];
}

//用户滑动页面停下后调用改函数
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //更新UIpageController的当前页
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    [_pageControl setCurrentPage:offset.x / bounds.size.width];
    NSLog(@"%f",offset.x / bounds.size.width);
}

@end
