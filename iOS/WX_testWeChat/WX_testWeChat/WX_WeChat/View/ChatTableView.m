//
//  ChatView.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/9.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ChatTableView.h"
#import "ChatViewController.h"
@implementation ChatTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TouchedTableView" object:nil];
}
@end
