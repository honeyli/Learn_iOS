//
//  testTableViewController.m
//  testSDWebImage
//
//  Created by xuyanli on 16/9/5.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "testTableViewController.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"
@interface testTableViewController ()
@end

@implementation testTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
        [self.view addSubview:imageView];
    
    UIImage *placeholder = [UIImage imageNamed:@"placeholderImage"];
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    if (mgr.isReachableViaWiFi) { // 在使用Wifi, 下载原图
        [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://a.hiphotos.baidu.com/baike/c0%3Dbaike150%2C5%2C5%2C150%2C50/sign=312cd00ab319ebc4d4757ecbe34fa499/6f061d950a7b020833e9d08e62d9f2d3572cc8b9.jpg"] placeholderImage:placeholder];
    } else {
        // 其他，下载小图
        [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=图片大全&hs=0&pn=0&spn=0&di=40601637120&pi=&rn=1&tn=baiduimagedetail&ie=utf-8&oe=utf-8&cl=2&lm=-1&cs=364904791%2C404746197&os=3149230929%2C4273820078&simid=4205239851%2C616707991&adpicid=0&ln=30&fr=ala&fm=&sme=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fpic250.quanjing.com%2Fimageclk007%2Fic01703123.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fktzitpjfp_z%26e3Bq7wg3tg2_z%26e3Bv54AzdH3Fp5rtvAzdH3Ftva80an8nc&gsm=0"]placeholderImage:placeholder];
    }
}
@end

