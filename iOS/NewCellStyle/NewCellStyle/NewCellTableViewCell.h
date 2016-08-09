//
//  NewCellTableViewCell.h
//  NewCellStyle
//
//  Created by xuyanli on 16/8/3.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewCellTableViewCell : UITableViewCell
{
    UILabel *label1;
    UILabel *label2;
}
-(void)setLabel1Text:(NSString *)text1 label2Text:(NSString *)text2;
@end
