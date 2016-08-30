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
                NSString *array1 = array[i];
                NSString *array2 = array[j];
                if (array1 > array2 ) {
                    [array exchangeObjectAtIndex:i withObjectAtIndex:j];
                }
            }
        }
        
        NSLog(@"%@",array);
    }
    return 0;
}
