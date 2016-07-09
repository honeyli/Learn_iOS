//
//  Square.m
//  Square
//
//  Created by Rigel on 7/6/16.
//  Copyright © 2016 RJ. All rights reserved.
//

#import "Square.h"

@implementation Square : Rectangle

-(void) setside:(int)s
{
    [self setWidth:s];
    [self setHeight:s];
}
-(int) side
{
    return self.width;
}

@end
