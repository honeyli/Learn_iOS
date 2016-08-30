//
//  ContactModel.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/21.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ContactModel.h"
@implementation ContactModel
-(instancetype)init
{
    if (self == [super init]) {
        self.contactID = [self uuid];
    }
    return self;
}

+ (NSString *)transform:(NSString *)chinese
{
    NSMutableString *pinyin = [chinese mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    NSLog(@"%@", pinyin);
    return [pinyin uppercaseString];
}

-(void)setNickName:(NSString *)name
{
    _nickName = name;
    _pinyin = [ContactModel transform:name];
}

@end
