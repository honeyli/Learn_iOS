//
//  ViewController.m
//  testPods
//
//  Created by xuyanli on 16/9/2.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"
#import "MWPhotoBrowser.h"
@interface ViewController ()
{
    MWPhotoBrowser *browser;
}

@property (nonatomic, strong) NSMutableArray *photos;
@property (nonatomic, strong) NSMutableArray *thumbs;
@property (nonatomic, strong) NSMutableArray *selections;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *photos = [[NSMutableArray alloc] init];
    NSMutableArray *thumbs = [[NSMutableArray alloc] init];
    MWPhoto *photo;
    BOOL displayActionButton = YES;
    BOOL displaySelectionButtons = YES;
    BOOL displayNavArrows = YES;
    BOOL enableGrid = YES;
    BOOL startOnGrid = YES;
    
    // Photos
    photo = [MWPhoto photoWithImage:[UIImage imageNamed:@"1"]];
    // caption图片的描述
    photo.caption = @"Fireworks";
    [photos addObject:photo];
    photo = [MWPhoto photoWithImage:[UIImage imageNamed:@"3"]];
    photo.caption = @"The London Eye is a giant Ferris wheel situated on the banks of the River Thames, in London, England.";
    [photos addObject:photo];
    photo = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MWPhotoBrowser6" ofType:@".png"]]];
    photo.caption = @"York Floods";
    [photos addObject:photo];
    photo = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MWPhotoBrowser6t" ofType:@".png"]]];
    photo.caption = @"Campervan";
    [photos addObject:photo];

    self.photos = photos;
    self.thumbs = thumbs;
    
    // Create browser
    browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    browser.displayActionButton = displayActionButton;//分享按钮,默认是
    browser.displayNavArrows = displayNavArrows;//左右分页切换,默认否
    browser.displaySelectionButtons = displaySelectionButtons;//是否显示选择按钮在图片上,默认否
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
    
    if (displaySelectionButtons) {
        _selections = [NSMutableArray new];
        for (int i = 0; i < photos.count; i++) {
            [_selections addObject:[NSNumber numberWithBool:NO]];
        }
    }
    // ------------------------这里非常重要，对于基础不扎实的同学。首先你的新工程有没有根控制器UINavigationController或者是UITabBarController，如果没有根控制器，你的ViewController就不是根控制器的子控制器，所以你使用[self.navigationController pushViewController:browser animated:YES];是没有效果的。当然你想只是看看效果，使用[self presentViewController:browser animated:YES completion:nil];就可以了------------------------
    //        [self presentViewController:browser animated:YES completion:nil];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitle:@"click" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)clickButton:(id)sender
{
    [self presentViewController:browser animated:YES completion:nil];
    
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
