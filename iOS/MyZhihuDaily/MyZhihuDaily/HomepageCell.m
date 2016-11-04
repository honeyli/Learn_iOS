//
//  HomePageViewCellTableViewCell.m
//  MyZhihuDaily
//
//  Created by xuyanli on 16/9/26.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "HomepageCell.h"

#import "UIImageView+WebCache.h"

@implementation HomepageCell
{
    UILabel *homeLabel;
    UIImageView *newsImageView;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addViews];
    }
    return self;
}

-(void)addViews
{
    homeLabel = [[UILabel alloc] init];
    homeLabel.frame = CGRectMake(10, 5, 300, 45);
    [self.contentView addSubview:homeLabel];
    
    newsImageView = [[UIImageView alloc] init];
    newsImageView.frame = CGRectMake(325, 5, 70, 70);
    [self.contentView addSubview:newsImageView];
}

-(void)configureCellWithModel:(NewsResponseModel *)model
{

    homeLabel.text = model.title;
    homeLabel.numberOfLines = 0;
    homeLabel.lineBreakMode = NSLineBreakByWordWrapping;
    homeLabel.font = [UIFont systemFontOfSize:15];
    

    if (model.images.count > 0) {
        NSString *urlStr = model.images[0];
        [newsImageView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"Home_Icon"] options:SDWebImageLowPriority];
    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end