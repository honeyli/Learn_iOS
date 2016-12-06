//
//  ViewController.m
//  AutoLayout
//
//  Created by xuyanli on 16/11/28.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"
#import "XWCountryCodeController.h"
@interface ViewController ()<XWCountryCodeControllerDelegate>
{
    UILabel *label;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitle:@"ksdfjskf" forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    label = [[UILabel alloc] init];
    label.frame = CGRectMake(200, 200, 100, 100);
    [self.view addSubview:label];

//    UIView *redView = [[UIView alloc] init];
//    redView.backgroundColor = [UIColor redColor];
//    redView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addSubview:redView];
//    
//    //创建redView第一个约束，相对self.view的左边缘间距20
//    NSLayoutConstraint *redLeft = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeLeftMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0f constant:20.0];
//    //只有在没有参照控件的情况下，约束才加到自身，不然加到父控件上
//    [self.view addConstraint:redLeft];
//    
//    //创建redView第二个约束，相对self。view的底边缘间距20
//    NSLayoutConstraint *redBottom = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottomMargin multiplier:1.0f constant:-20];
//    [self.view addConstraint:redBottom];
//    
//    //创建redView第三个约束，设置自身宽高，宽可以参照其他控件设置，比如是self.view宽的一半,则应该这样写
//    NSLayoutConstraint *redWidth = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:1.0f constant:50.f];
//    //由于没有参照物，所以约束添加于自身身上
//    [redView addConstraint:redWidth];
//    NSLayoutConstraint *redHeight = [NSLayoutConstraint constraintWithItem:redWidth attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:1.0f constant:50.0f];
//    [redView addConstraint:redHeight];
//    
//    
    
}

-(void)click{
    XWCountryCodeController *countryCodeVC = [[XWCountryCodeController alloc] init];
    countryCodeVC.deleagete = self;
    [countryCodeVC toReturnCountryCode:^(NSString *countryCodeStr) {
//        label.text = countryCodeStr;
        [label setText:countryCodeStr];
    }];
    [self presentViewController:countryCodeVC animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
