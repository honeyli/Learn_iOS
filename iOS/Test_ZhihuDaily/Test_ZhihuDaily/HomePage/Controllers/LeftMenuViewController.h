//
//  LeftMenuViewController.h
//  Test_ZhihuDaily
//
//  Created by xuyanli on 16/9/15.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "BaseViewController.h"
#import "ZhihuSideMenuViewController.h"
#import "HomePageController.h"
@interface LeftMenuViewController : BaseViewController
@property (nonatomic, strong) ZhihuSideMenuViewController *sideMenuViewController;
@property (nonatomic, strong) HomePageController *homePageController;
@end
