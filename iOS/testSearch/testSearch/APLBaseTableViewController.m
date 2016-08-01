//
//  APLBaseTableViewController.m
//  testSearch
//
//  Created by xuyanli on 16/7/24.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "APLBaseTableViewController.h"

@interface APLBaseTableViewController ()

@end

@implementation APLBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)configureCell:(UITableViewCell *)cell forProduct:(APLProduct *)product
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
    NSString *priceString = [numberFormatter stringFromNumber:product.inToPrice];
    NSString *detailStr = [NSString stringWithFormat:@"%@",priceString];
    cell.textLabel.text = product.name;
    cell.detailTextLabel.text = detailStr;
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
