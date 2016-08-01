//
//  GrayPage.m
//  testUIpageController
//
//  Created by xuyanli on 16/7/27.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "GrayPage.h"
@implementation GrayPage
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    activeImage = [UIImage imageNamed:@"image4"];
    inactiveImage = [UIImage imageNamed:@"image5"];
    return self;
}
-(void) updateDots
{
    for (int i = 0; i < [self.subviews count]; i++)
    {
        UIImageView* dot = [self.subviews objectAtIndex:i];
        if (i == self.currentPage) dot.image = activeImage;
        else dot.image = inactiveImage;
    }
}
//-(void) setCurrentPage:(NSInteger)page
//    {
//        [super setCurrentPage:page];
//        //修改图标大小
//        for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++) {
//            
//            UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
//            
//            CGSize size;
//            
//            size.height = 10;
//            
//            size.width = 10;
//            
//            [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,
//                                         
//                                         size.width,size.height)];
//            
//        }  
//        
//        
//        [self updateDots];  
//    }
/*
 Only override drawRect: if you perform custom drawing.
 An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
     Drawing code
}
*/
    @end

