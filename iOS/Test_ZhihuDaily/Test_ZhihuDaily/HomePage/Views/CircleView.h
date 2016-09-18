//
//  CircleView.h
//  Test_ZhihuDaily
//
//  Created by xuyanli on 16/9/13.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSArray *imageArray;
@end
