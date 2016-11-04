//
//  DetailHeaderView.m
//  MyZhihuDaily
//
//  Created by xuyanli on 16/10/8.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "DetailHeaderView.h"

#import <SDWebImage/UIImageView+WebCache.h>

#define DetailHeaderViewHeight 210.0f

@interface DetailHeaderView()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *imageSourceLabel;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation DetailHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self createHeaderUI];
    }
    return self;
}

-(void)createHeaderUI
{
    _imageView = [[UIImageView alloc] init];
    _imageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, 200);
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.frame = CGRectMake(10, 135, [UIScreen mainScreen].bounds.size.width - 50, 60);
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:13];
    _titleLabel.numberOfLines = 0;
    [self addSubview:_titleLabel];
    
    _imageSourceLabel = [[UILabel alloc] init];
    _imageSourceLabel.frame = CGRectMake(0, 180, [UIScreen mainScreen].bounds.size.width,30 );
    _imageSourceLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    _imageSourceLabel.font = [UIFont systemFontOfSize:11];
    [self addSubview:_imageSourceLabel];
    
}

-(void)updateHeaderViewWithNews:(DetailNewsResponse *)News
{
    [_imageView sd_setImageWithURL:[NSURL URLWithString:News.image] placeholderImage:[UIImage imageNamed:@""]];
    _imageSourceLabel.text = News.image_source;
    _titleLabel.text = News.title;
}
@end
