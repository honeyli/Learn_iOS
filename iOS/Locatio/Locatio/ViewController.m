//
//  ViewController.m
//  Locatio
//
//  Created by xuyanli on 16/8/8.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //地位管理器
    locationManager = [[CLLocationManager alloc] init];
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位服务当前可能尚未打开，请设置打开！");
        return;
    }
    //如果没有授权，请求用户授权
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [locationManager requestWhenInUseAuthorization];
    }else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        locationManager.delegate = self;
        //设置定位精度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        //设置定位频率，每隔多少米定位一次
        CLLocationDistance distance = 10;//十米定位一次
        locationManager.distanceFilter = distance;
        //启动跟踪位置
        [locationManager startUpdatingLocation];
    }
}
#pragma mark - CoreLocation 代理
#pragma mark 跟踪定位代理方法，每次位置发生变化即会执行（只要定位到相应位置）
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *location = [locations firstObject];//取出第一个位置
    CLLocationCoordinate2D coordinate = location.coordinate;//位置坐标
    NSLog(@"经度：%f,纬度：%f,海拔：%f,航向：%f,行走速度：%f",coordinate.longitude,coordinate.latitude,location.altitude,location.course,location.speed);
    //如果不需要实时定位，使用完即使关闭定位服务
    [locationManager stopUpdatingLocation];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
