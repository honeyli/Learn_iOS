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
{
    NewsListResponseModel *data;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initScrollView];
        [self initTopTitles];
    }
    return  self;
}

-(void)showTopNews
{
    int i;
    for (i = 0; i < _topArray.count; i ++) {
        TopNewsResponseModel *topNews = [_topArray objectAtIndex:i];
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * kScreenWidth, 0, kScreenWidth, 200)];
        [_headImageView sd_setImageWithURL:[NSURL URLWithString:topNews.image]placeholderImage:[UIImage imageNamed:@"Home_Icon"] options:SDWebImageRetryFailed];
        [_scrollView addSubview:_headImageView];
    }
    [_scrollView bringSubviewToFront:_pageControl];
    _scrollView.contentSize = CGSizeMake(_topArray.count * kScreenWidth, 200);
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 150, kScreenWidth, 10)];
    _pageControl.numberOfPages = _topArray.count;
    _pageControl.enabled = NO;
    _pageControl.currentPage = 0;
    [self addSubview:_pageControl];
}

-(void)initScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.scrollEnabled = YES;
    [self addSubview:_scrollView];
    
}

-(void)initTopTitles
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 60, kScreenWidth - 100, 35);
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.text = @"flskdfjsdsldkfjsasldkjfsldfjslkdfjslkdfjslkdfjsklfj";
    [_headImageView addSubview:label];
}

@end
