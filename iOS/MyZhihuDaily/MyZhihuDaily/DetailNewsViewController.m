//
//  DetailNewsViewController.m
//  MyZhihuDaily
//
//  Created by xuyanli on 16/9/29.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "DetailNewsViewController.h"
#import "HomePageViewController.h"
#import "DetailNewsResponse.h"
#import "DetailNewsView.h"
#import "DetailHeaderView.h"
#import "NewsListResponseModel.h"

#import "AFNetWorking.h"
#import "YYModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "TOWebViewController.h"

#define STATUS_BAR_TAP_NOTIFICATION @"STATUS_BAR_TAP_NOTIFICATION"

@interface DetailNewsViewController ()<SwitchNewsDelegate>

{
    NSInteger nextStoryID;
}
@property (nonatomic, strong) DetailNewsView *detailNewsView;
@property (nonatomic, strong) DetailHeaderView *headerView;

@end

@implementation DetailNewsViewController
-(void)receiveModel:(NewsResponseModel *)model
{
    self.storyID = model.storyID;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleStatusBarTapNotification:) name:STATUS_BAR_TAP_NOTIFICATION object:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:STATUS_BAR_TAP_NOTIFICATION object:nil];
}

#pragma Observer Method

-(void)handleStatusBarTapNotification:(NSNotification *)notification
{
    [_detailNewsView setContentOffset:CGPointZero animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self initUI];
    [self initToolBarView];
    [self initDetailData];
}

-(void)initToolBarView
{
    UIView *toolBarView = [[UIView alloc] init];
    toolBarView.frame = CGRectMake(0, self.view.frame.size.height - 45, self.view.frame.size.width, 48);
    toolBarView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:toolBarView];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backButton.frame = CGRectMake(0, 0 , self.view.frame.size.width / 5, 48);
    UIImage *image = [UIImage imageNamed:@"News_Navigation_Arrow"];
    [backButton setBackgroundImage:image forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backHome:) forControlEvents:UIControlEventTouchUpInside];
    [toolBarView addSubview:backButton];
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    nextButton.frame = CGRectMake(self.view.frame.size.width / 5, 0, self.view.frame.size.width / 5, 48);
    [nextButton setBackgroundImage:[UIImage imageNamed:@"News_Navigation_Next"] forState:UIControlStateNormal];
    [toolBarView addSubview:nextButton];
    
    UIButton *voteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    voteButton.frame = CGRectMake((self.view.frame.size.width / 5) * 2 , 0, self.view.frame.size.width / 5, 48);
    [voteButton setBackgroundImage:[UIImage imageNamed:@"News_Navigation_Vote"] forState:UIControlStateNormal];
    [toolBarView addSubview:voteButton];
    
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    shareButton.frame = CGRectMake((self.view.frame.size.width / 5) * 3 , 0, self.view.frame.size.width / 5, 48);
    [shareButton setBackgroundImage:[UIImage imageNamed:@"News_Navigation_Share"] forState:UIControlStateNormal];
    [toolBarView addSubview:shareButton];
    
    UIButton *commentButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    commentButton.frame = CGRectMake((self.view.frame.size.width / 5 ) * 4  , 0, self.view.frame.size.width / 5, 48);
    [commentButton setBackgroundImage:[UIImage imageNamed:@"News_Navigation_Comment"] forState:UIControlStateNormal];
    [toolBarView addSubview:commentButton];
}

-(void)initUI
{
    self.detailNewsView = [[DetailNewsView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 43)];
    _detailNewsView.delegate = self;
    [self.view addSubview:_detailNewsView];
}

-(void)initDetailData
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSString *relativePath = @"http://news-at.zhihu.com/api/4/news/";
    relativePath = [relativePath stringByAppendingFormat:@"%ld",(long)_storyID];
    
    NSURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:relativePath parameters:nil error:nil];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        NSLog(@" http response : %ld",(long)httpResponse.statusCode);
        
        if (error) {
            NSLog(@"%@",error);
        } else
        {
            NSLog(@"%@ %@",response,responseObject);
        }
        DetailNewsResponse *detailNews = [DetailNewsResponse yy_modelWithJSON:responseObject];
        [_detailNewsView updateNewsWithModel:detailNews];
        NSLog(@"%@",detailNews);
    }];
    [dataTask resume];
}
#pragma mark - ToolBar Clicked Handle
-(void)backHome:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
//-(void)backHome:(UIButton *)sender
//{
//    switch (sender.tag) {
//        case 0:
//            [self.navigationController popViewControllerAnimated:YES];
//            break;
//        case 1:
//            [self switc]
//            break
//        default:
//            break;
//    }
//}
//
//#pragma mark - Previous/Next News Switch Method
//
//-(void)switchToNextStoryWithID:(long)storyID
//{
//    DetailNewsView *detailNewsView = [[DetailNewsView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height- 43)];
//    
//    detailNewsView.delegate = self;
//    
//    [self.view insertSubview:detailNewsView belowSubview:_toolBarView];
//    
//    DetailNewsView *previousDetailNewsView = _detailNewsView;
//    
//    _detailNewsView = detailNewsView;
//    _storyID = nextStoryID;
//    [self initDetailData];

//    [UIView animateWithDuration:.5 animations:^{
//        detailNewsView.top = 0;
//        previousDetailNewsView.top = -kScreenHeight + 43;
//    }completion:^(BOOL finished){
//        [previousDetailNewsView removeFromSuperview];
//    }];
//}
//}

- (void)handleWebViewClickedWithURL:(NSURL *)url{
    TOWebViewController *safariVC = [[TOWebViewController alloc] initWithURL:url];
    safariVC.showUrlWhileLoading = NO;
    
    [self.navigationController pushViewController:safariVC animated:YES];
    [safariVC.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void)backHome
{
    HomePageViewController *homePage = [[HomePageViewController alloc] init];
    [self.navigationController pushViewController:homePage animated:YES];
}

@end
