//
//  ViewController.m
//  testAudio
//
//  Created by xuyanli on 16/8/7.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
@interface ViewController ()
{
    AVAudioPlayer *audioPlayer;
    AVPlayerViewController *player;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1 setTitle:@"AudioPlayer" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor blueColor];
    [btn1 setTintColor:[UIColor whiteColor]];
    [btn1 addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:@"Player" forState:UIControlStateNormal];
    [btn2 setTintColor:[UIColor whiteColor]];
    btn2.backgroundColor = [UIColor blueColor];
    [btn2 addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)selectButton:(id)touchUp
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"audioTest" ofType:@"mp3"];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    [audioPlayer play];
}

-(void)pressButton:(id)play
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MediaTest" ofType:@"mov"];
//    player = [[AVPlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:path]];
    [self presentModalViewController:player animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
