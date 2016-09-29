//
//  HomePageViewController.m
//  testViewDeck
//
//  Created by xuyanli on 16/9/17.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "HomePageViewController.h"
#import "HeadView.h"
#import "NewsListResponseModel.h"
#import "NewsResponseModel.h"
#import "TopNewsResponseModel.h"
#import "HomepageCell.h"
#import "PreviousNewsModel.h"

#import "IIViewDeckController.h"
#import "AFNetworking.h"
#import "YYModel.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"

#define   kScreenWidth  [UIScreen mainScreen].bounds.size.width

@interface HomePageViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{

    UITableView *homeTableView;
    HeadView *headView;
    NewsListResponseModel *model;
    CGFloat navBarAlpha;
    NewsListResponseModel *previousNews;
}
@property (nonatomic, strong) NSString *currentDate;
@property (nonatomic, strong) UILabel *label;
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNav];
    [self createTableView];
    [self initData];
    
    homeTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
    homeTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
//    homeTableView.mj_footer.automaticallyHidden = YES;
}

- (void)changeNavColor
{
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 64);
    UIColor *color = [UIColor colorWithRed:35/255.0 green:96/255.0 blue:200/255.0 alpha:navBarAlpha];
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

-(void)initNav
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Home_Icon"] style:UIBarButtonItemStylePlain target:self action:@selector(OpenLeftVC:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.title = @"今日热点";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName : [UIFont boldSystemFontOfSize:16]};
    self.navigationController.navigationBar.translucent = YES;
    navBarAlpha = 0;
    [self changeNavColor];
}

-(void)createTableView
{
    homeTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y  , self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    homeTableView.delegate = self;
    homeTableView.dataSource = self;
    homeTableView.rowHeight = 80;
    headView = [[HeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    homeTableView.tableHeaderView = headView;
    homeTableView.showsVerticalScrollIndicator = NO;
    homeTableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:homeTableView];
    
}

-(void)initData
{
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:sessionConfiguration];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://news-at.zhihu.com/api/4/news/latest"]];
    
    NSURLSessionDataTask *dataTask = [sessionManager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        NSLog(@" http response : %ld",(long)httpResponse.statusCode);
        
        if (error) {
            NSLog(@"%@", error);
        }else
        {
            NSLog(@"%@ %@", response, responseObject);
        }
        model =[NewsListResponseModel yy_modelWithJSON:responseObject];
        _homeArrayList = model.stories;
        headView.topArray = model.topStories;
        self.currentDate = model.date;
        [headView initTopdata];
        
        [homeTableView reloadData];
    }];
    [dataTask resume];
}

-(void)loadMoreRequest
{
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:sessionConfiguration];
    
    NSString *relativePath = @"http://news-at.zhihu.com/api/4/news/before/";

    NSString *previousPath = [relativePath stringByAppendingString:_currentDate];

    NSURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:previousPath parameters:self.currentDate error:nil];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        NSLog(@" http response : %ld",(long)httpResponse.statusCode);
        if (error) {
            NSLog(@"%@",error);
        }else
        {
            NSLog(@"%@ %@",response,responseObject);
        }

        previousNews = [NewsListResponseModel yy_modelWithJSON:responseObject];
        NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
        self.currentDate = previousNews.date;
        for (int i = 0; i < previousNews.stories.count; i ++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_homeArrayList.count + i inSection:0];
            [indexPaths addObject:indexPath];
        }
        [self.homeArrayList addObjectsFromArray:previousNews.stories];
        [homeTableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
        [homeTableView.mj_footer endRefreshing];
    }];
    [dataTask resume];
}

-(void)OpenLeftVC:(id)sender
{
    
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_homeArrayList count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_homeArrayList objectAtIndex:section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifider = @"cell";
    HomepageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifider];
    if (!cell) {
        cell = [[HomepageCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifider];
    }
    NSMutableArray *array = [_homeArrayList objectAtIndex:indexPath.section];
    NewsResponseModel *news = [array objectAtIndex:indexPath.row];
    [cell configureCellWithModel:news];
    return cell;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat y = scrollView.contentOffset.y;
    if(y <= 0){
        //往上滑动，透明度为0
        navBarAlpha = 0;
        [self changeNavColor];
    }else{
        //滑动到距离为100的时候才显示完全
        navBarAlpha = y/100;
        if (navBarAlpha >= 1) {
            [self changeNavColor];
            return;
        }
        [self changeNavColor];
    }
}

-(void)refresh
{
    [self initData];
    [homeTableView reloadData];
}

-(void)loadMore
{
    [self loadMoreRequest];
}

@end
