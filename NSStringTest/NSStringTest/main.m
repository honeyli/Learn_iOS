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
        NSString *str1 = @"This is string A";
        NSString *str2 = @"This is string B";
        NSString *res ;
        NSComparisonResult *comparisonResult;
        NSLog(@"length of str1 : %lu",[str1 length]);
        res = [NSString stringWithString:str1];
        NSLog(@"copy : %@", res);
        str2 = [str1 stringByAppendingString: str2];
        NSLog(@"Concatentation :%@", str2);
        
        if ([str1 isEqualToString:res] == YES) {
            NSLog(@"str1 == res");
        }
        else
            NSLog(@"str1 != res");
        res = [str1 uppercaseString ];
        NSLog(@"Uppercase conversion : %s", [res UTF8String]);
        res = [str1 lowercaseString];
        NSLog(@"Lowercase conversion : %@", res);
        str2 = [str1 stringByAppendingString:str2];
        res = [str1 substringFromIndex:5];
        NSLog(@"Chars from index 5 of str1 : %@",res);
        res = [str1 substringToIndex:3];
        NSLog(@"First 3 chars of str1 : %@", res);
    }
    return 0;
}
