//
//  HomePageViewController.h
//  testViewDeck
//
//  Created by xuyanli on 16/9/17.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"
#import "NewsResponseModel.h"
@interface HomePageViewController : UIViewController
@property (nonatomic, strong) NSMutableArray *homeArrayList;
@property (nonatomic, strong) NSMutableArray *previousArray;

@end
