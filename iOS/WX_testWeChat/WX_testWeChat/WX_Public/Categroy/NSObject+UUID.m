//
//  NSObject+UUID.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/26.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "NSObject+UUID.h"

@implementation NSObject (UUID)
-(NSString*)uuid {
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    return result;
}
@end
