//
//  DetailNewsView.m
//  MyZhihuDaily
//
//  Created by xuyanli on 16/9/29.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "DetailNewsView.h"
#import "DetailHeaderView.h"
#import "DetailNewsResponse.h"
#import "UIView+Additons.h"

#import "TOWebViewController.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height
#define DetailHeaderViewHeight 210.0f


@interface DetailNewsView ()<UIScrollViewDelegate, UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) UIButton *previousButton;
@property (nonatomic, strong) DetailNewsResponse *news;
@property (nonatomic, strong) DetailHeaderView *headerView;

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

-(void)initUI
{
        self.webView = ({
        UIWebView *webView = [UIWebView new];
        webView.backgroundColor = [UIColor clearColor];
        webView.scrollView.delegate = self;
        webView.delegate = self;
        [self addSubview:webView];
        
        [webView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[webView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(webView)]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[webView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(webView)]];
        webView;
    });

    self.headerView = [[DetailHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, DetailHeaderViewHeight)];
    [_webView.scrollView addSubview:_headerView];
    
    self.previousButton = ({
        UIButton *previousButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        previousButton.center = CGPointMake(kScreenWidth/2, -20);
        [_webView.scrollView addSubview:previousButton];
        previousButton.enabled = NO;
        [previousButton setTitle:@"载入上一篇" forState:UIControlStateNormal];
        [previousButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        previousButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [previousButton setImage:[UIImage imageNamed:@"ZHAnswerViewBack"] forState:UIControlStateNormal];
        previousButton;
    });
    
    self.nextButton = ({
        UIButton *nextButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        nextButton.center = CGPointMake(kScreenWidth/2, kScreenHeight + 20);
        [_webView.scrollView addSubview:nextButton];
        nextButton.enabled = NO;
        [nextButton setTitle:@"载入下一篇" forState:UIControlStateNormal];
        [nextButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        nextButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [nextButton setImage:[UIImage imageNamed:@"ZHAnswerViewPrevIcon"] forState:UIControlStateNormal];
        nextButton;
    });
}

-(void)setContentOffset:(CGPoint)point animated:(BOOL)animated
{
    [_webView.scrollView setContentOffset:point animated:YES];
}

#pragma mark - DataSource Method

-(void)updateNewsWithModel:(DetailNewsResponse *)News
{
    if ([News isEqual:_news] || !News) {
        return;
    }
    
    self.news = News;
    [_webView loadHTMLString:[NSString stringWithFormat:@"<html><head><link rel=\"stylesheet\" href=%@></head><body>%@</body></html>", [_news.css firstObject], _news.body] baseURL:nil];
    [_headerView updateHeaderViewWithModel:News];
}


#pragma mark - Scrollview Delegate Method

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOffset = scrollView.contentOffset.y;
    if (yOffset <= 0) {
        CGRect f = _headerView.frame;
        f.origin.y = yOffset;
        f.size.height = DetailHeaderViewHeight - yOffset;
        _headerView.frame = f;
        
        if (yOffset <= -35) {
            [UIView animateWithDuration:.3 animations:^{
                _previousButton.imageView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI);
                
            }];
            
            if (yOffset < -40) {
                [scrollView setContentOffset:CGPointMake(0, -40) animated:NO];
            }
        }
        else{
            [UIView animateWithDuration:.3 animations:^{
                _previousButton.imageView.transform = CGAffineTransformIdentity;
                
            }];
        }
    }
    else{
        if(scrollView.contentSize.height + 20 > _nextButton.centerY)
            _nextButton.centerY = scrollView.contentSize.height + 20;
        
        if (yOffset + kScreenHeight - 35 >= scrollView.contentSize.height + 40) {
            [UIView animateWithDuration:.3 animations:^{
                _nextButton.imageView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI);
                
            }];
        }
        else
            [UIView animateWithDuration:.3 animations:^{
                _nextButton.imageView.transform = CGAffineTransformIdentity;
                
            }];
    }

}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    CGFloat yoffset = scrollView.contentOffset.y;
    
    if (yoffset <= -35) {
        if ([self.delegate respondsToSelector:@selector(switchToPreviousNews)]) {
            [self.delegate switchToPreviousNews];
        }
    }
    else if (yoffset + kScreenHeight - 35 >= scrollView.contentSize.height + 40){
        if ([self.delegate respondsToSelector:@selector(switchToNextNews)]) {
            [self.delegate switchToNextNews];
        }
    }
}

#pragma mark - UIWebViewDelegate Method

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        if ([self.delegate respondsToSelector:@selector(handleWebViewClickedWithURL:)]) {
            [self.delegate handleWebViewClickedWithURL:request.URL];
        }
        return NO;
    }
    return YES;
}

#pragma mark - Dealloc Method

- (void)dealloc{
    
    _webView.delegate = nil;
    _webView = nil;
    
}

@end
