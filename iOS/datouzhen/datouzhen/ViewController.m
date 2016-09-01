//
//  ViewController.m
//  datouzhen
//
//  Created by xuyanli on 16/8/10.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "KCAnnotation.h"
#import "KCCalloutAnnotationView.h"
#import "KCCallOutAnnotation.h"
@interface ViewController ()<MKMapViewDelegate,CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
    MKMapView *_mapView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initGUI];
}
-(void)initGUI{
    CGRect rect=[UIScreen mainScreen].bounds;
    _mapView=[[MKMapView alloc]initWithFrame:rect];
    _mapView.delegate=self;
    _mapView.showsScale = YES;
    //用户位置追踪(用户位置追踪用于标记用户当前位置，此时会调用定位服务)
    _mapView.userTrackingMode=MKUserTrackingModeFollow;
    //设置地图类型
    _mapView.mapType=MKMapTypeStandard;
    [self.view addSubview:_mapView];
    //设置代理
    _locationManager.delegate= self;
    //请求定位服务
    _locationManager=[[CLLocationManager alloc]init];
    if(![CLLocationManager locationServicesEnabled]||[CLLocationManager authorizationStatus]!=kCLAuthorizationStatusAuthorizedWhenInUse){
        [_locationManager requestWhenInUseAuthorization];
    }
    [_locationManager startUpdatingLocation];
}

#pragma mark 添加大头针
-(void)addAnnotation:(CLLocationCoordinate2D) coor{
    CLLocationCoordinate2D location1 = CLLocationCoordinate2DMake(coor.latitude + 0.001, coor.longitude + 0.001);
    KCAnnotation *annotation1=[[KCAnnotation alloc]init];
    annotation1.title=@"CMJ Studio";
    annotation1.subtitle=@"Kenshin Cui's Studios";
    annotation1.coordinate=location1;
    annotation1.image=[UIImage imageNamed:@"icon_pin_floating.png"];
    annotation1.icon=[UIImage imageNamed:@"icon_mark1.png"];
    annotation1.detail=@"CMJ Studio...";
    annotation1.rate=[UIImage imageNamed:@"icon_Movie_Star_rating.png"];
    [_mapView addAnnotation:annotation1];
    
    CLLocationCoordinate2D location2 = CLLocationCoordinate2DMake(coor.latitude + 0.003, coor.longitude + 0.003);
    KCAnnotation *annotation2=[[KCAnnotation alloc]init];
    annotation2.title=@"Kenshin&Kaoru";
    annotation2.subtitle=@"Kenshin Cui's Home";
    annotation2.coordinate=location2;
    annotation2.image=[UIImage imageNamed:@"icon_paopao_waterdrop_streetscape.png"];
    annotation2.icon=[UIImage imageNamed:@"icon_mark2.png"];
    annotation2.detail=@"Kenshin Cui...";
    annotation2.rate=[UIImage imageNamed:@"icon_Movie_Star_rating.png"];
    [_mapView addAnnotation:annotation2];
}
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    MKCoordinateSpan span=MKCoordinateSpanMake(0.01, 0.01);
    MKCoordinateRegion region=MKCoordinateRegionMake(newLocation.coordinate, span);
    [_mapView setRegion:region animated:true];
    [self addAnnotation:newLocation.coordinate];
    //    [mapView setCenterCoordinate:newLocation.coordinate animated:YES];
}

#pragma mark - 地图控件代理方法
#pragma mark 显示大头针时调用，注意方法中的annotation参数是即将显示的大头针对象
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
//    由于当前位置的标注也是一个大头针，所以此时需要判断，此代理方法返回nil使用默认大头针视图
    if ([annotation isKindOfClass:[KCAnnotation class]]) {
        static NSString *key1=@"AnnotationKey1";
        MKAnnotationView *annotationView=[_mapView dequeueReusableAnnotationViewWithIdentifier:key1];
        //如果缓存池中不存在则新建
        if (!annotationView) {
            annotationView=[[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:key1];
            //            annotationView.canShowCallout=true;//允许交互点击
            annotationView.calloutOffset=CGPointMake(0, 1);//定义详情视图偏移量
            annotationView.leftCalloutAccessoryView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_classify_cafe.png"]];//定义详情左侧视图
        }
        
        //修改大头针视图
        //重新设置此类大头针视图的大头针模型(因为有可能是从缓存池中取出来的，位置是放到缓存池时的位置)
        annotationView.annotation=annotation;
        annotationView.image=((KCAnnotation *)annotation).image;//设置大头针视图的图片
        
        return annotationView;
    }else if([annotation isKindOfClass:[KCCallOutAnnotation class]]){
        //对于作为弹出详情视图的自定义大头针视图无弹出交互功能（canShowCallout=false，这是默认值），在其中可以自由添加其他视图（因为它本身继承于UIView）
        KCCallOutAnnotationView *calloutView = [KCCallOutAnnotationView callOutViewWithMapView:mapView];
        calloutView.annotation=annotation;
        return calloutView;
    } else {
        return nil;
    }
}

#pragma mark 选中大头针时触发
//点击一般的大头针KCAnnotation时添加一个大头针作为所点大头针的弹出详情视图
-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    KCAnnotation *annotation=view.annotation;
    if ([view.annotation isKindOfClass:[KCAnnotation class]]) {
        //点击一个大头针时移除其他弹出详情视图
        //        [self removeCustomAnnotation];
        //添加详情大头针，渲染此大头针视图时将此模型对象赋值给自定义大头针视图完成自动布局
        KCCallOutAnnotation *annotation1=[[KCCallOutAnnotation alloc]init];
        annotation1.icon=annotation.icon;
        annotation1.detail=annotation.detail;
        annotation1.rate=annotation.rate;
        annotation1.coordinate=view.annotation.coordinate;
        [mapView addAnnotation:annotation1];
    }
}

#pragma mark 取消选中时触发
-(void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view{
    [self removeCustomAnnotation];
}

#pragma mark 移除所用自定义大头针
-(void)removeCustomAnnotation{
    [_mapView.annotations enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[KCCallOutAnnotation class]]) {
            [_mapView removeAnnotation:obj];
        }
    }];
}
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"%@",userLocation);
    [self addAnnotation:userLocation.coordinate];
    //    设置地图显示范围(如果不进行区域设置会自动显示区域范围并指定当前用户位置为地图中心点)
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end