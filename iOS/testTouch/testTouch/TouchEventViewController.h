//
//  TouchEventViewController.h
//  testTouch
//
//  Created by xuyanli on 16/8/3.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchEventViewController : UIViewController
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;

@end
