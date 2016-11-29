//
//  NewsListResponseModel.m
//  MyZhihuDaily
//
//  Created by xuyanli on 16/9/22.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "NewsListResponseModel.h"
#import "NewsResponseModel.h"
#import "TopNewsResponseModel.h"
@implementation NewsListResponseModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"stories" : [NewsResponseModel class],
             @"topStories" : [TopNewsResponseModel class],
             };
}
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"topStories" : @"top_stories",
             };
}
@end
