//
//  ViewController.m
//  UISlider
//
//  Created by xuyanli on 16/7/11.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
   UILabel *label1;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //实例化一个滑动条，设置大小位置，但当滑块设置为0时滑块不可拖动
    UISlider  *slider = [[UISlider alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    slider.value = 0.8; //设置值
    slider.minimumValue = 1;//设置最小值；
    slider.maximumValue = 3;//设置最大值；
    slider.minimumTrackTintColor = [UIColor redColor];//设置已经滑过一端滑动条颜色
    slider.maximumTrackTintColor = [UIColor blackColor];//设置未滑过一端滑动条颜色
    //设置最小值一端图片，会挤压滑动条宽度
    slider.minimumValueImage = [UIImage imageNamed:@"slider_1"];
    //设置最大值一端图片，会挤压滑动条宽度
    slider.maximumValueImage = [UIImage imageNamed:@"slider_2"];
    //设置滑块颜色，但是无效，可能是默认的图片已经覆盖了颜色
    slider.thumbTintColor = [UIColor yellowColor];
    [slider  setThumbImage:[UIImage imageNamed:@"slider_2"] forState:UIControlStateNormal];
    //添加事件，而这里的事件是UIControlEventValueChanged值变化就是事件
    [slider addTarget:self action:@selector(getValue:) forControlEvents:UIControlEventValueChanged];
    //设置一个标签，把变动的值实时显示出来
    //得在上面弄成全局变量，所以这里就不是UILabel *label1了，而直接初始化即可
    label1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 300, 50)];
    label1.text = @"值";
    [self.view addSubview:label1];
    [self.view addSubview:slider];
}

- (void)getValue:(id) sender {
    UISlider *sli2 = (UISlider *)sender;
    label1.text = [NSString stringWithFormat:@"%f", sli2.value];
}

@end
