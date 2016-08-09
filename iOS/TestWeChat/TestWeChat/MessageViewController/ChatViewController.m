//
//  ChatViewController.m
//  TestWeChat
//
//  Created by xuyanli on 16/8/2.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ChatViewController.h"
#import "MessageViewController.h"
#import "Message1.h"
@interface ChatViewController ()
{
    Message1 *message;
}
@end

@implementation ChatViewController
-(id) initWithMessage:(Message1 *)msg
{
    if (self = [super init]) {
        message = msg;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = message.nickname;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(13,164 , 65, 65)];
    imageView.image = [UIImage imageNamed:message.imageName];
    [self.view addSubview:imageView];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(87, 164, 366, 84)];
    label1.text = message.message;
    [self.view addSubview:label1];
    UILabel *Label2 = [[UILabel alloc] initWithFrame:CGRectMake(204, 122, 167, 24)];
    Label2.text = message.time;
    [self.view addSubview:Label2];

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
