//
//  ViewController.m
//  PhotoViewController
//
//  Created by xuyanli on 16/8/3.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"
#define ImageCount 3
@interface ViewController ()
{
    UIImageView *imageView;
    int currentIndex;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initLayout];
}
-(void)initLayout
{
    //添加图片展示控件
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat topPadding = 20;
    CGFloat y = 22 + 44 + topPadding ,height = screenSize.height - y - topPadding;
    
    CGRect imageFrame = CGRectMake(0, y, screenSize.width, height);
    imageView = [[UIImageView alloc] initWithFrame:imageFrame];
    imageView.contentMode = UIViewContentModeScaleToFill; //设置内容模式为缩放填充
    imageView.userInteractionEnabled = YES;//必须设置为yes,不然无法接受手势操作
    [self.view addSubview:imageView];
    
    //添加默认图片
    UIImage *image = [UIImage imageNamed:@"0.jpg"];
    imageView.image = image;
//    [self showphotoName];
}
-(void)addGesture
{
    //添加点按手势，创建手势对象
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)];
    tapGesture.numberOfTapsRequired = 1;//设置点按次数，默认为1
    tapGesture.numberOfTouchesRequired = 1;//点按的手指数
    //添加手势到对象(注意，这里添加到了控制器视图中，而不是图片上，否则点击空白无法隐藏导航栏)
    [self.view addGestureRecognizer:tapGesture];
    
    //添加长按手势
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
