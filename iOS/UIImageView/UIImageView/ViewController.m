//
//  ViewController.m
//  UIImageView
//
//  Created by xuyanli on 16/7/11.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *img = [UIImage  imageNamed:@"image_2"];
    CGSize imgSize = img.size;
    CGRect rect = self.view.frame;
    CGFloat startX = (rect.size.width - imgSize.width) / 2;
    CGFloat startY = (rect.size.height - imgSize.height) / 2;
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(startX, startY, imgSize.width, imgSize.height)];
    [image setImage:[UIImage  imageNamed:@"image_2"]];
    image.userInteractionEnabled = YES;
    image.hidden = NO;
    [image sizeToFit];//将图片尺寸调整为内容图片相同
    //image.alpha = (CGFloat)  ;//设置透明度
    [self.view addSubview:image];
    image.userInteractionEnabled = YES;
    image.contentMode = UIViewContentModeCenter;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)]; [image addGestureRecognizer:singleTap];
}

-(void)tapImageView:(UITapGestureRecognizer *)recognizer
{
    NSLog(@" fsdf" );
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
