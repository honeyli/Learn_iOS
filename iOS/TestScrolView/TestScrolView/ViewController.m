//
//  ViewController.m
//  TestScrolView
//
//  Created by xuyanli on 16/7/12.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
/*
 （1）常用属性：
 
 1）@property(nonatomic)CGPointcontentOffset; 这个属性⽤用来表⽰示UIScrollView滚动的位置
 
 2）@property(nonatomic)CGSizecontentSize;这个属性⽤用来表⽰示UIScrollView内容的尺⼨寸,滚动范围(能滚多远)
 
 3）@property(nonatomic)UIEdgeInsetscontentInset; 这个属性能够在UIScrollView的4周增加额外的滚动区域
 
 （2）其他属性：
 
 1）@property(nonatomic) BOOL bounces;  设置UIScrollView是否需要弹簧效果
 
 2）@property(nonatomic,getter=isScrollEnabled)BOOLscrollEnabled; 设置UIScrollView是否能滚动
 
 3）@property(nonatomic) BOOL showsHorizontalScrollIndicator; 是否显⽰示⽔水平滚动条
 
 4）@property(nonatomic) BOOL showsVerticalScrollIndicator; 是否显⽰示垂直滚动条
 
 • 如果UIScrollView⽆无法滚动,可能是以下原因:
 
 （1）没有设置contentSize
 
 （2） scrollEnabled = NO
 
 （3） 没有接收到触摸事件:userInteractionEnabled = NO
 
 （4）没有取消autolayout功能(要想scrollView滚动,必须取消autolayout)
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    //开启缩放功能需要调整视图的两个属性，分别是maxinumZoomScale 和 mininumZoomScale 。这样就可以允许用户使用捏合手势调整内容大小：
   // scrollView.backgroundColor = [UIColor grayColor];
    scrollView.minimumZoomScale = 0.5;//最小允许放大到0.5倍
    scrollView.maximumZoomScale = 5.0;//最大允许放大到2.0倍
    [self.view addSubview:scrollView];

    UIImageView *imageview = [[UIImageView alloc] init];
    imageview.image = [UIImage imageNamed:@"image_1"];
    CGFloat  imgW = imageview.image.size.width;
    CGFloat  imgH = imageview.image.size.height;
    imageview.frame = CGRectMake(40, 40, imgW, imgH);
    [scrollView addSubview:imageview];
    scrollView.contentSize = CGSizeMake(CGRectGetMaxX(self.view.frame), CGRectGetMaxY(self.view.frame) + 1);//设置UIscrollview的滚动范围（内容大小）
    //隐藏水平滚动条
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.showsVerticalScrollIndicator = YES;
    //UITapGestureRecognizer *singleTap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapimageView)];[image UITapGestureRecognizer:singleTap];
}

@end



