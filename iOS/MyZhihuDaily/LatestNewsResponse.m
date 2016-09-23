//
//  LatestNewsResponse.m
//  MyZhihuDaily
//
//  Created by xuyanli on 16/9/22.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "LatestNewsResponse.h"

@implementation LatestNewsResponse
+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"topStories" : @"top_stories"
             };
    
}
@end
