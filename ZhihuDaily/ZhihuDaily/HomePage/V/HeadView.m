//
//  HeadView.m
//  test_ZhihuDaily
//
//  Created by xuyanli on 16/9/20.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "HeadView.h"
#import "UIImageView+webCache.h"
#import "TopNewsResponseModel.h"

@implementation HeadView
{
    UILabel *topLabel;
    NSTimer *timer;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initScrollView];
    }
    return  self;
}

-(void)showTopNews
{
    int i;
    for (i = 0; i < _topArray.count; i ++) {
        TopNewsResponseModel *topNews = [_topArray objectAtIndex:i];
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * kScreenWidth, 0, kScreenWidth, 210)];
        [_headImageView sd_setImageWithURL:[NSURL URLWithString:topNews.image]placeholderImage:[UIImage imageNamed:@"Home_Icon"] options:SDWebImageRetryFailed];
        [_scrollView addSubview:_headImageView];
        [self topTitle];
        topLabel.text = topNews.title;
        
    }
    _headImageView.contentMode = UIViewContentModeScaleAspectFill;
    _headImageView.clipsToBounds = YES;
    [_scrollView bringSubviewToFront:_pageControl];
    _scrollView.contentSize = CGSizeMake(_topArray.count * kScreenWidth, 200);
    _pageControl = [[UIPageControl alloc] initWithFrame:
                    CGRectMake(0, 170, kScreenWidth, 30)];
    _pageControl.numberOfPages = _topArray.count;
    _pageControl.enabled = NO;
    _pageControl.currentPage = 0;
    [self addSubview:_pageControl];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(topTimer) userInfo:nil repeats:YES];
}

-(void)topTimer
{
    
    if ( _pageControl.currentPage == _topArray.count - 1) {
        _pageControl.currentPage = 0;
    }else
    {
        _pageControl.currentPage ++;
    }
    CGSize viewSize = _scrollView.frame.size;
    CGRect rect = CGRectMake(_pageControl.currentPage * viewSize.width, 0, viewSize.width, viewSize.height);
    BOOL animate = YES;
    if (_pageControl.currentPage == 0) {
        animate = NO;
    }
    [_scrollView scrollRectToVisible:rect animated:animate];
}

-(void)initScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.scrollEnabled = YES;
    [self addSubview:_scrollView];
    
}

-(void)topTitle
{
    
    topLabel = [[UILabel alloc] init];
    topLabel.lineBreakMode = NSLineBreakByWordWrapping;
    topLabel.frame = CGRectMake(10, 135, kScreenWidth - 50, 60);
    topLabel.textColor = [UIColor whiteColor];
    topLabel.numberOfLines = 0;
    topLabel.font = [UIFont systemFontOfSize:19];
    [_headImageView addSubview:topLabel];
}

@end
