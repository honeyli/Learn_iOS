//
//  ViewController.m
//  International
//
//  Created by xuyanli on 16/9/1.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(100, 100, 100, 100);
    label.text = NSLocalizedString(@"key", nil);
    label.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label];
}

@end
