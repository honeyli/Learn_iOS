//
//  ChatViewController.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/2.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ChatViewController.h"
#import "Message.h"
#import "MessageViewController.h"
#import "TextMessageCell.h"
@interface ChatViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIToolbarDelegate>
{
    Message *message;
    UITableView *msgTableView;
    UIToolbar *toolBar;
}
@end

@implementation ChatViewController
{
    UITextField *commitField;
}
-(id) initWithMessage:(Message *)msg
{
    if (self = [super init]) {
        message = msg;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = message.nickName;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //导航栏的背景色是白色，状态栏的背景色也是白色。
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    Message *msg11 = [[Message alloc] init];
    msg11.imageName = @"Message_image10";
    msg11.nickName =@"Sky";
    msg11.isMyself = YES;
    msg11.time = @"周五";
    msg11.message = @"哈喽，你好！";
    _resultArray = [[NSMutableArray alloc] initWithObjects:message,msg11, nil];
    msgTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    msgTableView.delegate = self;
    msgTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    msgTableView.dataSource = self;
    [self.view addSubview:msgTableView];
    //键盘通知
    toolBar = [[UIToolbar alloc] init];
    CGFloat toolBarY = self.view.bounds.size.height - 49;
    CGFloat toolBarWidth = [UIScreen mainScreen].bounds.size.width;
    toolBar.frame = CGRectMake(0, toolBarY, toolBarWidth, 49);
//    toolBar.backgroundColor = [UIColor writeColor];
    toolBar.delegate = self;
    [self.view addSubview:toolBar];
    
    
    commitField = [[UITextField alloc] initWithFrame:CGRectMake(15,self.view.bounds.size.height - 49, [UIScreen mainScreen].bounds.size.width, 49)];
    commitField.borderStyle = UITextBorderStyleNone;
    commitField.layer.cornerRadius = 5;
    commitField.layer.borderWidth = 1;
    commitField.layer.borderColor = [UIColor grayColor].CGColor;
    commitField.returnKeyType = UIReturnKeyDone;
    commitField.enablesReturnKeyAutomatically = YES;
    commitField.placeholder = @"请输入内容!";
    commitField.backgroundColor = [UIColor whiteColor];
    commitField.delegate = self;
    [toolBar addSubview:commitField];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShowChange:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHideChange:) name:UIKeyboardWillHideNotification object:nil];
    UIButton *senderButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [senderButton setTitle:@"sender" forState:UIControlStateNormal];
    [senderButton setTintColor:[UIColor blackColor]];
    senderButton.frame = CGRectMake(424 , 11, 50, 50);
    [toolBar addSubview:senderButton];
    [senderButton addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)touchUp:(id)pressButton{
    Message *msg11 = [[Message alloc] init];
    msg11.imageName = @"Message_image10";
    msg11.nickName =@"Sky";
    msg11.isMyself = YES;
    msg11.time = @"周五";
    msg11.message = commitField.text;
    [_resultArray addObject:msg11];
    [msgTableView reloadData];
}

-(void)keyBoardWillShowChange:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    CGRect endFrame = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    double duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        CGRect barFrame = commitField.frame;
        barFrame.origin.y = endFrame.origin.y - barFrame.size.height;
        commitField.frame = barFrame;
    }];
}
//-(void)keyBoardWillHideChange:(NSNotification *)notification
//{
//    NSDictionary *info = [notification userInfo];
//    
//    [commitField resignFirstResponder];
//}
//点击界面view触发，收键盘
-(void)Change:(NSNotification *)notification
{
    [commitField resignFirstResponder];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [commitField resignFirstResponder];
    commitField.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 100, [UIScreen mainScreen].bounds.size.width, 45);
}

//-(void)textFieldChange:(NSNotification *)notification
//{
//    UITextField *textField = [notification object];
//    NSString *lang = [textField.textInputMode primaryLanguage];//键盘输入模式
//    if ([lang isEqualToString:@"zh-Hans"]) {
//        UITextRange *selectRange = [textField markedTextRange];//获取高亮部分
//        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
//        UITextPosition *position = [textField positionFromPosition:selectRange.start offset:0];
//        if (!position) {
//            if ([textField.text isEqualToString:@"text"]) {
//                UIAlertView *ale = [[UIAlertView alloc]initWithTitle:@"test" message:nil delegate:nil cancelButtonTitle:@"text" otherButtonTitles: nil];
//                [ale show];
//            }
//       }
//    }
//}
-(void)selectRightEdit:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES ];
}
//- (void)selectLeftAction:(id)sender{
//    [self.navigationController popViewControllerAnimated:YES];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//泡泡文本

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _resultArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Message *msg = [_resultArray objectAtIndex:indexPath.row];
    UIFont *font = [UIFont systemFontOfSize:14];
    CGSize size = [msg.message sizeWithFont:font constrainedToSize:CGSizeMake(180.0f, 20000.0f) lineBreakMode:NSLineBreakByWordWrapping];
    
    return size.height+44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
     TextMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[TextMessageCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{
        for (UIView *cellView in cell.subviews){
            [cellView removeFromSuperview];
        }
    }
    
    Message *msg = [_resultArray objectAtIndex:indexPath.row];
    [cell setChatValue:msg];
    return cell;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [commitField resignFirstResponder];
    return YES;
}

@end

