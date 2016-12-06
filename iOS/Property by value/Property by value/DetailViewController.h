//
//  DetailViewController.h
//  Property by value
//
//  Created by xuyanli on 16/12/6.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@protocol PassingValueDelegate <NSObject>

@optional
-(void)viewController:(DetailViewController *)viewController didPassingValueWithInfo: (id)info;

@end

//typedef void(^PassingValueBlock)(UILabel *);//使用block传值

@interface DetailViewController : UIViewController

//@property (nonatomic, strong) PassingValueBlock passingValue;//block传值
@property (nonatomic, strong) NSString *textString;
@property (nonatomic, strong) id<PassingValueDelegate>delegate; //通过代理传值
@end
