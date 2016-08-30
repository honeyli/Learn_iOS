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
    NSString *imagePath;
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
    bubbleImage.image                    = [UIImage imageWithContentsOfFile:imagePath];
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

//+(void)showImageView:(UIImageView *)bubbleImage
//{
//    UIImage *image = bubbleImage.image; //当前imageView的图片
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;//当前视图
//    
//    UIView *backgroundView = [[UIView alloc] initWithFrame:
//                              CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];//背景
//    oldFrame = [bubbleImage convertRect:bubbleImage.bounds toView:window];
//    [backgroundView setBackgroundColor:[UIColor colorWithRed:107/255.0 green:107/255.0 blue:99/255.0 alpha:0.6]];
//    [backgroundView setAlpha:0];
//    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:oldFrame];//将所展示的imageView重新绘制到window
//    [imageView setImage:image];
//    [imageView setTag:0];
//    
//    [backgroundView addSubview:imageView];
//    [window addSubview:backgroundView];//讲原始视图添加到背景视图
//    
//    //添加点击事件同样是类方法 -> 作用是再次点击回到初始大小
//    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideImageView:)];
//    [backgroundView addGestureRecognizer:tapGestureRecognizer];
//    
//    //动画放大所展示的ImageView
//    
//    [UIView animateWithDuration:0.4 animations:^{
//        CGFloat y,width,height;
//        y = ([UIScreen mainScreen].bounds.size.height - image.size.height * [UIScreen mainScreen].bounds.size.width / image.size.width) * 0.5;
//        //宽度为屏幕宽度
//        width = [UIScreen mainScreen].bounds.size.width;
//        //高度 根据图片宽高比设置
//        height = image.size.height * [UIScreen mainScreen].bounds.size.width / image.size.width;
//        [imageView setFrame:CGRectMake(0, y, width, height)];
//        //重要！ 将视图显示出来
//        [backgroundView setAlpha:1];
//    } completion:^(BOOL finished) {
//        
//    }];
//    
//}
//
///**
// *  恢复imageView原始尺寸
// *
// *  @param tap 点击事件
// */
//+(void)hideImageView:(UITapGestureRecognizer *)tap{
//    UIView *backgroundView = tap.view;
//    //原始imageview
//    UIImageView *imageView = [tap.view viewWithTag:0];
//    //恢复
//    [UIView animateWithDuration:0.4 animations:^{
//        [imageView setFrame:oldFrame];
//        [backgroundView setAlpha:0];
//    } completion:^(BOOL finished) {
//        //完成后操作->将背景视图删掉
//        [backgroundView removeFromSuperview];
//    }];
//}

-(void)tapPhoto:(UITapGestureRecognizer *)tap
{
    [_delegate showBigImage:imagePath];
}
@end
