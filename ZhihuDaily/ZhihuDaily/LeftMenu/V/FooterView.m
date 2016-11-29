//
//  FooterView.m
//  testViewDeck
//
//  Created by xuyanli on 16/9/18.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "FooterView.h"

@implementation FooterView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initFooterView];
    }
    return self;
}

-(void)initFooterView
{
    CGFloat offsetY = 5;
    UIImageView *downLoadImage = [[UIImageView alloc] init];
    downLoadImage.frame = CGRectMake(25, offsetY, 23, 23);
    downLoadImage.image = [UIImage imageNamed:@"Menu_Download"];
    [self addSubview:downLoadImage];
    UIButton *downLoadLabel = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    downLoadLabel.frame = CGRectMake(50, offsetY, 30, 20);
    [downLoadLabel setTitle:@"离线" forState:UIControlStateNormal];
    downLoadLabel.titleLabel.font = [UIFont systemFontOfSize:12];
    downLoadLabel.tintColor = [UIColor whiteColor];
    [self addSubview:downLoadLabel];
    
    
    UIImageView *skinImage = [[UIImageView alloc] init];
    skinImage.frame = CGRectMake(125, offsetY, 23, 23);
    skinImage.image = [UIImage imageNamed:@"Menu_Dark"];
    [self addSubview:skinImage];
    UIButton *skinLabel = [[UIButton alloc] init];
    skinLabel.frame = CGRectMake(150, offsetY, 30, 20);
    [skinLabel setTitle:@"夜间" forState:UIControlStateNormal];
    skinLabel.titleLabel.font = [UIFont systemFontOfSize:12];
    skinLabel.tintColor = [UIColor whiteColor];
    [self addSubview:skinLabel];
}

@end
