//
//  Internation.h
//  MyInternational
//
//  Created by xuyanli on 16/9/1.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface International : NSObject
+(NSBundle *)bundle;//获取当前资源文件
+(void)initUserLanguage;//初始化语言文件
+(NSString *)userLanguage;//获取应用当前语言
+(void)setUserLanguage:(NSString *)language; //设置当前语言
@end
