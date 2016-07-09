//
//  main.m
//  Dictionary
//
//  Created by Rigel on 7/4/16.
//  Copyright © 2016 RJ. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
        [dictionary setObject:@"xiaoming" forKey:@"name"];
        [dictionary setObject:@"21" forKey:@"age"];
        [dictionary setObject:@"nan" forKey:@"sex"];
        NSLog(@"%lu", (unsigned long)[dictionary count]);
        [dictionary removeObjectForKey:@"age"];
        NSLog(@"%@", [dictionary allValues]);
        NSLog(@"%@", [dictionary allKeys]);
        NSDictionary
        
    }
    return 0;
}
