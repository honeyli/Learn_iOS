//
//  NewsResponseModel.h
//  MyZhihuDaily
//
//  Created by xuyanli on 16/9/22.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsResponseModel : NSObject
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) long storyID;
@property (nonatomic, strong) NSString *title;
@end
