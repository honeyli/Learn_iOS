//
//  HomePageViewCellTableViewCell.h
//  MyZhihuDaily
//
//  Created by xuyanli on 16/9/26.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsResponseModel.h"
@interface HomepageCell : UITableViewCell

-(void)configureCellWithModel:(NewsResponseModel *)model;

@end
