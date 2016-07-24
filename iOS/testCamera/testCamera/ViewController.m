//
//  ViewController.m
//  testCamera
//
//  Created by xuyanli on 16/7/21.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImageView *_imageView;
    UIImageView *_imageViewR;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageViewR = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, 30, 100, 100)];
    _imageViewR.backgroundColor = [UIColor grayColor];
    _imageViewR.layer.cornerRadius = 50;
    _imageViewR.layer.masksToBounds = YES;
    [self.view addSubview:_imageViewR];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(16, 140, self.view.frame.size.width-32, self.view.frame.size.width-32)];
    _imageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_imageView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(16, CGRectGetMaxY(_imageView.frame)+20, self.view.frame.size.width-35, 35);
    btn.backgroundColor = [UIColor orangeColor];
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    [btn setTitle:@"获取图片" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)showImagePicker:(UIImagePickerControllerSourceType)type
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = type;
    [self presentViewController:imagePickerController animated:YES completion:^{}];
}

-(void)btnClick:(UIButton *)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"获取图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertAction *takePictureAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [self showImagePicker:UIImagePickerControllerSourceTypeCamera];
        }];
        [alertController addAction:takePictureAction];
    }
    UIAlertAction *selectPicture = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self  showImagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){}];
    [alertController addAction:cancelAction];
    [alertController addAction:selectPicture];
    [self showViewController:alertController sender:nil];
}
-(void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName{
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 1);
    //获取沙盒
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    //将图片写入文件
    [imageData writeToFile:fullPath atomically:NO];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self saveImage:image withName:@"avatar.png"];
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"avatar.png"];
    UIImage *saveImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    //设置图片显示
    [_imageView setImage:saveImage];
    [_imageViewR   setImage:saveImage];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
