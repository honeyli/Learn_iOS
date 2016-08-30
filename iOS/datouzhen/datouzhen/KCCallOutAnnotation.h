//
//  KCCallOutAnnotation.h
//  datouzhen
//
//  Created by xuyanli on 16/8/10.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface KCCallOutAnnotation :NSObject <MKAnnotation>
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy,readonly) NSString *title;
@property (nonatomic, copy,readonly) NSString *subtitle;

#pragma mark 左侧图标
@property (nonatomic,strong) UIImage *icon;
#pragma mark 详情描述
@property (nonatomic,copy) NSString *detail;
#pragma mark 星级评价
@property (nonatomic,strong) UIImage *rate;
@end
