//
//  Chatdata.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/7.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "TextMessageCell.h"
#import "ChatViewController.h"
@implementation TextMessageCell
- (UIView *)bubbleView:(NSString *)text from:(BOOL)fromSelf withPosition:(int)position
{
    UIFont *font = [UIFont systemFontOfSize:14];
    CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(180.0f, 20000.0f) lineBreakMode:NSLineBreakByWordWrapping];
    UIView *returnView = [[UIView alloc] initWithFrame:CGRectZero];
    returnView.backgroundColor = [UIColor clearColor];
    //背景图片
    UIImage *bubble = [UIImage imageNamed:fromSelf?@"SenderAppNodeBkg_HL":@"ReceiverTextNodeBkg"];
    UIImageView *bubbleImageView = [[UIImageView alloc] initWithImage:[bubble stretchableImageWithLeftCapWidth:floorf(bubble.size.width/2) topCapHeight:floorf(bubble.size.height/2)]];
    NSLog(@"%f,%f",size.width,size.height);
    
    //添加文本信息
    UILabel *bubbleText = [[UILabel alloc] initWithFrame:CGRectMake(fromSelf?15.0f:22.0f, 20.0f, size.width+10, size.height+10)];
    bubbleText.backgroundColor = [UIColor clearColor];
    bubbleText.font = font;
    bubbleText.numberOfLines = 0;
    bubbleText.lineBreakMode = NSLineBreakByWordWrapping;
    bubbleText.text = text;
    bubbleImageView.frame = CGRectMake(0.0f, 14.0f, bubbleText.frame.size.width+30.0f, bubbleText.frame.size.height+20.0f);
    CGFloat offsetX;
    if(fromSelf){
        CGFloat kWidth = [UIApplication sharedApplication].keyWindow.frame.size.width;
        offsetX = kWidth -position - bubbleText.frame.size.width - 30;
        returnView.frame = CGRectMake(offsetX, 0.0f, bubbleText.frame.size.width+30.0f, bubbleText.frame.size.height+30.0f);
    }
    else
    {
        offsetX = position;
        returnView.frame = CGRectMake(offsetX, 0.0f, bubbleText.frame.size.width+30.0f, bubbleText.frame.size.height+30.0f);
    }
    
    [returnView addSubview:bubbleImageView];
    [returnView addSubview:bubbleText];
    
    return returnView;
}

-(void)setChatValue:(MessageModel *)msg
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

-(BOOL)canBecomeFirstResponder{
    return YES;
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return (action == @selector(copy:));
}

-(void) copy:(id)sender
{
    UIPasteboard *paste = [UIPasteboard generalPasteboard];
    paste.string = self.textLabel.text;
}

-(void)attachTapHandler
{
    self.userInteractionEnabled = YES;
    //UIlabel默认不接受事件，自己定义事件
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]
                                                                            initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:longPress];
}

//绑定事件
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self attachTapHandler];
    }
    return self;
}

-(void)handleTap:(UILongPressGestureRecognizer *)gestureRecognizer
{
    [self becomeFirstResponder];
    UIMenuItem *copyLink = [[UIMenuItem alloc] initWithTitle:@"复制"
                                                      action:@selector(copy:)]; 
    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:copyLink, nil]];
    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated: YES];
}
@end
