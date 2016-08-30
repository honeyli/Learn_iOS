//
//  NewCellStyle.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/3.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "NewCell.h"
@interface NewCell ()
{
}
@end
@implementation NewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self customCellViews];
    }
    return self;
}

- (void)customCellViews
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(15, 8, 49, 49);
    imageView.tag = 101;
    [self.contentView addSubview:imageView];
    
    UILabel *labelnickName = [[UILabel alloc] init];
    labelnickName.frame = CGRectMake(75, 12, 145, 18);
    labelnickName.tag = 111;
    [self.contentView addSubview:labelnickName];
    labelnickName.font = [UIFont systemFontOfSize:18 ];
    
    UILabel *labelTime = [[UILabel alloc] init];
    labelTime.frame = CGRectMake(350, 15, 62, 25);
    labelTime.tag = 120;
    [self.contentView addSubview:labelTime];
    labelTime.font = [UIFont systemFontOfSize:12 ];
    
    
    UILabel *labelMessage = [[UILabel alloc] init];
    labelMessage.frame = CGRectMake(75, 35, 105, 18);
    labelMessage.tag = 130;
    [self.contentView addSubview:labelMessage];
    labelMessage.font = [UIFont systemFontOfSize:13];
}


-(void)configureCell:(ConversionDatasModel *)msg
{
    UIImageView *imageView = (UIImageView *) [self.contentView viewWithTag:101];
    imageView.image = [UIImage imageNamed:msg.imageName];
    
    UILabel *labelnickName = (UILabel *) [self.contentView viewWithTag:111];
    labelnickName.text = msg.nickName;
    
    UILabel *labelTime = (UILabel *) [self.contentView viewWithTag:120];
    labelTime.text = msg.lastMessageTime;
    
    UILabel *labelMessage = (UILabel *) [self.contentView viewWithTag:130];
    labelMessage.text = msg.message;
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
