//
//  StyleCellTableViewCell.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/4.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "StyleCellTableViewCell.h"
#import "ContactViewController.h"
#import "ContactDatas.h"
@implementation StyleCellTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self) {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        [self createCellDatas];
    }
    return self;
}
- (void)createCellDatas
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(15, 5, 49, 49);
    imageView.tag = 1;
    [self.contentView addSubview:imageView];
    
    UILabel *labelName = [[UILabel alloc] init];
    labelName.frame = CGRectMake(75, 12, 145, 18);
    labelName.tag = 2;
    [self.contentView addSubview:labelName];
}

-(void)setValue:(ContactDatas *)data
{
    UIImageView *imageView = (UIImageView *)[self.contentView viewWithTag:1];
    imageView.image = [UIImage imageNamed:data.image];
    UILabel *labelName = (UILabel *)[self.contentView viewWithTag:2];
    labelName.text = data.name;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
