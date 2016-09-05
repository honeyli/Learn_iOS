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
#import "MWPhotoBrowser.h"
#define kViewHeight self.view.bounds.size.height
#define kViewWidth self.view.bounds.size.width
@interface ChatViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIToolbarDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate, ImageMessageCell>
{
    ChatTableView *msgTableView;
    UIToolbar *toolBar;
    ConversionDatasModel * receiverModel;
    UIImageView *imageViewMore;
    NSString *imageName;
    MWPhotoBrowser *browser;
    UITextField *commitField;
}

@property(nonatomic,strong)NSMutableArray *resultArray;
@property (nonatomic, strong) NSMutableArray *photos;
@property (nonatomic, strong) NSMutableArray *thumbs;
@property (nonatomic, strong) NSMutableArray *selections;


@end

@implementation ChatViewController
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
    [self loadMessages];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
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
    toolBar.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255/255.0];
    [self.view addSubview:toolBar];
    
    
    commitField = [[UITextField alloc] initWithFrame:CGRectMake(1,0, [UIScreen mainScreen].bounds.size.width, 45)];
    commitField.borderStyle = UITextBorderStyleNone;
    commitField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 0)];
    commitField.leftViewMode = UITextFieldViewModeAlways;
    commitField.returnKeyType = UIReturnKeyDone;
    commitField.enablesReturnKeyAutomatically = YES;
    commitField.placeholder = @"请输入内容!";
    commitField.returnKeyType = UIReturnKeySend;
    commitField.backgroundColor = [UIColor whiteColor];
    commitField.delegate = self;
    commitField.userInteractionEnabled = YES;
    [toolBar addSubview:commitField];
    
    CGFloat offsetY = 8;
    CGFloat toolStyleWidth = 30;
    CGFloat toolStyleHeight = 30;
    
    
    UIButton *voiceButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    voiceButton.frame = CGRectMake(8, 5, 33, 33);
    [voiceButton setBackgroundImage:[UIImage imageNamed:@"ToolViewInputVoice"] forState:UIControlStateNormal];
    [toolBar addSubview:voiceButton];
   
    UIButton *faceButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    faceButton.frame = CGRectMake(315, offsetY, toolStyleWidth, toolStyleHeight);
    [faceButton setBackgroundImage:[UIImage imageNamed:@"chatBar_face"] forState:UIControlStateNormal];
    [toolBar addSubview:faceButton];
    
    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [moreButton addTarget:self action:@selector(clickMoreButton:) forControlEvents:UIControlEventTouchUpInside];
    moreButton.frame = CGRectMake(360, offsetY, toolStyleWidth, toolStyleHeight);
    moreButton.backgroundColor = [UIColor clearColor];
    [moreButton setBackgroundImage:[UIImage imageNamed:@"chatBar_more"] forState:UIControlStateNormal];
    [toolBar addSubview:moreButton];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShowChange:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShowChange:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissKeyboard:) name:@"TouchedTableView" object:nil];
    
}

-(void)clickMoreButton:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = NO;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

-(void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName{
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 1);
    NSString *fullPath = [WXDocuments stringByAppendingPathComponent:imageName];
    [imageData writeToFile:fullPath atomically:NO];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    NSString *imageName = [NSString stringWithFormat:@"%@.png",[self uuid]];
    [self saveImage:image withName:imageName];
    
    MessageModel *message = [[MessageModel alloc] init];
    message.messageType = TypeMsgImage;
    message.imageName = @"Message_image10";
    message.nickName =@"Sky";
    message.isMyself = YES;
    message.time = @"周五";
    message.message = imageName;
    message.conversionID = receiverModel.conversionID;
    [_resultArray addObject:message];
    [[SQLManager shareManger] insertMessage:message];
    [msgTableView reloadData];
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

    return YES;
}
-(void)showBigImage:(NSString *)path
{
    
    NSMutableArray *photos = [[NSMutableArray alloc] init];
    NSMutableArray *thumbs = [[NSMutableArray alloc] init];
    MWPhoto *photo;
    BOOL displayActionButton = YES;
    BOOL displaySelectionButtons = YES;
    BOOL displayNavArrows = YES;
    BOOL enableGrid = YES;
    BOOL startOnGrid = YES;
    
    photo = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:[WXDocuments stringByAppendingPathComponent:path]]];
    [photos addObject:photo];
    self.photos = photos;
    self.thumbs = thumbs;
    
    browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    browser.displayActionButton = displayActionButton;//分享按钮,默认是
    browser.displayNavArrows = displayNavArrows;//左右分页切换,默认否
//    browser.displaySelectionButtons = displaySelectionButtons;//是否显示选择按钮在图片上,默认否
    browser.alwaysShowControls = displaySelectionButtons;//控制条件控件 是否显示,默认否
    browser.zoomPhotosToFill = NO;//是否全屏,默认是
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    browser.wantsFullScreenLayout = YES;//是否全屏
#endif
    browser.enableGrid = enableGrid;//是否允许用网格查看所有图片,默认是
    browser.startOnGrid = startOnGrid;//是否第一张,默认否
    browser.enableSwipeToDismiss = YES;
    [browser showNextPhotoAnimated:YES];
    [browser showPreviousPhotoAnimated:YES];
    [browser setCurrentPhotoIndex:0];
    
//    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Done", nil) style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonPressed:)];
    if (displaySelectionButtons) {
        _selections = [NSMutableArray new];
        for (int i = 0; i < photos.count; i++) {
            [_selections addObject:[NSNumber numberWithBool:NO]];
        }
    }
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:browser];
    [self presentViewController:nav animated:YES completion:nil];
}

-(void)doneButtonItem:(id)sender
{
    
}
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser
{
    return  self.photos.count;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index;
{
    if (index < self.photos.count) {
        return [self.photos objectAtIndex:index];
    }
    return nil;
}

@end

