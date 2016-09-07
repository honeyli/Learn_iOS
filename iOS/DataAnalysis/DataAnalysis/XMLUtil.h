//
//  XMLUtil.h
//  DataAnalysis
//
//  Created by xuyanli on 16/9/6.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
@interface XMLUtil : NSObject<NSXMLParserDelegate>
//添加属性
@property (nonatomic, strong) NSXMLParser *par;
@property (nonatomic, strong) Person *person;
//存放每个person
@property (nonatomic, strong) NSMutableArray *list;
//标记当前标签，以索引找到XML文件内容
@property (nonatomic, strong) NSString *currentElement;

//声明parser方法，用它来解析
-(void)parse;
@end
