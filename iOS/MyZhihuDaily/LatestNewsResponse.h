//
//  LatestNewsResponse.h
//  MyZhihuDaily
//
//  Created by xuyanli on 16/9/22.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "NewsListResponseModel.h"
#import "TopNewsResponseModel.h"
@interface LatestNewsResponse : NewsListResponseModel
@property(nonatomic, strong) NSArray *topStories;
@property (nonatomic, strong) TopNewsResponseModel *topNews;
@end
