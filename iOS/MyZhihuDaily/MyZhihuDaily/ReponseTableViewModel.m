//
//  ReponseTableViewModel.m
//  test_ZhihuDaily
//
//  Created by xuyanli on 16/9/21.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ReponseTableViewModel.h"

@implementation ReponseTableViewModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"image":@"image",
             @"type":@"type",
             @"storyID":@"id",
             @"title":@"title"
             };
}

@end
