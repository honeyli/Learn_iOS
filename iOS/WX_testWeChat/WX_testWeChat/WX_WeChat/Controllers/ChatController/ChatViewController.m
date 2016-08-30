//
//  ChatViewController.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/2.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ChatViewController.h"
#import "MessageModel.h"
#import "ConversionViewController.h"
#import "TextMessageCell.h"
#import "ChatTableView.h"
#import "SQLManager.h"
#import "ImageCellModelTableViewCell.h"
#import "DetailImage.h"
#define kViewHeight self.view.bounds.size.height
#define kViewWidth self.view.bounds.size.width
@interface ChatViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIToolbarDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate, ImageMessageCell>
{
    ChatTableView *msgTableView;
    UIToolbar *toolBar;
    ConversionDatasModel * receiverModel;
}
@property(nonatomic,strong)NSMutableArray *resultArray;

@end

@implementation ChatViewController
{
    UITextField *commitField;
}
-(id) initWithConversion:(ConversionDatasModel *)model;
{
    if (self = [super init]) {
        receiverModel = model;
    }
    return self;
}


-(void)loadMessages
{
    _resultArray = [[SQLManager shareManger] loadMessages:receiverModel.conversionID];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = receiverModel.nickName;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self loadMessages];
    //导航栏的背景色是白色，状态栏的背景色也是白色。
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    msgTableView = [[ChatTableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    msgTableView.delegate = self;
    msgTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    msgTableView.dataSource = self;
    [self.view addSubview:msgTableView];
    //键盘通知
    CGFloat toolBarY = self.view.bounds.size.height - 49;
    CGFloat toolBarWidth = [UIScreen mainScreen].bounds.size.width;
    toolBar = [[UIToolbar alloc] init];
    toolBar.frame = CGRectMake(0, toolBarY, toolBarWidth, 49);
    toolBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:toolBar];
    
    
    commitField = [[UITextField alloc] initWithFrame:CGRectMake(1,0, [UIScreen mainScreen].bounds.size.width, 45)];
    commitField.borderStyle = UITextBorderStyleNone;
//    commitField.layer.cornerRadius = 5;
//    commitField.layer.borderWidth = 1;
//    commitField.layer.borderColor = [UIColor grayColor].CGColor;
    commitField.returnKeyType = UIReturnKeyDone;
    commitField.enablesReturnKeyAutomatically = YES;
    commitField.placeholder = @"请输入内容!";
    commitField.backgroundColor = [UIColor whiteColor];
    commitField.delegate = self;
    [toolBar addSubview:commitField];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8, 20, [UIScreen mainScreen].bounds.size.width, 1)];
    label.text = @"";
    label.tintColor = [UIColor grayColor];
    [toolBar addSubview:label];
    
    CGFloat offsetY = 8;
    CGFloat toolStyleWidth = 30;
    CGFloat toolStyleHeight = 30;
    
    UIImageView *imageViewVoice = [[UIImageView alloc] init];
    imageViewVoice.frame = CGRectMake(5, offsetY, 35, 35);
    imageViewVoice.image = [UIImage imageNamed:@"ToolViewInputVoice"];
    [toolBar addSubview:imageViewVoice];
    
    UIImageView *imageViewMore = [[UIImageView alloc] init];
    imageViewMore.frame = CGRectMake(325, offsetY, toolStyleWidth,toolStyleHeight);
    imageViewMore.image = [UIImage imageNamed:@"chatBar_face"];
    [toolBar addSubview:imageViewMore];
    UIImageView *imageViewFace = [[UIImageView alloc] init];
    imageViewFace.frame = CGRectMake(370, offsetY, toolStyleWidth, toolStyleHeight);
    imageViewFace.image = [UIImage imageNamed:@"chatBar_more"];
    [toolBar addSubview:imageViewFace];
    
    UIButton *senderButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [senderButton addTarget:self action:@selector(sendMsg:) forControlEvents:UIControlEventTouchUpInside];
    [senderButton setTitle:@"sender" forState:UIControlStateNormal];
    [senderButton setTintColor:[UIColor blackColor]];
    senderButton.frame = CGRectMake(212 , 11, 50, 50);
    [toolBar addSubview:senderButton];
    
    UIButton *photoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    photoButton.frame = CGRectMake(225, 11, 50, 50);
    [photoButton addTarget:self action:@selector(clickPhotoButton:) forControlEvents:UIControlEventTouchUpInside];
    [photoButton setTitle:@"选择图片" forState:UIControlStateNormal];
    [photoButton setTintColor:[UIColor blackColor]];
    [toolBar addSubview:photoButton];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShowChange:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShowChange:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissKeyboard:) name:@"TouchedTableView" object:nil];

}

