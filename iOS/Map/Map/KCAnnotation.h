//
//  KCAnnotation.h
//  Map
//
//  Created by xuyanli on 16/8/9.
//  Copyright © 2016年 xuyanli. All rights reserved.
//


#import <MapKit/MapKit.h>
#import <Foundation/Foundation.h>
@interface KCAnnotation: NSObject<MKAnnotation>
@property(nonatomic) CLLocationCoordinate2D coordinate;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *subtitle;
@property (nonatomic,copy) UIImage *image;
@end
