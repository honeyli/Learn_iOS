//
//  LeftMenuViewController.m
//  testViewDeck
//
//  Created by xuyanli on 16/9/17.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "LeftMenuModel.h"
#import "LeftMenuTableViewCell.h"
#import "HearderView.h"
#import "FooterView.h"
@interface LeftMenuViewController ()<UITableViewDelegate,UITableViewDataSource>
@end



@implementation LeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *myTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width - (195), self.view.frame.size.height) style:UITableViewStylePlain];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.rowHeight = 50;
    myTableView.separatorColor = [UIColor blackColor];
    myTableView.backgroundColor = [UIColor colorWithRed:49/255.0 green:49/255.0 blue:49/255.0 alpha:15];
    
    HearderView *hearderView = [[HearderView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, 35, self.view.frame.size.width, 120)];
    myTableView.tableHeaderView = hearderView;

    FooterView *footView = [[FooterView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, 240, self.view.frame.size.width, self.view.frame.size.height)];
    myTableView.tableFooterView = footView;
    [self.view addSubview:myTableView];
    
    
    LeftMenuModel *model1 = [[LeftMenuModel alloc] init];
    model1.title = @"首页";

    LeftMenuModel *model2 = [[LeftMenuModel alloc] init];
    model2.title = @"用户推荐日报";

    
    LeftMenuModel *model3 = [[LeftMenuModel alloc] init];
    model3.title = @"电影日报";

    
    LeftMenuModel *model4 = [[LeftMenuModel alloc] init];
    model4.title = @"不许无聊";

    
    LeftMenuModel *model5 = [[LeftMenuModel alloc] init];
    model5.title = @"设计日报";

    
    LeftMenuModel *model6 = [[LeftMenuModel alloc] init];
    model6.title = @"财经日报";

    
    LeftMenuModel *model7 = [[LeftMenuModel alloc] init];
    model7.title = @"互联网安全";

    
    LeftMenuModel *model8 = [[LeftMenuModel alloc] init];
    model8.title = @"开始游戏";

    
    LeftMenuModel *model9 = [[LeftMenuModel alloc] init];
    model9.title = @"音乐日报";

    
    LeftMenuModel *model10 = [[LeftMenuModel alloc] init];
    model10.title = @"动漫日报";

    
    LeftMenuModel *model11 = [[LeftMenuModel alloc] init];
    model11.title = @"体育日报";

    
    NSMutableArray *dataArray = [[NSMutableArray alloc] initWithObjects:model1, model2 , model3, model4, model5, model6, model7, model8, model9, model10, model11, nil];
    self.dataList = dataArray;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifider = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifider];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifider];
        cell.backgroundColor = [UIColor colorWithRed:49/255.0 green:49/255.0 blue:49/255.0 alpha:1];
        //设置cell选中状态的颜色
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor = [UIColor blackColor];
    }
    LeftMenuModel *model = [_dataList objectAtIndex:indexPath.row];
    cell.textLabel.text = model.title;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    if (indexPath.row == 0) {
        if (model.imageName.length == 0) {
            cell.imageView.image = [UIImage imageNamed:@"Menu_Icon_Home"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    return cell;
}

@end
