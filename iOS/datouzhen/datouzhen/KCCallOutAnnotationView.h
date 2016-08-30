//
//  KCCallOutAnnotation.h
//  datouzhen
//
//  Created by xuyanli on 16/8/10.
//  Copyright © 2016年 xuyanli. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "KCCallOutAnnotation.h"
//#import "KCAnnotation.h"
@interface KCCallOutAnnotationView : MKAnnotationView
@property(nonatomic,strong) KCCallOutAnnotation *annotation;

#pragma mark 从缓存取出标注视图
+(instancetype)callOutViewWithMapView:(MKMapView *)mapView;
@end
