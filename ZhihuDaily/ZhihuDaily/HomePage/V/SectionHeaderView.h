//
//  SectionHeaderView.h
//  MyZhihuDaily
//
//  Created by xuyanli on 16/10/2.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) UILabel *dateLabel;

+(instancetype)headerViewWithTableView:(UITableView *)tableView;

-(void)setData:(NSString *)date;
@end
