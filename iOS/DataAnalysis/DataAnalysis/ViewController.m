//
//  ViewController.m
//  DataAnalysis
//
//  Created by xuyanli on 16/9/6.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"
#import "XMLUtil.h"
#import "GDataXMLNode.h"
@interface ViewController ()
@property (retain, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, strong) NSMutableDictionary *dic;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSMutableString *GDatatext;
@end

@implementation ViewController
- (IBAction)NSJson:(UIButton *)sender {
    //GCD异步实现
    dispatch_queue_t  q1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q1, ^{
        
        //加载一个NSURL对象
        NSURLRequest *requestt = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.douban.com/v2/movie/subject/25881786"]];
        
        //使用NSURLSession获取网络返回的Json并处理
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:requestt completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            //从网络返回了Json数据，我们调用NSJSONSerialization解析它，将JSON数据转换为Foundation对象（这里是一个字典）
            self.dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSString *title = [self.dic objectForKey:@"original_title"];
            NSMutableArray *genresArray = [self.dic objectForKey:@"genres"];
            NSString *genres = [NSString stringWithFormat:@"%@/%@",[genresArray objectAtIndex:0],[genresArray objectAtIndex:1]];
            NSString *summary = [self.dic objectForKey:@"summary"];
            self.text = [NSString stringWithFormat:@"电影名称：\n%@\n体裁：\n%@\n剧情简介：\n%@",title, genres, summary];
            
            //更新UI操作需要在主线程
            dispatch_async(dispatch_get_main_queue(), ^{
                self.textView.text = self.text;
            });
        }];
        //调用任务
        [dataTask resume];
    });
}
- (IBAction)NSXMLParser:(id)sender {
    XMLUtil *util = [[XMLUtil alloc] init];
    [util parse];
    [util list];
    self.GDatatext = [[NSMutableString alloc] initWithString:@""];
    for (Person *person in [util list]) {
        NSString *str = [NSString stringWithFormat:@"学号:  %@  姓名:  %@  性别：%@  年龄：%@\n",person.pid,person.name,person.sex, person.gender];
        [self.GDatatext appendString:str];
    }
    self.textView.text = self.GDatatext;
    NSLog(@"%@",[util list]);
}

//- (IBAction)SBJson:(UIButton *)sender {
//    
//    dispatch_queue_t    q1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(q1, ^{
////        获取URL
//        NSURL *url = [[NSURL alloc]initWithString:@"https://api.douban.com/v2/movie/subject/2599550"];
//        NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
////        实例化SBJson对象，将Json格式字符串解析，转化为字典。
//       SBJsonParser *parser = [[SBJsonParser alloc] init];
//        self.dic = [parser objectWithString:jsonString];
//        
//        NSString *title = [self.dic objectForKey:@"original_title"];
//        NSMutableArray *genresArray = [self.dic objectForKey:@"genres"];
//        NSString *genres = [NSString stringWithFormat:@"%@/%@", [genresArray objectAtIndex:0], [genresArray objectAtIndex:1]];
//        NSString *summary = [self.dic objectForKey:@"summary"];
//        self.text = [NSString stringWithFormat:@"电影名称：\n%@\n体裁：\n%@\n剧情简介：\n%@", title, genres, summary];
//        
////        更新UI操作需要在主线程
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.textView.text = self.text;
//        });
//    });
//}
//- (IBAction)JsonKit:(UIButton *)sender {
//    dispatch_queue_t q1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(q1, ^{
//        
//        //还是先获取url
//        NSURL *url = [NSURL URLWithString:@"https://api.douban.com/v2/movie/subject/26279433"];
//        NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
//        //代码越来越简单了有木有！！就一个方法搞定~
//        self.dic = [jsonString objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
//        
//        
//        NSString *title = [self.dic objectForKey:@"original_title"];
//        NSMutableArray *genresArray = [self.dic objectForKey:@"genres"];
//        NSString *genres = [NSString stringWithFormat:@"%@/%@", [genresArray objectAtIndex:0], [genresArray objectAtIndex:1]];
//        NSString *summary = [self.dic objectForKey:@"summary"];
//        self.text = [NSString stringWithFormat:@"电影名称：\n%@\n体裁：\n%@\n剧情简介：\n%@", title, genres, summary];
//        
//        //更新UI操作需要在主线程
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.textView.text = self.text;
//        });
//    });
//    
//}
//- (IBAction)TouchJson:(id)sender {
//    //GCD异步实现
//    dispatch_queue_t  q1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(q1, ^{
//        //获取url
//        NSURL *url = [[NSURL alloc] initWithString:@"https://api.douban.com/v2/movie/subject/22265299"];
//        NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
//        
//        self.dic = [[CJSONDeserializer deserializer] deserialize:[jsonString dataUsingEncoding:NSUTF8StringEncoding] error:nil];
//        
//        NSString *title = [self.dic objectForKey:@"original_title"];
//        NSMutableArray *genresArray = [self.dic objectForKey:@"genres"];
//        NSString *genres = [NSString stringWithFormat:@"%@/%@",[genresArray objectAtIndex:0],[genresArray objectAtIndex:1]];
//        NSString *summary = [self.dic objectForKey:@"summary"];
//        self.text = [NSString stringWithFormat:@"电影名称：\n%@\n体裁：\n%@\n剧情简介：\n%@", title, genres, summary];
//        
//        //在主线程更新UI操作
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.textView.text = self.text;
//        });
//    });
//}
//- (IBAction)JDataXML:(id)sender {
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@".xml"];
//    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
//    //对象初始化
//    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data options:nil error:nil];
//    //获取根节点
//    GDataXMLElement *rootElement = [doc rootElement];
//    //获取其他节点
//    NSArray *students = [rootElement elementsForName:@"student"];
//    //初始化可变数组，用来显示到textView
//    self.GDatatext = [[NSMutableString alloc]initWithString:@""];
//    for (GDataXMLElement *student in students) {
//        //获取节点属性
//        GDataXMLElement *pidElement = [[student elementsForName:@"pid"] objectAtIndex:0];
//        NSString *pid = [pidElement stringValue];
//        
//        
//        GDataXMLElement *nameElement = [[student elementsForName:@"name"] objectAtIndex:0];
//        NSString *name = [nameElement stringValue];
//        
//        
//        GDataXMLElement *sexElement = [[student elementsForName:@"sex"] objectAtIndex:0];
//        NSString *sex = [sexElement stringValue];
//        
//        
//        GDataXMLElement *ageElement = [[student elementsForName:@"age"] objectAtIndex:0];
//        NSString *age = [ageElement stringValue];
//        
//        //调整一下姿势，添加到可变长字符串~~
//        NSString *t = [NSString stringWithFormat:@"学号：%@ 姓名：%@ 性别：%@ 年龄：%@\n", pid, name, sex, age];
//        [self.GDatatext appendString:t];
//    }
//    self.textView.text = self.GDatatext;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
