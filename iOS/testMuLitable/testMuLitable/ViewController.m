//
//  ViewController.m
//  testMuLitable
//
//  Created by xuyanli on 16/7/15.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()   <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UIBarButtonItem *editButton;
@property(nonatomic,strong) UIBarButtonItem *deleteButton;
@property(nonatomic,strong) UIBarButtonItem *cancelButton;
@property(nonatomic,strong) UIBarButtonItem *addButton;
@property(nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation ViewController

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.allowsMultipleSelectionDuringEditing = YES;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view  addSubview:tableView];
    self.dataArray = [NSMutableArray init];
    NSString *itemFormatString = NSLocalizedString(@"Item %d", @"Format string for Item");
    
    for (unsigned int itemNumber = 1; itemNumber <= 12; itemNumber ++) {
        NSString *itemName = [NSString stringWithFormat:itemFormatString,itemNumber];
        [self.dataArray addObject:itemName];
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

/*-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.dataArray ]
}*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kCellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    
    return cell;
}

@end
