//
//  DataSoureManager.m
//  test_ZhihuDaily
//
//  Created by xuyanli on 16/9/19.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "DataSoureManager.h"
#import "LeftMenuModel.h"
@implementation DataSoureManager
-(void)createDatas
{
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
}
@end
