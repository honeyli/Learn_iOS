//
//  UploadTask.m
//  TestAFNetworking
//
//  Created by xuyanli on 16/9/7.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "UploadTask.h"
#import "AFNetworking.h"
@interface UploadTask ()

@end

@implementation UploadTask

- (void)viewDidLoad {
    [super viewDidLoad];
//    //Creating an Upload Task
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://example.com/upload"]];
//    NSURL *filePath = [NSURL fileURLWithPath:@"///Users/xuyanli/Library/Developer/CoreSimulator/Devices/737370B1-87ED-446B-A0B8-3799F60582E7/data/Containers/Data/Application/BB2BFA14-6BBE-462B-A4F1-908F84612270/Documents/bd_logo1_31bdc765.png"];
//    
//    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithRequest:request fromFile:filePath progress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//        if (error) {
//            NSLog(@"Error: %@",error);
//        }else
//        {
//            NSLog(@"success: %@ %@",response, responseObject);
//        }
//    }];
//    [uploadTask resume];
//}

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
