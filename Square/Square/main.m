//
//  main.m
//  Square
//
//  Created by Rigel on 7/6/16.
//  Copyright © 2016 RJ. All rights reserved.
//

#import "Rectangle.h"
#import "Square.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Rectangle *myRect = [[Rectangle alloc] init];
        Square *mysquare = [[Square alloc] init];
        [myRect setWidth:5 ];
        [myRect setHeight:8];
        [mysquare setside:5];
        NSLog(@"Rectangle : w = %i, h = %i", myRect.width, myRect.height);
        NSLog(@"Area = %i,perimeter = %i",[myRect area],[myRect perimeter]);
        NSLog(@"Square s = %i", [mysquare side]);
        NSLog(@"Area = %i,perimeter = %i",[mysquare area],[mysquare perimeter]);
        [mysquare area];
        [mysquare perimeter];
        //isMemberOf
        
        if ([mysquare isMemberOfClass:[mysquare class]] == YES) {
            NSLog(@"mysquare is a member of Square class");
        }
    
        if ([mysquare isMemberOfClass:[Rectangle class]] == YES) {
            NSLog(@"mysquare is a member of Square class");
        }
        if ([mysquare isMemberOfClass:[NSObject class]] == YES) {
            NSLog(@"mysquare is a member of Square class");
        }
        
        //iskindOfClass
        
        if ([mysquare isKindOfClass:[mysquare class]] == YES) {
            NSLog(@"mysquare is a kind of Square");
        }
        if ([mysquare isKindOfClass:[Rectangle class]] == YES) {
            NSLog(@"mysquare is a kind of Square");
        }
        if ([mysquare isKindOfClass:[NSObject class]] == YES) {
            NSLog(@"myaquare is a kind of NSObject");
        }
        if ([mysquare respondsToSelector:@selector(setside:)] == YES) {
            NSLog(@"mysquare responds to setside : method");
        }
        if ([mysquare respondsToSelector:@selector(setWidth:andHeight:)] == YES) {
            NSLog(@"myquare responds to setWidth : and Height");
        }
        if ([mysquare respondsToSelector:@selector(alloc)] == YES) {
            NSLog(@"Square class responds to alloc method");
        }
        
        //instancesRespondTo:
        if ([Rectangle instanceMethodForSelector:@selector(setside:)]) {
            NSLog(@"Instance of Rectangle respond to setside: method");
        }
        if ([Square instanceMethodForSelector:@selector(setside:)]) {
            NSLog(@"Instance of Square respond to setside: method");
        }
        if([Square isSubclassOfClass: [Rectangle class]] == YES)
        {
            NSLog(@"Square is a subclass of a rectangle");
        }
        
    }
    return 0;
}
