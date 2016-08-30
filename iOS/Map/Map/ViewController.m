//
//  ViewController.m
//  Map
//
//  Created by xuyanli on 16/8/9.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "KCAnnotation.h"
@interface ViewController ()<MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    MKMapView *mapView;
}
@property (nonatomic,strong) CLGeocoder *geocoder;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initGUI];
    _geocoder=[[CLGeocoder alloc]init];
    [self turnByTurn];
    [self location];
}
-(void)location{
    //根据“北京市”进行地理编码
    [_geocoder geocodeAddressString:@"深圳市" completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *clPlacemark=[placemarks firstObject];//获取第一个地标
        MKPlacemark *mkplacemark=[[MKPlacemark alloc]initWithPlacemark:clPlacemark];//定位地标转化为地图的地标
        NSDictionary *options=@{MKLaunchOptionsMapTypeKey:@(MKMapTypeStandard)};
        MKMapItem *mapItem=[[MKMapItem alloc]initWithPlacemark:mkplacemark];
        [mapItem openInMapsWithLaunchOptions:options];
    }];
}
-(void)initGUI
{
    CGRect rect = [UIScreen mainScreen].bounds;
    mapView = [[MKMapView alloc] initWithFrame:rect];
    [self.view addSubview:mapView];
    mapView.delegate = self;
    //请求定位服务
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate= self;
    if (![CLLocationManager locationServicesEnabled] || [CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse) {
    }
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];
    mapView.showsScale = YES;
    //用户位置追踪(用户位置追踪用于标记用户当前位置，此时会调用定位服务)
    mapView.userTrackingMode = MKUserTrackingModeFollow;
    //设置地图类型
    mapView.mapType = MKMapTypeStandard;
    //添加大头针
    [self addAnnotation];
}
-(void)turnByTurn{
    //根据“北京市”地理编码
    [_geocoder geocodeAddressString:@"深圳市" completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *clPlacemark1=[placemarks firstObject];//获取第一个地标
        MKPlacemark *mkPlacemark1=[[MKPlacemark alloc]initWithPlacemark:clPlacemark1];
        //注意地理编码一次只能定位到一个位置，不能同时定位，所在放到第一个位置定位完成回调函数中再次定位
        [_geocoder geocodeAddressString:@"郑州市" completionHandler:^(NSArray *placemarks, NSError *error) {
            CLPlacemark *clPlacemark2=[placemarks firstObject];//获取第一个地标
            MKPlacemark *mkPlacemark2=[[MKPlacemark alloc]initWithPlacemark:clPlacemark2];
            NSDictionary *options=@{MKLaunchOptionsMapTypeKey:@(MKMapTypeStandard),MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving};
            //MKMapItem *mapItem1=[MKMapItem mapItemForCurrentLocation];//当前位置
            MKMapItem *mapItem1=[[MKMapItem alloc]initWithPlacemark:mkPlacemark1];
            MKMapItem *mapItem2=[[MKMapItem alloc]initWithPlacemark:mkPlacemark2];
            [MKMapItem openMapsWithItems:@[mapItem1,mapItem2] launchOptions:options];
            
        }];
        
    }];
}
-(void)addAnnotation
{
    CLLocationCoordinate2D location1 = CLLocationCoordinate2DMake(39.95, 116.35);
    KCAnnotation *annotation1 = [[KCAnnotation alloc]init];
    annotation1.title = @"CMJ Studio";
    annotation1.subtitle = @"Kenshin Cui's Studios";
    annotation1.coordinate = location1;
    [mapView addAnnotation:annotation1];
    
    CLLocationCoordinate2D location2=CLLocationCoordinate2DMake(39.87, 116.35);
    KCAnnotation *annotation2=[[KCAnnotation alloc]init];
    annotation2.title=@"Kenshin&Kaoru";
    annotation2.subtitle=@"Kenshin Cui's Home";
    annotation2.coordinate= location2;
    [mapView addAnnotation:annotation2];
}
#pragma mark - 地图控件代理方法
#pragma mark 更新用户位置，只要用户改变则调用此方法（包括第一次定位到用户位置）
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    MKCoordinateSpan span=MKCoordinateSpanMake(0.01, 0.01);
    MKCoordinateRegion region=MKCoordinateRegionMake(newLocation.coordinate, span);
    [mapView setRegion:region animated:true];
//    [mapView setCenterCoordinate:newLocation.coordinate animated:YES];
}
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    //由于当前位置的标注也是一个大头针，所以此时需要判断，此代理方法返回nil使用默认大头针视图
    if ([annotation isKindOfClass:[KCAnnotation class]]) {
        static NSString *key1 = @"AnnotationKey1";
        MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:key1];
        //如果缓冲池不存在则新建
        if (!annotationView) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:key1];
            annotationView.canShowCallout = true;//允许交互点击
            annotationView.calloutOffset = CGPointMake(0, 1);//定义详情视图偏移量
            //定义详情左侧视图
            annotationView.leftCalloutAccessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"datouzhen"]];
        }
        //修改大头针视图
        //重新设置此类大头针视图的大头针模型(因为有可能是从缓存池中取出来的，位置是放到缓存池时的位置)
        annotationView.annotation = annotation;
        annotationView.image = ((KCAnnotation *)annotation).image;//设置大头针视图的图片
        return annotationView;
    } else
    {
        return nil;
    }
}
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"%@",userLocation);
    //    设置地图显示范围(如果不进行区域设置会自动显示区域范围并指定当前用户位置为地图中心点)
    
}
@end
