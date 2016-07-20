//
//  ViewController.m
//  testTableViewCell
//
//  Created by xuyanli on 16/7/15.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
    
//}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifider = @"indentifider";
    UITableViewCell *cell =
    [tableView dequeueReusableHeaderFooterViewWithIdentifier:indentifider];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:indentifider];
    cell.detailTextLabel.text = @"haha";
        UIImageView *image =
        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Image"]];
        
       }
    return cell;
}
@end
