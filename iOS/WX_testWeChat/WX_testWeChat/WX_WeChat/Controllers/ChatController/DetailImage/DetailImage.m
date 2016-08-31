//
//  DetailImage.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/28.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "DetailImage.h"

@interface DetailImage ()
{
    NSString *imageName;
}
@end

@implementation DetailImage
-(instancetype)initWithPath:(NSString *)path
{
    if (self = [super init]) {
        imageName = path;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = self.view.frame;
    imageView.image = [UIImage imageWithContentsOfFile:[WXDocuments stringByAppendingPathComponent:imageName]];
    [self.view addSubview:imageView];
    
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
