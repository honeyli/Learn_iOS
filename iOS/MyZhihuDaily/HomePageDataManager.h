//
//  HomePageDataManager.h
//  MyZhihuDaily
//
//  Created by xuyanli on 16/11/9.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsListResponseModel.h"
#import "NewsResponseModel.h"
@interface HomePageDataManager : NSObject

@property (nonatomic, strong) NSMutableArray<NewsListResponseModel *> *homePageArray;

@end
