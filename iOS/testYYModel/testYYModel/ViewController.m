//
//  ViewController.m
//  testYYModel
//
//  Created by xuyanli on 16/9/7.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "YYModel.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //解析json，直接解析成对象
//    NSString *str = @"{\"name\":\"xu\",\"age\":\"12\",\"sex\":\"男\"}";
//     Person *person = [Person yy_modelWithJSON:str];
//    NSLog(@"%@",person);
//    NSString *str2 = @"[{\"name\":\"xu\",\"age\":\"12\",\"sex\":\"男\"},{\"name\":\"xu\",\"age\":\"12\",\"sex\":\"男\"},{\"name\":\"xu\",\"age\":\"12\",\"sex\":\"男\"}]";
//
//    NSArray *array = [NSArray yy_modelArrayWithClass:[Person class] json:str2];
//    NSLog(@"%@",array);
//    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.douban.com/v2/movie/subject/25881786"]];
    
    //使用NSURLSession获取网络返回的Json并处理
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError *_Nullable error) {
        //从网络返回了Json数据,用YYModel解析将JSON数据转换为Foundation对象
       
    }];
    
}
// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"viewController" : [ViewController class]};
}

@end
