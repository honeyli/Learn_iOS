//
//  DetailHeaderView.m
//  MyZhihuDaily
//
//  Created by xuyanli on 16/10/8.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "DetailHeaderView.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface DetailHeaderView()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *imageSourceLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *coverImageView;

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
    [self setClipsToBounds:YES];
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_imageView];
    
    [self.imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_imageView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_imageView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_imageView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_imageView)]];
    
    self.coverImageView = [[UIImageView alloc] init];
    self.coverImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.coverImageView.image = [UIImage imageNamed:@"Home_Image_Mask"];
    [self addSubview:_coverImageView];
    
    [_coverImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_coverImageView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_coverImageView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_coverImageView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_coverImageView)]];
    
    self.imageSourceLabel = [[UILabel alloc] init];
    self.imageSourceLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    self.imageSourceLabel.font = [UIFont systemFontOfSize:11];
    [self addSubview:_imageSourceLabel];
    
    [self.imageSourceLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_imageSourceLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1 constant:-16]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_imageSourceLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-8]];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textColor = [UIColor whiteColor];
    [self addSubview:_titleLabel];
    
    [_titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-16-[_titleLabel]-16-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleLabel)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_titleLabel]-4-[_imageSourceLabel]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleLabel,_imageSourceLabel)]];

}

-(void)updateHeaderViewWithModel:(DetailNewsResponse *)Model;
{
   
    [_imageView sd_setImageWithURL:[NSURL URLWithString:Model.image]];
    _imageSourceLabel.text = Model.image_source;
    _titleLabel.text = Model.title;
}
@end
