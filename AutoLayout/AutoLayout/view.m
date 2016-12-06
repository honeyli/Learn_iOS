//
//  view.m
//  AutoLayout
//
//  Created by xuyanli on 16/12/1.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "view.h"

@implementation view
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [self addView];
}

-(void)addView{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(17, 90, self.frame.size.width - 34, 40);
    view.backgroundColor = [UIColor redColor];
    [self addSubview:view];
}

@end
