//
//  TestAndImageTextViewVC.m
//  testYYKit
//
//  Created by xuyanli on 16/12/5.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "TestAndImageTextViewVC.h"

#import "UIView+YYAdd.h"
#import "YYTextView.h"
#import "YYImage.h"
#import "NSBundle+YYAdd.h"
#import "NSString+YYAdd.h"
#import "YYTextAttribute.h"

@interface TestAndImageTextViewVC ()
{
    YYTextView *textView;
}
@end

@implementation TestAndImageTextViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    textView = [[YYTextView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    textView.userInteractionEnabled = YES;
    textView.textAlignment = YYTextVerticalAlignmentTop;
    textView.size = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    
    NSMutableAttributedString *contentText = [[NSMutableAttributedString alloc] init];
    UIFont *font = [UIFont systemFontOfSize:16];
    //图片资源
    YYImage *image = [YYImage imageNamed:@"Lanch-640X960"];
    image.preloadAllAnimatedImageFrames = YES;
    //添加文本加图片
    [contentText appendAttributedString:[[NSAttributedString alloc] initWithString:@"这是第一张图片"]];
    {
        YYAnimatedImageView *imageView = [[YYAnimatedImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(0, 0, textView.width - 10, textView.width/image.size.width*image.size.height);


    }
    
    //添加文本+图片
    [contentText appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n 接下来是第二张" attributes:nil]];
    
    {
        YYAnimatedImageView *imageView2 = [[YYAnimatedImageView alloc] initWithImage:image];
        
        imageView2.frame = CGRectMake(0, 0, textView.width - 10, textView.width/image.size.width*image.size.height);

        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
