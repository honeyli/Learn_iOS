//
//  ImageCellModelTableViewCell.h
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/26.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"

@protocol ImageMessageCell <NSObject>

-(void) showBigImage:(NSString *)path;

@end


@interface ImageCellModelTableViewCell : UITableViewCell
@property (nonatomic, weak) id<ImageMessageCell>delegate;

-(void)setImageChatValue:(MessageModel *)msg;
@end
