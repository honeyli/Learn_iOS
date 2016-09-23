//
//  NewsListResponseModel.h
//  MyZhihuDaily
//
//  Created by xuyanli on 16/9/22.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsResponseModel.h"
@interface NewsListResponseModel : NSObject
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSArray *stories;
@property (nonatomic, strong) NSArray *topStories;
@end
