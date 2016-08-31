//
//  ImageCellModelTableViewCell.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/26.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ImageCellModelTableViewCell.h"
#import "ChatViewController.h"
#import "DetailImage.h"
@implementation ImageCellModelTableViewCell
{
    UIImageView *bubbleImage;
    MessageModel *message;
}

- (UIView *)bubbleView:(NSString *)imagePath from:(BOOL)fromSelf withPosition:(int)position
{
    UIFont *font = [UIFont systemFontOfSize:14];
    CGSize size = [imagePath sizeWithFont:font constrainedToSize:
                                                                 CGSizeMake(180.0f, 20000.0f) lineBreakMode:NSLineBreakByWordWrapping];
    UIView *returnView = [[UIView alloc] initWithFrame:CGRectZero];
    returnView.backgroundColor = [UIColor clearColor];
    //背景图片
    UIImage *bubble = [UIImage imageNamed:fromSelf?@"SenderAppNodeBkg_HL":@"ReceiverTextNodeBkg"];
    UIImageView *bubbleImageView = [[UIImageView alloc] initWithImage:
                                    [bubble stretchableImageWithLeftCapWidth:
                                     floorf(bubble.size.width/2) topCapHeight:
                                     floorf(bubble.size.height/2)]];
    
    NSLog(@"%f,%f",size.width,size.height);
    
    bubbleImage    = [[UIImageView alloc] initWithFrame:
                                  CGRectMake(fromSelf?15.0f:22.0f, 20.0f, size.width+10, size.height+10)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(tapPhoto:)];
    [bubbleImage addGestureRecognizer:tap];
    bubbleImage.userInteractionEnabled = YES;
    bubbleImage.backgroundColor = [UIColor clearColor];
    bubbleImage.image = [UIImage imageWithContentsOfFile:[WXDocuments stringByAppendingPathComponent:imagePath]];
    bubbleImageView.frame              = CGRectMake
                                            (0.0f, 14.0f, bubbleImage.frame.size.width+30.0f,
                                            bubbleImage.frame.size.height+20.0f);
    
    CGFloat offsetX;
    
    if(fromSelf){
        CGFloat kWidth = [UIApplication sharedApplication].keyWindow.frame.size.width;
        offsetX = kWidth -position - bubbleImage.frame.size.width - 30;
        returnView.frame = CGRectMake(offsetX, 0.0f, bubbleImage.frame.size.width+30.0f, bubbleImage.frame.size.height+30.0f);
    }
    else
    {
        offsetX = position;
        returnView.frame = CGRectMake(offsetX, 0.0f, bubbleImage.frame.size.width+30.0f, bubbleImage.frame.size.height+30.0f);
    }
    
    [returnView addSubview:bubbleImageView];
    [returnView addSubview:bubbleImage];
    
    return returnView;
}

-(void)setImageChatValue:(MessageModel *)msg
{
    message = msg;
    UIImageView *photo ;
    if (msg.isMyself) {
        photo = [[UIImageView alloc]initWithFrame:CGRectMake(353, 10, 50, 50)];
        [self addSubview:photo];
        photo.image = [UIImage imageNamed:@"photo1"];
        [self addSubview:[self bubbleView: msg.message from:YES withPosition:65]];
        
    }else{
        photo = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
        [self addSubview:photo];
        photo.image = [UIImage imageNamed:msg.imageName];
        [self addSubview:[self bubbleView:msg.message  from:NO withPosition:65]];
    }
    
}

-(void)tapPhoto:(UITapGestureRecognizer *)tap
{
    [_delegate showBigImage:message.message];
}
@end
