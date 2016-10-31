//
//  DetailNewsResponse.h
//  MyZhihuDaily
//
//  Created by xuyanli on 16/10/30.
//  strongright © 2016年 xuyanli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailNewsResponse : NSObject

@property (nonnull, strong) NSString *body;
@property (nonnull, strong) NSString *image_source;
@property (nonnull, strong) NSString *title;
@property (nonnull, strong) NSString *image;
@property (nonnull, strong) NSString *share_url;
@property (nonnull, strong) NSString *storyID;
@property (nonatomic, strong, nullable) NSArray<NSString *> *js;
@property (nonatomic, strong, nullable) NSArray<NSString *> *images;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong, nullable) NSArray<NSString *> *css;


@end
