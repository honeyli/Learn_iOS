//
//  Product.h
//  tableSearch
//
//  Created by xuyanli on 16/7/22.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *hardwareType;
@property (nonatomic, copy) NSNumber *yearIntroduced;
@property (nonatomic, copy) NSNumber *introPrice;

+ (Product *)productWithType:(NSString *)type name:(NSString *)name year:(NSNumber *)year price:(NSNumber *)price;

+ (NSArray *)deviceTypeNames;
+ (NSString *)displayNameForType:(NSString *)type;

+ (NSString *)deviceTypeTitle;
+ (NSString *)desktopTypeTitle;
+ (NSString *)portableTypeTitle;
@end
