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

#import "AFNetWorking.h"
#import "YYModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DetailNewsViewController ()<UIWebViewDelegate, UIScrollViewDelegate>
{
    UIWebView *webView;
}

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *imageSourceLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *coverImageView;

@end

@implementation DetailNewsViewController
-(void)receiveModel:(NewsResponseModel *)model
{
    self.storyID = model.storyID;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = YES;
   
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName : [UIFont boldSystemFontOfSize:16]};
    self.navigationController.navigationBar.translucent = YES;
    
    
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 64);
    UIColor *color = [UIColor colorWithRed:35/255.0 green:96/255.0 blue:200/255.0 alpha:0];
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];




    
    [self initUI];
    [self initDetailData];
}

-(void)initUI
{

    webView = [[UIWebView alloc] init];
    webView.backgroundColor = [UIColor clearColor];
    webView.frame =  CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height);
    webView.scrollView.delegate = self;
    webView.scrollView.showsHorizontalScrollIndicator = NO;
    webView.delegate = self;
    [self.view addSubview:webView];
    

    
    _imageView = [[UIImageView alloc] init];
    _imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    [webView.scrollView addSubview:_imageView];
    
    _coverImageView = [[UIImageView alloc] init];
    _coverImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    _coverImageView.contentMode = UIViewContentModeScaleToFill;
    _coverImageView.image = [UIImage imageNamed:@"Home_Image_Mask"];
    [webView.scrollView addSubview:_coverImageView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.frame = CGRectMake(10, 135, [UIScreen mainScreen].bounds.size.width - 50, 60);
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:20];
    _titleLabel.numberOfLines = 0;
    [self.view addSubview:_titleLabel];
    
    _imageSourceLabel = [[UILabel alloc] init];
    _imageSourceLabel.frame = CGRectMake(self.view.frame.size.width/2, 175, self.view.frame.size.width/2,40 );
    _imageSourceLabel.textAlignment = NSTextAlignmentCenter;
    _imageSourceLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    _imageSourceLabel.font = [UIFont systemFontOfSize:11];
    [self.view addSubview:_imageSourceLabel];
    
    
    UIView *toolBarView = [[UIView alloc] init];
    toolBarView.frame = CGRectMake(0, 675, self.view.frame.size.width, 58);
    toolBarView.backgroundColor = [UIColor whiteColor];
    [webView addSubview:toolBarView];
    
    UILabel *lineLabel = [[UILabel alloc] init];
    lineLabel.frame = CGRectMake(0, 675, 460, 1);
    lineLabel.text = @"";
    lineLabel.backgroundColor = [UIColor redColor];
    [toolBarView addSubview:lineLabel];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backButton.frame = CGRectMake(15, 2, 50, 45);
    [backButton setBackgroundImage:[UIImage imageNamed:@"News_Navigation_Arrow"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backHome) forControlEvents:UIControlEventTouchUpInside];
    [toolBarView addSubview:backButton];
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    nextButton.frame = CGRectMake(95, 2, 50, 45);
    [nextButton setBackgroundImage:[UIImage imageNamed:@"News_Navigation_Next"] forState:UIControlStateNormal];
    [toolBarView addSubview:nextButton];
    
    UIButton *voteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    voteButton.frame = CGRectMake(175, 2, 50, 45);
    [voteButton setBackgroundImage:[UIImage imageNamed:@"News_Navigation_Vote"] forState:UIControlStateNormal];
    [toolBarView addSubview:voteButton];
    
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    shareButton.frame = CGRectMake(255, 2, 50, 45);
    [shareButton setBackgroundImage:[UIImage imageNamed:@"News_Navigation_Share"] forState:UIControlStateNormal];
    [toolBarView addSubview:shareButton];
    
    UIButton *commentButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    commentButton.frame = CGRectMake(335, 2, 50, 45);
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
        [webView loadHTMLString:[NSString stringWithFormat:@"<html><head><link rel=\"stylesheet\" href=%@></head><body>%@</body></html>",[detailNews.css firstObject],detailNews.body] baseURL:nil];
        [_imageView sd_setImageWithURL:[NSURL URLWithString:detailNews.image] placeholderImage:[UIImage imageNamed:@""]];
        _imageSourceLabel.text = detailNews.image_source;
        _titleLabel.text = detailNews.title;
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
