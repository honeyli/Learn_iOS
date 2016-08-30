//
//  ViewController.m
//  Persistence
//
//  Created by xuyanli on 16/8/16.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong,nonatomic) IBOutletCollection(UITextField) NSArray *lineFields;
@property (weak, nonatomic) IBOutlet UIButton *SaveButton;
@property (weak, nonatomic) IBOutlet UIButton *getButton;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;

@end

@implementation ViewController
-(NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    return  [documentDirectory stringByAppendingPathComponent:@"data.plist"];
}

-(IBAction)clickButtons:(id)sender
{
    _SaveButton.tag = 1;
    _getButton.tag = 2;
    _clearButton.tag = 3;
    if ([self.SaveButton viewWithTag:1]) {
        NSString *filePath = [self dataFilePath];
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath];
            for (int  i = 0; i < 4; i ++) {
                UITextField *textField = self.lineFields[i];
                textField.text = array[i];
            }
        }else if ([self.getButton viewWithTag:2])
        {
            NSString *filePath = [self dataFilePath];
            NSArray *array = [self.lineFields valueForKey:@"text"];
            [array writeToFile:filePath atomically:YES];
        }else if ([self.clearButton viewWithTag:3])
        {
            for (UITextField *textField in _lineFields) {
                textField.text = @"";
            }
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
