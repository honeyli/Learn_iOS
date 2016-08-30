//
//  KCCallOutAnnotation.m
//  datouzhen
//
//  Created by xuyanli on 16/8/10.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "KCCallOutAnnotationView.h"
#import "KCCallOutAnnotation.h"
#import "KCAnnotation.h"
#define kSpacing 5
#define kDetailFontSize 12
#define kViewOffset 80
@interface KCCallOutAnnotationView()
{
    UIView *backgroundView;
    UIImageView *iconView;
    UILabel *detailLabel;
    UIImageView *rateView;
}

@end
@implementation KCCallOutAnnotationView
-(instancetype)init
{
    if (self = [super init]) {
        [self layoutUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self layoutUI];
    }
    return self;
}
-(void)layoutUI
{
    backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = [UIColor whiteColor];
    iconView = [[UIImageView alloc] init];//左侧添加图标
    detailLabel = [[UILabel alloc] init];//上方详情
    detailLabel.lineBreakMode = NSLineBreakByWordWrapping;
    detailLabel.font = [UIFont systemFontOfSize:kDetailFontSize];
    
    rateView = [[UIImageView alloc] init];
    
    [self addSubview:backgroundView];
    [self addSubview:iconView];
    [self addSubview:detailLabel];
    [self addSubview:rateView];
}
+(instancetype)callOutViewWithMapView:(MKMapView *)mapView
{
    static NSString *callOutKey = @"callOutKey1";
    KCCallOutAnnotationView *callOutView = (KCCallOutAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:callOutKey];
    if (!callOutView) {
        callOutView = [[KCCallOutAnnotationView alloc] init];
    }
    return callOutView;
}
#pragma mark 当给大头针视图设置大头针模型时可以在此处根据模型设置视图内容
-(void)setAnnotation:(KCCallOutAnnotation *)annotation
{
    [super setAnnotation:annotation];
    //根据模型调整布局
    iconView.image = annotation.icon;
    iconView.frame=CGRectMake(kSpacing, kSpacing, annotation.icon.size.width, annotation.icon.size.height);
    
    detailLabel.text=annotation.detail;
    float detailWidth=150.0;
    CGSize detailSize= [annotation.detail boundingRectWithSize:CGSizeMake(detailWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kDetailFontSize]} context:nil].size;
    float detailX=CGRectGetMaxX(iconView.frame)+kSpacing;
    detailLabel.frame=CGRectMake(detailX, kSpacing, detailSize.width, detailSize.height);
    rateView.image=annotation.rate;
    rateView.frame=CGRectMake(detailX, CGRectGetMaxY(detailLabel.frame)+kSpacing, annotation.rate.size.width, annotation.rate.size.height);
    
    float backgroundWidth=CGRectGetMaxX(detailLabel.frame)+kSpacing;
    float backgroundHeight=iconView.frame.size.height+2*kSpacing;
    backgroundView.frame=CGRectMake(0, 0, backgroundWidth, backgroundHeight);
    self.bounds=CGRectMake(0, 0, backgroundWidth, backgroundHeight+kViewOffset);}
@end