-(void)clickPhotoButton:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName{
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 1);
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    [imageData writeToFile:fullPath atomically:NO];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    NSString *imageName = [NSString stringWithFormat:@"%@.png",[self uuid]];
    [self saveImage:image withName:imageName];
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    
    MessageModel *message = [[MessageModel alloc] init];
    message.messageType = TypeMsgImage;
    message.imageName = @"Message_image10";
    message.nickName =@"Sky";
    message.isMyself = YES;
    message.time = @"周五";
    message.message = fullPath;
    message.conversionID = receiverModel.conversionID;
    [_resultArray addObject:message];
    [[SQLManager shareManger] insertMessage:message];
    [msgTableView reloadData];
}

-(void)sendMsg:(id)pressButton{
    MessageModel *msg = [[MessageModel alloc] init];
    msg.imageName = @"Message_image10";
    msg.nickName =@"Sky";
    msg.isMyself = YES;
    msg.time = @"周五";
    msg.conversionID = receiverModel.conversionID;
    msg.message = commitField.text;
    [_resultArray addObject:msg];
    [[SQLManager shareManger] insertMessage:msg];
    [msgTableView reloadData];
    commitField.text = @"";
}

-(void)keyBoardWillShowChange:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    CGRect endFrame = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    double duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        CGRect barFrame = toolBar.frame;
        barFrame.origin.y = endFrame.origin.y - barFrame.size.height;
        toolBar.frame = barFrame;
    }];
}

- (void)dismissKeyboard:(NSNotification *)notification {
    [commitField resignFirstResponder];

}
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

-(void)selectRightEdit:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES ];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    MessageModel *msg = [_resultArray objectAtIndex:indexPath.row];
    UIFont *font = [UIFont systemFontOfSize:14];
    CGSize size = [msg.message sizeWithFont:font constrainedToSize:CGSizeMake(180.0f, 20000.0f) lineBreakMode:NSLineBreakByWordWrapping];
    
    return size.height+44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MessageModel *msg = [_resultArray objectAtIndex:indexPath.row];
    UITableViewCell *cell;
    
    if (msg.messageType == TypeMsgText) {
        static NSString *CellIdentifier = @"Cell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[TextMessageCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }else{
            for (UIView *cellView in cell.subviews){
                [cellView removeFromSuperview];
            }
        }
        [(TextMessageCell *)cell setChatValue:msg];
    } else if (msg.messageType == TypeMsgImage)
    {
        static NSString *identifider = @"typeCell";
        cell = [tableView dequeueReusableCellWithIdentifier:identifider];
        if (cell == nil) {
            cell = [[ImageCellModelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifider];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }else
        {
            for (UIView *typeCellView in cell.subviews){
                [typeCellView removeFromSuperview];
            }
        }
        ImageCellModelTableViewCell *imageCell = (ImageCellModelTableViewCell *)cell;
        imageCell.delegate = self;
        [imageCell setImageChatValue:msg];
    
    }
    return cell;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [commitField resignFirstResponder];
    return YES;
}
-(void)showBigImage:(NSString *)path
{
    DetailImage *detail = [[DetailImage alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
}

@end

