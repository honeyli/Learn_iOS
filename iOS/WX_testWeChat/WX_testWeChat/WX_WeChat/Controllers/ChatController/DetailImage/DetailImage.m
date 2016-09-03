//
//  DetailImage.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/28.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "DetailImage.h"
#import "MWPhotoBrowser.h"
@interface DetailImage ()
{
    NSString *imageName;
    MWPhotoBrowser *browser;
}

@property (nonatomic, strong) NSMutableArray *photos;
@property (nonatomic, strong) NSMutableArray *thumbs;
@property (nonatomic, strong) NSMutableArray *selections;

@end

@implementation DetailImage
-(instancetype)initWithPath:(NSString *)path
{
    if (self = [super init]) {
        imageName = path;
    }
    return self;
}
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
    
    photo = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:[WXDocuments stringByAppendingPathComponent:imageName]]];
    photo.caption = @"Fireworks";
    [photos addObject:photo];
    
    self.photos = photos;
    self.thumbs = thumbs;
    
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

//    UIImageView *imageView = [[UIImageView alloc] init];
//    imageView.frame = self.view.frame;
//    imageView.image = [UIImage imageWithContentsOfFile:[WXDocuments stringByAppendingPathComponent:imageName]];
//    [self.view addSubview:imageView];
//    
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
