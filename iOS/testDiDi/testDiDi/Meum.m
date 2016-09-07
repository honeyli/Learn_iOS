//
//  Meum.m
//  testDiDi
//
//  Created by xuyanli on 16/9/5.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "Meum.h"

@interface Meum ()

@end

@implementation Meum

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"快递";
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"home_navigation_right"] style:UIBarButtonItemStylePlain target:self action:@selector(clickRightBarButton:)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"home_navigation_left"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftBarButton:)];
}

-(void)clickRightBarButton:(id)sender
{
    
}

-(void)clickLeftBarButton:(id)sender
{

}

@end
