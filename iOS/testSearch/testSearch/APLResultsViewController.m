//
//  APLResultsViewController.m
//  testSearch
//
//  Created by xuyanli on 16/7/24.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "APLResultsViewController.h"
#import "APLProduct.h"
@interface APLResultsViewController ()

@end

@implementation APLResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifider = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifider];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifider];
    }
    APLProduct *p = [_dataArray objectAtIndex:indexPath.row];
    [self configureCell:cell forProduct:p];
    return cell;
}
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
