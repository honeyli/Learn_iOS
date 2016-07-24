//
//  ViewController.m
//  donghua
//
//  Created by xuyanli on 16/7/21.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
#define kDegreesToRadian(x) (M_PI * (x) / 180.0)

#define kRadianToDegrees(radian) (radian*180.0)/(M_PI)
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *viewCA = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    viewCA.backgroundColor = [UIColor blueColor];
    [self.view addSubview:viewCA];
    [UIView beginAnimations:@"" context:@""];
    [UIView setAnimationDuration:1];
    viewCA.frame = CGRectMake(100, 100, 200, 200);
    viewCA.backgroundColor = [UIColor redColor];
    viewCA.alpha = 0.5;
    [UIView commitAnimations];
    
//    CABasicAnimation *cAanimation = [CABasicAnimation animationWithKeyPath:@"trans"];
//    cAanimation.toValue = @(M_PI);
//    cAanimation.duration = 2.0;
//    cAanimation.repeatCount = 500;
//    [viewCA.layer addAnimation:cAanimation forKey:@"anim"];
    
    /*UIView *viewPOP = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.bounds)-100-50, 50, 100, 100)];
    viewPOP.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:viewPOP];
    POPBasicAnimation*popAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
    popAnimation.toValue = @(M_PI);
    popAnimation.duration = 2.0;
    popAnimation.repeatCount = 500;
    [viewPOP.layer pop_addAnimation:popAnimation?forKey:@"rotation"];*/
    
    self.title = @"测试动画";
    self.view.backgroundColor = [UIColor grayColor];
    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 60, 40)];
//    label.backgroundColor = [UIColor blueColor];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.text = @"测试动画";
//    [self.view addSubview:label];
    
    //闪烁效果
   // [label.layer addAnimation:kCAAnimationCubic forKey:nil];
    //[label.layeraddAnimation:[selfrotation:2degree:kRadianToDegrees(90) direction:1repeatCount:MAXFLOAT] forKey:nil];
}

//-(CABasicAnimation *)scale:(NSNumber *)Multiple orgin:(NSNumber *)orginMultiple durTimes:(float)time Rep:(float)repertTimes
//{
//    CABasicAnimation *animation = [CABasicAnimationanimationWithKeyPath:@"tran"];
//    animation.fromValue = Multiple;
//    animation.toValue = orginMultiple;
//    animation.autoreverses = YES;
//    animation.repeatCount = repertTimes;
//    animation.duration = time;//不设置时候的话，有一个默认的缩放时间.
//    animation.removedOnCompletion = NO;
//    animation.fillMode = kCAFillModeForwards;
//    return  animation;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
