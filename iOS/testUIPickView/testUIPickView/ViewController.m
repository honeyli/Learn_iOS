//
//  ViewController.m
//  testUIPickView
//
//  Created by xuyanli on 16/7/19.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong) NSMutableArray *proTimeList;
@property(nonatomic,strong) NSMutableArray *proTitleList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 100, 320, 216)];
    pickerView.showsSelectionIndicator = YES;//显示选中框
    pickerView.delegate = self;
    pickerView.dataSource = self;
    [self.view addSubview:pickerView];
    
    _proTimeList = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",nil];
    _proTitleList = [[NSMutableArray alloc]initWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"10",nil];
}
//列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

//每列个数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return [_proTitleList count];
    }
    return [_proTimeList count];
}
//每列宽度
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == 1) {
        return 40;
    }
    return 180;
}
//返回选中的行
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        NSString *str = [_proTitleList objectAtIndex:row];
        NSLog(@"%@",[_proTitleList objectAtIndex:row]);
        if ([str isEqualToString:@"b"] ) {
            [_proTimeList removeAllObjects];
            NSArray *arr = @[@"11",@"12",@"13",@"14",@"15",@"16"];
            [_proTimeList addObjectsFromArray:arr];
            [pickerView reloadComponent:1];
        }
    }
}
//返回当前行的内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [_proTitleList objectAtIndex:row];
    }
    return [_proTimeList objectAtIndex:row];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
