//
//  HeadView.h
//  test_ZhihuDaily
//
//  Created by xuyanli on 16/9/20.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadView : UIView
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSMutableArray *imageArray;
@end
