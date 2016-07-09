//
//  main.m
//  TestArray
//
//  Created by Rigel on 7/3/16.
//  Copyright © 2016 RJ. All rights reserved.
//

#import <Foundation/Foundation.h>

void testArray(void) {
    int  i;
    NSArray *mothNames = [NSArray arrayWithObjects:@"January",
                          @"February",
                          @"March",
                          @"April",
                          @"May",
                          @"June",
                          @"July",
                          @"August",
                          @"September",
                          @"october",
                          @"Novenver",
                          @"December", nil];
    
    NSLog(@"Month  Name");
    NSLog(@"====  ====");
    
    for (i = 0 ; i < 12 ; ++i ) {
        NSLog(@" %2i   %@", i+1, [mothNames objectAtIndex:i]);
    }
}

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        testArray();
    }
    return 0;
}
