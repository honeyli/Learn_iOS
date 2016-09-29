//
//  TopNewsResponseModel.m
//  MyZhihuDaily
//
//  Created by xuyanli on 16/9/22.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "TopNewsResponseModel.h"

@implementation TopNewsResponseModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"storyID" : @"id",
             };
}
@end
