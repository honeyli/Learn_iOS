//
//  ContactDatas.h
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/5.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactDatas : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *image;
@property (nonatomic,strong) NSString *gender;
@property (nonatomic,strong) NSString *nickName;
@property (nonatomic,strong) NSString *pinyin;


+ (NSString *)transform:(NSString *)chines;

@end
