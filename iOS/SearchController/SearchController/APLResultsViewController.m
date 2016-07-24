//
//  APLResultsViewController.m
//  SearchController
//
//  Created by xuyanli on 16/7/23.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "APLResultsViewController.h"
#import "APLProduct.h"
@interface APLResultsViewController ()

@end

@implementation APLResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:   (NSIndexPath *)indexPath{
    static  NSString *indentifider = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indentifider];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:indentifider ];
    }
    APLProduct *p = [self.dataArray objectAtIndex:indexPath.row];
    [self configureCell:cell forProduct:p];
    return cell;
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
