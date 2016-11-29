//
//  HomePageDataManager.m
//  MyZhihuDaily
//
//  Created by xuyanli on 16/11/9.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "HomePageDataManager.h"
#import "NewsResponseModel.h"
@interface HomePageDataManager ()

@end

@implementation HomePageDataManager
- (NSInteger)getNextNewsWithSection:(NSInteger *)section currentID:(NSInteger)currentID{
    NewsListResponseModel *model = _homePageArray[*section];
    
    __block NSInteger nextNews = -1;
    __block BOOL isFound = NO;
    
    [model.stories enumerateObjectsUsingBlock:^(NewsResponseModel *model, NSUInteger idx, BOOL *stop){
        if (isFound) {
            nextNews = model.storyID;
            *stop = YES;
        }
        if (model.storyID == currentID) {
            isFound = YES;
        }
    }];
    
    if (nextNews > 0) {
        return nextNews;
    }
    
    if (*section + 1 < _homePageArray.count) {
        *section += 1;
    }
    return nextNews;
}
@end
