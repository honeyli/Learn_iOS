//
//  HomePageViewController.m
//  testViewDeck
//
//  Created by xuyanli on 16/9/17.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "HomePageViewController.h"
#import "IIViewDeckController.h"
#import "HeadView.h"
#import "AFNetworking.h"
#import "NewsListResponseModel.h"
#import "NewsResponseModel.h"
#import "TopNewsResponseModel.h"
#import "YYModel.h"
#import "UIImageView+WebCache.h"
#define   kScreenWidth  [UIScreen mainScreen].bounds.size.width

@interface HomePageViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{

    UITableView *homeTableView;
    UIView *view;
    NewsListResponseModel *model;
    int i;
}

@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    automaticallyAdjustsScrollViewInsets根据按所在界面的status bar，navigationbar，与tabbar的高度，自动调整scrollview的 inset,设置为no，不让viewController调整，我们自己修改布局即可~
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Home_Icon"] style:UIBarButtonItemStylePlain target:self action:@selector(OpenLeftVC:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.title = @"今日热点";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

    self.navigationController.navigationBar.translucent = YES;
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 64);
    UIColor *color = [UIColor clearColor  ];
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];


//    HeadView* headView = [[HeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];

    homeTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y  , self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    homeTableView.delegate = self;
    homeTableView.dataSource = self;
    homeTableView.rowHeight = 80;
    homeTableView.tableHeaderView = view;
    homeTableView.showsVerticalScrollIndicator = NO;
    homeTableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:homeTableView];
    
    [self initHeadView];
    [self initData];

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
        _topArray = model.topStories;
        for (i = 0; i < _topArray.count; i ++) {
            TopNewsResponseModel *topNews = [_topArray objectAtIndex:i];
            _headImageView = [[UIImageView alloc] initWithFrame:view.frame];
            [_headImageView sd_setImageWithURL:[NSURL URLWithString:topNews.image]placeholderImage:[UIImage imageNamed:@"Home_Icon"] options:SDWebImageRetryFailed];
        }
        _scrollView.contentSize = CGSizeMake(i * 320, 200);
        [_scrollView addSubview:_headImageView];
        [homeTableView reloadData];
    }];
    [dataTask resume];
}

-(void)initHeadView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:view.frame];
//    _scrollView.contentSize = CGSizeMake(i * 320, 200);
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.scrollEnabled = YES;
    [view addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc] initWithFrame:view.frame];
    _pageControl.numberOfPages = _topArray.count;
    _pageControl.enabled = NO;
    _pageControl.currentPage = 0;
    [_scrollView addSubview:_pageControl];
    
}
-(void)OpenLeftVC:(id)sender
{
    
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_homeArrayList count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifider = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifider];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifider];
        
        UILabel *homeLable = [[UILabel alloc] init];
        homeLable.frame = CGRectMake(10, 5, 300, 45);
        homeLable.tag = 1;
        [cell.contentView addSubview:homeLable];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(325, 5, 70, 70);
        imageView.tag = 2;
        [cell.contentView addSubview:imageView];
        
    }
    NewsResponseModel *news = [_homeArrayList objectAtIndex:indexPath.row];

    UILabel *homeLabel = (UILabel *)[cell.contentView viewWithTag:1];
    homeLabel.text = news.title;
    homeLabel.numberOfLines = 0;
    homeLabel.lineBreakMode = NSLineBreakByWordWrapping;
    homeLabel.font = [UIFont systemFontOfSize:15];
    
    UIImageView *newsImageView = (UIImageView *)[cell.contentView viewWithTag:2];
    
    if (news.images.count > 0) {
        NSString *urlStr = [news.images objectAtIndex:0];
        [newsImageView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"Home_Icon"] options:SDWebImageLowPriority];
    }
    
    return cell;
}
@end
