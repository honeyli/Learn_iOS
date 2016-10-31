//
//  DetailNewsView.m
//  MyZhihuDaily
//
//  Created by xuyanli on 16/9/29.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "DetailNewsView.h"


@interface DetailNewsView ()<UIScrollViewDelegate, UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) UIButton *previousButton;
@property (nonatomic, strong) DetailNewsResponse *news;
@end

@implementation DetailNewsView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
     }
    return self;
}

-(void)updateNewsWithDetailNews:(DetailNewsResponse *)detailNews
{
    if ([detailNews isEqual:_news] || !detailNews) {
        return;
    }
    self.news = detailNews;
    [_webView loadHTMLString:[NSString stringWithFormat:@"<html><head><link rel=\"stylesheet\" href=%@></head><body>%@</body></html>",[_news.css firstObject],_news.body] baseURL:nil];
    
}

-(void)initUI
{
    self.frame = CGRectMake(0, 200, self.frame.size.width, self.frame.size.height);
    self.webView = [[UIWebView alloc] init];
    self.webView.backgroundColor = [UIColor clearColor];
    self.webView.frame = self.frame;
    self.webView.scrollView.delegate = self;
    self.webView.delegate = self;
    [self addSubview:self.webView];
}

@end
