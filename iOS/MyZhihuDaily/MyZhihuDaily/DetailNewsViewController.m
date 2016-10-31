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

#import "AFNetWorking.h"
#import "YYModel.h"
@interface DetailNewsViewController ()<UIWebViewDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) DetailNewsView *detailNewsView;
@end

@implementation DetailNewsViewController
-(void)receiveModel:(NewsResponseModel *)model
{
    self.storyID = model.storyID;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createToolBarView];
    _detailNewsView = [[DetailNewsView alloc] init];
    [self.view addSubview:_detailNewsView];
    [self initDetailData];
}

-(void)createToolBarView
{
    
        UIView *toolBarView = [[UIView alloc] init];
        toolBarView.frame = CGRectMake(0, 680, 460, 60);
        toolBarView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:toolBarView];
        
        UILabel *lineLabel = [[UILabel alloc] init];
        lineLabel.frame = CGRectMake(0, 300, 460, 1);
        lineLabel.text = @"";
        lineLabel.backgroundColor = [UIColor redColor];
        [toolBarView addSubview:lineLabel];
        
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        backButton.frame = CGRectMake(15, 10, 50, 45);
        [backButton setBackgroundImage:[UIImage imageNamed:@"News_Navigation_Arrow"] forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(backHome) forControlEvents:UIControlEventTouchUpInside];
        [toolBarView addSubview:backButton];
        
        UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        nextButton.frame = CGRectMake(95, 10, 50, 45);
        [nextButton setBackgroundImage:[UIImage imageNamed:@"News_Navigation_Next"] forState:UIControlStateNormal];
        [toolBarView addSubview:nextButton];
        
        UIButton *voteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        voteButton.frame = CGRectMake(175, 10, 50, 45);
        [voteButton setBackgroundImage:[UIImage imageNamed:@"News_Navigation_Vote"] forState:UIControlStateNormal];
        [toolBarView addSubview:voteButton];
        
        UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        shareButton.frame = CGRectMake(255, 10, 50, 45);
        [shareButton setBackgroundImage:[UIImage imageNamed:@"News_Navigation_Share"] forState:UIControlStateNormal];
        [toolBarView addSubview:shareButton];
        
        UIButton *commentButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        commentButton.frame = CGRectMake(335, 10, 50, 45);
        [commentButton setBackgroundImage:[UIImage imageNamed:@"News_Navigation_Comment"] forState:UIControlStateNormal];
        [toolBarView addSubview:commentButton];
        
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
        [_detailNewsView updateNewsWithDetailNews:detailNews];
        NSLog(@"%@",detailNews);
    }];
    [dataTask resume];
}
-(void)backHome
{
    HomePageViewController *homePage = [[HomePageViewController alloc] init];
    [self.navigationController pushViewController:homePage animated:YES];
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
