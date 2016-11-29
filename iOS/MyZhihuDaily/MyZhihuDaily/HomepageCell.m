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
    CGRect cellFrame = self.frame;
    cellFrame.size.width = kScreenWidth;
    cellFrame.size.height = 80;
    self.frame = cellFrame;
    
    newsImageView = [[UIImageView alloc] init];
    newsImageView.frame = CGRectMake( self.frame.size.width - 90 , (cellFrame.size.height - 58) / 2, 75, 58);
    [self.contentView addSubview:newsImageView];
    
    homeLabel = [[UILabel alloc] init];
    homeLabel.frame = CGRectMake(15, 5, self.frame.size.width - newsImageView.frame.size.width - 45, 45);
    [self.contentView addSubview:homeLabel];
    
}
-(void)configureCellWithModel:(NewsResponseModel *)model
{
    homeLabel.text = model.title;
    homeLabel.numberOfLines = 0;
    homeLabel.lineBreakMode = NSLineBreakByWordWrapping;
    homeLabel.font = [UIFont systemFontOfSize:15];
    
    if (model.images.count > 0) {
        NSString *urlStr = model.images[0];
        [newsImageView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageLowPriority];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
