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
