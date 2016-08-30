//
//  ViewController.m
//  Threads
//
//  Created by xuyanli on 16/8/16.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"
#define KURL  @"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg"
@interface ViewController ()

@end

@implementation ViewController
-(void)downLoadImage:(NSString *)url
{
    NSError *error;
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url] options:NSDataReadingUncached error:&error];
    UIImage *image = [[UIImage alloc] initWithData:imgData];
    if (image == nil) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:self.view.frame];
        image.image = [UIImage imageNamed:@" "];
    }else
    {
        //图片下载完之后通知主线程更新界面
        [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:YES];
    }
}
-(void)updateUI:(UIImage *)image
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:imageView];
    imageView.image = image;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(downLoadImage:) object:KURL];
    [thread start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
