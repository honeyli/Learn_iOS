//
//  SetBarView.m
//  MyZhihuDaily
//
//  Created by xuyanli on 16/10/1.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "SetBarView.h"

@implementation SetBarView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return  self;
}

-(void)setBarStyle
{
    UIToolbar *toolBar = [[UIToolbar alloc] init];
    toolBar.frame = CGRectMake(0, 1000, self.frame.size.width, 70);
    toolBar.backgroundColor = [UIColor redColor];
}
@end
