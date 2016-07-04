//
//  main.m
//  TestMutableArrary
//
//  Created by Rigel on 7/3/16.
//  Copyright © 2016 RJ. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        
        for (int i = 1; i <= 100; i++) {
            NSString *string =[NSString stringWithFormat:@"%d", i];
            [array addObject:string];
        }
        
        [array exchangeObjectAtIndex:0 withObjectAtIndex:49];
        NSLog(@"%@", array [49]);
        
        }
    return 0;
}
