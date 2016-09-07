//
//  ViewController.m
//  testRequest
//
//  Created by xuyanli on 16/9/6.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableData *receiveData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.同步GET请求
    //第一步创建URL
    NSURL *url1 = [NSURL URLWithString:@"http://api.hudong.com/iphonexml.do?type=focus-c"];
    //第二步，通过URL创建网络请求
    /*NSURLRequest初始化方法第一个参数：请求访问路径，第二个参数：缓存协议，第三个参数：网络请求超时时间（秒）
    其中缓存协议是个枚举类型包含：
    
    NSURLRequestUseProtocolCachePolicy（基础策略）
    
    NSURLRequestReloadIgnoringLocalCacheData（忽略本地缓存）
    
    NSURLRequestReturnCacheDataElseLoad（首先使用缓存，如果没有本地缓存，才从原地址下载）
    
    NSURLRequestReturnCacheDataDontLoad（使用本地缓存，从不下载，如果本地没有缓存，则请求失败，此策略多用于离线操作）
    
    NSURLRequestReloadIgnoringLocalAndRemoteCacheData（无视任何缓存策略，无论是本地的还是远程的，总是从原地址重新下载）
    
    NSURLRequestReloadRevalidatingCacheData（如果本地缓存是有效的则不下载，其他任何情况都从原地址重新下载）*/
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url1 cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //第三步,连接到服务器
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *str1 = [[NSString alloc] initWithData:received encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str1);
    
   //2. 异步GET请求
    
    //第一步，创建url
    
    NSURL *url = [NSURL URLWithString:@"http://api.hudong.com/iphonexml.do?type=focus-c"];
    
    //第二步，创建请求
    
    NSURLRequest *request1 = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    //第三步，连接服务器
    
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    //同步post请求
    //第一步，创建url
    NSURL *url2 = [[NSURL alloc] initWithString:@"http://api.hudong.com/iphonexml.do"];
    //第二步，创建请求
    NSMutableURLRequest *muRequest = [[NSMutableURLRequest alloc] initWithURL:url2 cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [muRequest setHTTPMethod:@"POST"];//设置请求方式为Post，默认为get
    NSString *str2 = @"type = focus-c";//设置参数
    NSDate *data = [str2 dataUsingEncoding:NSUTF8StringEncoding];
    [muRequest setHTTPBody:data];
    
    //第三步，连接服务器
    NSData *received1 = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *str3 = [[NSString alloc]initWithData:received1 encoding:NSUTF8StringEncoding];
}

//异步请求的代理方法
//接收到服务器回应的时候调用此方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response

{
    
    NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
    
    NSLog(@"%@",[res allHeaderFields]);
    
    self.receiveData = [NSMutableData data];
}

//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error

{
    NSLog(@"%@",[error localizedDescription]);
}
@end
