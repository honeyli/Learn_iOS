//
//  SectionHeaderView.m
//  MyZhihuDaily
//
//  Created by xuyanli on 16/10/2.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "SectionHeaderView.h"
static NSString *header_reuseid = @"header_reuseid";

@interface SectionHeaderView()


@end

@implementation SectionHeaderView

+(instancetype)headerViewWithTableView:(UITableView *)tableView
{
    SectionHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:header_reuseid];
    if (!header) {
        header = [[SectionHeaderView alloc] init];
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
        [header.contentView addSubview:label];
        label.font = [UIFont boldSystemFontOfSize:16];
        header.dateLabel = label;
        header.contentView.backgroundColor = [UIColor colorWithRed:35/255.0 green:92/255.0 blue:200/255.0 alpha:1];
    }
    return header;
}

-(void)setData:(NSString *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    dateFormatter.dateFormat = @"yyyyMMdd";
    NSDate *da = [dateFormatter dateFromString:date];
    dateFormatter.dateFormat = @"MM月dd日 EEEE";
    date = [dateFormatter stringFromDate:da];
    
    self.dateLabel.text = date;
    [self.dateLabel sizeToFit];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    self.dateLabel.center = self.contentView.center;
}
@end
