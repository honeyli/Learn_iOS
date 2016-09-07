//
//  testTableViewController.m
//  testSDWebImage
//
//  Created by xuyanli on 16/9/5.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "testWebImage.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"
@interface testWebImage ()
@end

@implementation testWebImage

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:imageView];
    
    NSURL *url = [[NSURL alloc] initWithString:@"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png"];
    [imageView sd_setImageWithURL:url placeholderImage:nil options:SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}

@end

