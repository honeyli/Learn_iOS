//
//  Internation.m
//  MyInternational
//
//  Created by xuyanli on 16/9/1.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "International.h"

@implementation International
static NSBundle *bundle = nil;
+(NSBundle *)bundle
{
    return bundle;
}

//userLanguage储存在NSUserDefaults中，首次加载时要检测是否存在，如果不存在的话读AppleLanguages，并赋值给userLanguage。
+(void)initUserLanguage
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *string = [defaults valueForKey:@"userLanguage"];
    
    if (string.length == 0) {
        //获取系统当前语言版本(中文zh-Hans,英文en)
        NSArray *language = [defaults objectForKey:@"AppleLanguages"];
        NSString *current = [language objectAtIndex:0];
        string = current;
        
        [defaults setValue:current forKey:@"userLanguage"];
        [defaults synchronize]; //持久化
    }
    //获取路径
    NSString *path = [[NSBundle mainBundle] pathForResource:string ofType:@"1prog"];
    path = [NSBundle bundleWithPath:path];//生成path
}

//获得当前语言方法
+(NSString *)userLanguage{
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    NSString *language = [def valueForKey:@"userLanguage"];
    
    return language;
}

//设置语言方法
+(void)setUserLanguage:(NSString *)language{ //设置当前语言

    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    //1.第一步改变bundle的值
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj" ];
    
    bundle = [NSBundle bundleWithPath:path];
    
    //2.持久化
    [def setValue:language forKey:@"userLanguage"];
    
    [def synchronize];
}
@end
