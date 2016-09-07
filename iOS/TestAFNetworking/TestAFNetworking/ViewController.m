//
//  ViewController.m
//  TestAFNetworking
//
//  Created by xuyanli on 16/9/5.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
@interface ViewController ()
@property (nonatomic, strong) UIProgressView *progressView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Creating a download task
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png"]];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);
    }];
    [downloadTask resume];

//    //Creating an Upload Task
//    NSURLSessionConfiguration *uploadConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *uploadManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:uploadConfiguration];
//    
//    NSURLRequest *uploadRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://example.com/upload"]];
//    NSURL *filePath = [NSURL fileURLWithPath:@"///Users/xuyanli/Library/Developer/CoreSimulator/Devices/737370B1-87ED-446B-A0B8-3799F60582E7/data/Containers/Data/Application/BB2BFA14-6BBE-462B-A4F1-908F84612270/Documents/bd_logo1_31bdc765.png"];
//    
//    NSURLSessionUploadTask *uploadTask = [uploadManager uploadTaskWithRequest:uploadRequest fromFile:filePath progress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//        if (error) {
//            NSLog(@"Error: %@",error);
//        }else
//        {
//            NSLog(@"success: %@ %@",response, responseObject);
//        }
//    }];
//    [uploadTask resume];
//    
////  Creating an Upload Task for a Multi-Part Request, with Progress
//    NSMutableURLRequest *multiRequest = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:@"http://example.com/upload" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        
//        AFURLSessionManager *multiManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//        
//        NSURLSessionUploadTask *multiUploadTask;
//        multiUploadTask = [multiManager
//                           uploadTaskWithStreamedRequest:multiRequest
//                           progress:^(NSProgress * _Nonnull uploadProgress) {
//                               
//                               dispatch_async(dispatch_get_main_queue(), ^{
//                                   
//                                   [_progressView setProgress:uploadProgress.fractionCompleted];
//                                   
//                               });
//                               
//                           } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//                               if (error) {
//                                   NSLog(@"Error: %@",error);
//                               }else
//                               {
//                                   NSLog(@"%@ %@",response, responseObject);
//                               }
//                           }];
//        [multiUploadTask resume];
//    } error:nil];
//
//    //Creating a Data Task
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//    
//    NSURL *URL = [NSURL URLWithString:@"http://httpbin.org/get"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//    
//    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
//        if (error) {
//            NSLog(@"Error: %@", error);
//        } else {
//            NSLog(@"%@ %@", response, responseObject);
//        }
//    }];
//    [dataTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
