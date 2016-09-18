//
//  main.m
//  BubbleSort
//
//  Created by xuyanli on 16/8/30.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *array = [[NSMutableArray alloc]                                                                                             initWithObjects:@"4",@"7",@"1",@"5",@"3",@"6",@"2", nil];
        for (int i = 0; i < array.count; i ++) {
            for (int j = i + 1; j < array.count ; j ++) {
                NSString *str1 = array[i];
                NSString *str2 = array[j];
                if ([str1 compare:str2] == NSOrderedDescending ) {
                    [array exchangeObjectAtIndex:i withObjectAtIndex:j];
                }
            }
        }
        
        NSLog(@"%@",array);
    }
    return 0;
}
