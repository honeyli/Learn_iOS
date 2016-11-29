//
//  PreviousNewsModel.m
//  MyZhihuDaily
//
//  Created by xuyanli on 16/9/28.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "PreviousNewsModel.h"
#import "NewsResponseModel.h"
@implementation PreviousNewsModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"stories" : [NewsResponseModel class]
                };
}

@end
