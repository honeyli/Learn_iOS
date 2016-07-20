//
//  ViewController.m
//  TestSegmentdeControl
//
//  Created by xuyanli on 16/7/12.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *segmentArray = [[NSArray alloc] initWithObjects:@"1",@"2",@"3", nil];
    //初始化UIsegmentControl
    UISegmentedControl  *segmentedControlTemp= [[UISegmentedControl alloc] initWithItems:segmentArray];
    //segmentedControl = segmentedControlTemp;
    segmentedControlTemp.frame = CGRectMake(60, 10, 200, 50);
    
    [segmentedControlTemp setTitle:@"two" forSegmentAtIndex:1];//设置指定索引的题目
    //设置指定索引的图片
    UIImage *image = [[UIImage imageNamed:@"image_1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//以图片原有的方式设置，segment才能显示设置的图片
   [segmentedControlTemp setImage:image forSegmentAtIndex:2];
//    //在指定
//    [segmentedControlTemp insertSegmentWithImage:[UIImage imageNamed:@"image_2"] atIndex:3 animated:NO];
//    segmentedControlTemp.backgroundColor = [UIColor blueColor];
//    [segmentedControlTemp addTarget:self action:@selector(<#selector#>) forControlEvents:<#(UIControlEvents)#>]
    [self.view addSubview:segmentedControlTemp];
    [segmentedControlTemp addTarget:self action:@selector(selectedSegment:) forControlEvents:UIControlEventValueChanged];
    }

-(void)selectedSegment:(UISegmentedControl *)sender
{
    NSLog(@"%ld",(long)[sender selectedSegmentIndex]);
}



@end
