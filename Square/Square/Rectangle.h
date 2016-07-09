//
//  Rectangle.h
//  Square
//
//  Created by Rigel on 7/6/16.
//  Copyright © 2016 RJ. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Rectangle : NSObject
{
 
}
@property int width ,height;
-(void)setWidth:(int)w andHeight:(int)h;
-(int)area;
-(int)perimeter;
@end
