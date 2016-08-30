//
//  SQLManger.h
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/15.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "MessageModel.h"
#import "ConversionDatasModel.h"
#import "ContactModel.h"
@interface SQLManager : NSObject
{
    sqlite3 *db;
}

+(SQLManager *)shareManger;
-(NSMutableArray *)loadMessages:(NSString *)conversionID;
-(NSMutableArray *)loadAllConversions;
-(NSMutableArray *)loadAllContacts;
- (int) insertMessage:(MessageModel *)model;
-(int)insertContact:(ContactModel *)model;
-(int)insertConversion:(ConversionDatasModel *)model;
@end
