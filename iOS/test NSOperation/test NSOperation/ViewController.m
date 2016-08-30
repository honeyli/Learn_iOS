//
//  ViewController.m
//  test NSOperation
//
//  Created by xuyanli on 16/8/16.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"
#define KURL  @"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImage:) object:KURL];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
}

-(void)downloadImage:(NSString *)url
{
    NSLog(@"url: %@",url);
    NSURL *nsUrl = [NSURL URLWithString:url];
    NSData *data = [[NSData alloc] initWithContentsOfURL:nsUrl];
    UIImage *image = [[UIImage alloc] initWithData:data];
    [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:YES];
}

-(void)updateUI:(UIImage *)image
{
    UIImageView *imageView= [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:imageView];
    imageView.image = image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
