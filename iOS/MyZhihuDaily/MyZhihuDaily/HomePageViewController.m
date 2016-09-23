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

@interface HomePageViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableString *string;
    NSString *str;
}
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    automaticallyAdjustsScrollViewInsets根据按所在界面的status bar，navigationbar，与tabbar的高度，自动调整scrollview的 inset,设置为no，不让viewController调整，我们自己修改布局即可~
    [self initData];
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

    
    HeadView *headView = [[HeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y  , self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 70;
    tableView.tableHeaderView = headView;
    
    [self.view addSubview:tableView];
    [tableView reloadData];
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
        
        NewsListResponseModel *model =[NewsListResponseModel yy_modelWithJSON:responseObject];
        NSLog(@"%@",model);
        
        _homeArray = [[NSMutableArray alloc] init];
        [_homeArray addObject:model.stories];
        for (int i = 0; i < _homeArray.count; i ++) {
            
            NewsResponseModel *model = [_homeArray objectAtIndex:i];
            NSString *title = model.title;
            [_homeArray addObject:title];
            NSLog(@"%@", title);
        }
    }];
    [dataTask resume];
}
-(void)OpenLeftVC:(id)sender
{
    
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_homeArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifider = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifider];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifider];
    }
    cell.textLabel.text = [_homeArray objectAtIndex:indexPath.row];
    return cell;
}
@end
