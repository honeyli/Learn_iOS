//
//  TouchEventViewController.m
//  testTouch
//
//  Created by xuyanli on 16/8/3.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "TouchEventViewController.h"
@interface TouchEventViewController ()
{
    UIButton *btn;
}
@end

@implementation TouchEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
//    [btn addTarget:self action:@selector(moveTouch:) forControlEvents:UIControlEventValueChanged];
//    [btn isTouchInside];
    btn.userInteractionEnabled = NO;
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
}
#pragma mark - 视图控制器的触摸事件
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"VC start touch.....");
}
//-(void)moveTouch:(UITouch *)sender
//{
//    NSLog(@"长按按钮");
//    [btn isTouchInside];
//}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //取得一个触摸对象
    UITouch *touch = [touches anyObject];
    //取得当前位置
    CGPoint current = [touch locationInView:self.view];
    //取得前一个位置
    CGPoint previous = [touch previousLocationInView:self.view];
    //移动前的中间位置
    CGPoint center = btn.center;
    //移动的偏移量
    CGPoint offset = CGPointMake(current.x - previous.x, current.y - previous.y);
    //重新设置新位置
    btn.center = CGPointMake(center.x + offset.x, center.y + offset.y);
    NSLog(@"VC start moving.....");
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"VC touch end");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
