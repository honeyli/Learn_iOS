//
//  NewCellTableViewCell.m
//  NewCellStyle
//
//  Created by xuyanli on 16/8/3.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "NewCellTableViewCell.h"

@implementation NewCellTableViewCell 

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, self.frame.size.height)];
        label1.text = @"111";
        [self.contentView addSubview:label1];
        
        label2 = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, 160, self.frame.size.height)];
        label2.text = @"222";
        [self.contentView addSubview:label2];
    }
    return self;
}
-(void)setLabel1Text:(NSString *)text1 label2Text:(NSString *)text2
{
    label1.text = text1;
    label2.text = text2;
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
