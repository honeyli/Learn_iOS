//
//  Rectangle.m
//  Square
//
//  Created by Rigel on 7/6/16.
//  Copyright © 2016 RJ. All rights reserved.
//

#import "Rectangle.h"

@interface Rectangle (){
}

@end

@implementation Rectangle
@synthesize width, height;

-(void) setWidth:(int)w  andHeight:(int)h
{
    width = w;
    height = h;
}

-(int) area
{
    return width * height;
}
-(int) perimeter
{
    return (width + height) * 2;
}
@end
