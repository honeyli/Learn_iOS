//
//  main.m
//  TestDictionary
//
//  Created by Rigel on 7/4/16.
//  Copyright © 2016 RJ. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableDictionary *glossary = [[NSMutableDictionary   alloc] init];
        
        glossary [@"abstract class"] = @"A class defined so other classes can inherit from it";
        glossary [@"adopt"] = @"To implement all methods defined in a protocol";
        glossary [@"archiving"] = @"Storing an object for later use";
        
        NSLog(@"abstract class: %@", glossary [@"abstract class"]);
        NSLog(@"adopt : %@", glossary [@"adopt"]);
        NSLog(@"archiving : %@", glossary [@"archiving"]);
    }
    return 0;
}
