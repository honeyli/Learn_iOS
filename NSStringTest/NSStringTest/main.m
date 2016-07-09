//
//  main.m
//  NSStringTest
//
//  Created by Rigel on 7/5/16.
//  Copyright © 2016 RJ. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str1 = @"xyl is ios developer";
        NSString *str2 ;
        str2 = [str1 substringWithRange:NSMakeRange(7, 3)];
        NSLog(@"%@", str2);
        
        str2 = [str1 stringByReplacingOccurrencesOfString:@"ios" withString:@"android"];
        str2 = [str1 substringFromIndex:4];
        str2 = [str1 substringToIndex:4];
        
    }
    return 0;
}
