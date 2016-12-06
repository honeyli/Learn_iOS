//
//  test.m
//  AutoLayout
//
//  Created by xuyanli on 16/12/3.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "test.h"
#import "ViewController.h"
@implementation test

- (void)drawRect:(CGRect)rect {
    [self testLabel];
}

-(void)testLabel{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake((self.frame.size.width - 100)/2, (self.frame.size.width - 100)/2, 100, 100);
    label.text = @"hello";
    label.backgroundColor = [UIColor redColor];
    UIGestureRecognizer *tap = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [label addGestureRecognizer:tap];
    [self addSubview:label];
}
-(void)tap{
    ViewController *vc = [[ViewController alloc] init];
    [vc diaLogForView];
}
@end
