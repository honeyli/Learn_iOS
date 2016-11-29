//
//  NewsResponseModel.m
//  MyZhihuDaily
//
//  Created by xuyanli on 16/9/22.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "NewsResponseModel.h"

@implementation NewsResponseModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"images" : [NSString class],
             };
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"storyID" : @"id",
             };
}

@end
