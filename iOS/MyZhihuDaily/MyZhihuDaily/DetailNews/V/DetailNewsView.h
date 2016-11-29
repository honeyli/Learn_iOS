//
//  DetailNewsView.h
//  MyZhihuDaily
//
//  Created by xuyanli on 16/9/29.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailNewsResponse.h"

@protocol SwitchNewsDelegate <NSObject>
@required
-(void)backHome;

@optional
- (void)switchToPreviousNews;
- (void)switchToNextNews;
- (void)handleWebViewClickedWithURL:(NSURL *)url;

@end


@interface DetailNewsView : UIView

@property (nonatomic, weak) id<SwitchNewsDelegate> delegate;

- (void)updateNewsWithModel:(DetailNewsResponse *)News;
- (void)setContentOffset:(CGPoint)point animated:(BOOL)animated;

@end
