//
//  ReponseTableViewModel.h
//  test_ZhihuDaily
//
//  Created by xuyanli on 16/9/21.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReponseTableViewModel : NSObject
@property (nonatomic, strong) NSString *image;
@property (nonatomic, assign, readonly) NSInteger type;
@property (nonatomic, assign, readonly) NSInteger storyID;
@property (nonatomic, copy, readonly) NSString *title;
@end
