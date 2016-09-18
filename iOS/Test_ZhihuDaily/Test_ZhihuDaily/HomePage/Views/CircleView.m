
//
//  CircleView.m
//  Test_ZhihuDaily
//
//  Created by xuyanli on 16/9/13.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

-(void)initUI
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate=self;
    _scrollView.contentSize=CGSizeMake(self.bounds.size.width*(_imageArray.count+2), 200);
    _scrollView.contentOffset=CGPointMake(self.bounds.size.width, 0);
    _scrollView.showsHorizontalScrollIndicator=NO;
    [self addSubview:_scrollView];
    
    for (int i; i < self.imageArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height + 20, self.bounds.size.width, 60)];
        imageView.image = [UIImage imageNamed:@"2"];
    }
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.bounds.size.height-20, self.bounds.size.width, 20)];
    _pageControl.numberOfPages = _imageArray.count;
    _pageControl.currentPage = 0;
    _pageControl.userInteractionEnabled = NO;
    _pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    [self addSubview:_pageControl];
    
}
@end
