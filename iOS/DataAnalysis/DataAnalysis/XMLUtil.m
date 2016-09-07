//
//  XMLUtil.m
//  DataAnalysis
//
//  Created by xuyanli on 16/9/6.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "XMLUtil.h"
#import "Person.h"
@implementation XMLUtil
-(instancetype)init
{
    if (self = [super init]) {
        //获取事先准备好的XML文件
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path = [bundle pathForResource:@"test" ofType:@".xml"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        self.par = [[NSXMLParser alloc] initWithData:data];
        
        //添加代理
        self.par.delegate = self;
        //初始化数组存放解析后的数据
        self.list = [NSMutableArray arrayWithCapacity:5];
    }
    return self;
}

//几个代理方法的实现，是按逻辑上的顺序排列的，但实际调用过程中中间三个可能因为循环等问题乱掉顺序
//开始解析
-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"parserDidStartDocument...........");
}

//准备节点
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    self.currentElement = elementName;
    if ([self.currentElement isEqualToString:@"student"]) {
        self.person = [[Person alloc] init];
    }
}

//获取节点内容
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([self.currentElement isEqualToString:@"pid" ]) {
        [self.person setPid:string];
    }else if ([self.currentElement isEqualToString:@"name"])
    {
        [self.person setName:string];
    }else if ([self.currentElement isEqualToString:@"sex"])
    {
        [self.person setSex:string];
    }else if ([self.currentElement isEqualToString:@"gender"])
    {
        [self.person setGender:string];
    }
}

//解析完一个节点
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"student"]) {
        [self.list addObject:self.person];
    }
    self.currentElement = nil;
}

//解析结束
-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"parserDidEndDocument");
}

//外部调用接口
-(void)parse
{
    [self.par parse];
}
@end
