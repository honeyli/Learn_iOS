//
//  DetailNewsView.h
//  MyZhihuDaily
//
//  Created by xuyanli on 16/9/29.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailNewsResponse.h"
@interface DetailNewsView : UIView
-(void)updateNewsWithDetailNews:(DetailNewsResponse *)detailNews;
@end
