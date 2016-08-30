//
//  OtherLogin.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/12.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "OtherLogin.h"
#import "MineViewController.h"
@interface OtherLogin ()
{
    NSDictionary *dictionary;
}
@end

@implementation OtherLogin
//-(id)initWithImage:(NSDictionary *)dic
//{
//    if (self = [super init]) {
//        dictionary = dic;
//    }
//    return self;
//}
-(void)setImage:(NSDictionary *)dic
{
    dictionary = dic;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 200, 120, 120)];
    imageView.image = [UIImage imageNamed:[dictionary objectForKey:@"image"]];
    [self.view addSubview:imageView];
    
    UILabel *labelNumberPhone = [[UILabel alloc] initWithFrame:CGRectMake(200, 220, 175, 30)];
    labelNumberPhone.text = @"15981839204";
    [self.view addSubview:labelNumberPhone];
    
//    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)];
//    
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
