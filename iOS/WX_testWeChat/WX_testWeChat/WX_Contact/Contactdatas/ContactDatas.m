//
//  ContactDatas.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/5.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ContactDatas.h"

@implementation ContactDatas

+ (NSString *)transform:(NSString *)chinese
{
    NSMutableString *pinyin = [chinese mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    NSLog(@"%@", pinyin);
    return [pinyin uppercaseString];
}

-(void)setName:(NSString *)name
{
    _name = name;
    _pinyin = [ContactDatas transform:_name];
}
@end
