//
//  TopView.h
//  Test_ZhihuDaily
//
//  Created by xuyanli on 16/9/11.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopView : UIView<UIScrollViewDelegate>
{
    NSTimer *timer;
}

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageController;
@property (nonatomic, strong) UILabel *imageNum;
@property (nonatomic) NSUInteger *totalNum;

-(void)setArray:(NSArray *)imageArray;

-(void)openTimer;
-(void)closeTimer;
@end
