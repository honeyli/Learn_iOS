//
//  LeftMenuTableViewCell.m
//  testViewDeck
//
//  Created by xuyanli on 16/9/17.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "LeftMenuTableViewCell.h"
#import "LeftMenuModel.h"
@implementation LeftMenuTableViewCell

-(void)configureCell:(LeftMenuModel *)model
{
    //设置cell选中状态的颜色
    self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
    self.selectedBackgroundView.backgroundColor = [UIColor blackColor];
    
    self.textLabel.text = model.title;
    self.textLabel.textColor = [UIColor whiteColor];
    self.textLabel.font = [UIFont systemFontOfSize:16];
    self.backgroundColor = [UIColor colorWithRed:49/255.0 green:49/255.0 blue:49/255.0 alpha:1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
