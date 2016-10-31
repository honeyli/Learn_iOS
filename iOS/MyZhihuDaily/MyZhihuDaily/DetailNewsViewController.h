//
//  DetailNewsViewController.h
//  MyZhihuDaily
//
//  Created by xuyanli on 16/9/29.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsResponseModel.h"
@interface DetailNewsViewController : UIViewController

@property (nonatomic, assign) NSInteger storyID;

-(void)receiveModel:(NewsResponseModel *)model;

@end
