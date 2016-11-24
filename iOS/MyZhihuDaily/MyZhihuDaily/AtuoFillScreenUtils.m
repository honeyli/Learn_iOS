//
//  AtuoFillScreenUtils.m
//  MyZhihuDaily
//
//  Created by xuyanli on 16/11/23.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "AtuoFillScreenUtils.h"
#import "AppDelegate.h"

@implementation AtuoFillScreenUtils
+(void)autoLayoutFillScreen:(UIView *)view
{
    for (UIView *firstLevelView in view.subviews) {
        firstLevelView.frame = [AtuoFillScreenUtils updateViewsFrame:firstLevelView.frame.origin.x withY:firstLevelView.frame.origin.y AndWidth:firstLevelView.frame.size.width AndHeight:firstLevelView.frame.size.height];
        for (UIView *secondLevelView in firstLevelView.subviews) {
            secondLevelView.frame = [AtuoFillScreenUtils updateViewsFrame:secondLevelView.frame.origin.x withY:secondLevelView.frame.origin.y AndWidth:secondLevelView.frame.size.width AndHeight:secondLevelView.frame.size.height];
        }
    }
}

+ (CGRect)updateViewsFrame:(CGFloat) x withY:(CGFloat) y AndWidth:(CGFloat) width AndHeight:(CGFloat) height {
    AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
    CGRect rect;
    rect.origin.x = x * appdelegate.autoSizeScaleX;
    rect.origin.y = y *appdelegate.autoSizeScaleX;
    rect.size.width = width * appdelegate.autoSizeScaleX;
    rect.size.height = height *appdelegate.autoSizeScaleY;
    return rect;
    
}

@end
