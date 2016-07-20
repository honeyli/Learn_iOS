//
//  ViewController.m
//  testUIwebview
//
//  Created by xuyanli on 16/7/14.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
//    webView.scalesPageToFit = YES;//自动对界面进行缩放以适应屏幕
    webView.delegate = self;
    [self.view addSubview:webView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*) reuqest navigationType: (UIWebViewNavigationType)navigationType{
    return YES;
}
 
 -(void)webViewDidFinishLoad:(UIWebView*)webView{
 
 }
-(void)webView:(UIWebView*)webView DidFailLoadWithError:(NSError*)error {

}

@end
