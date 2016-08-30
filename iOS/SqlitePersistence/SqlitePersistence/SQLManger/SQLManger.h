//
//  SQLManger.h
//  SqlitePersistence
//
//  Created by xuyanli on 16/8/17.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQLManger : NSObject
-(void)createTableIFNeeded;
-(void)searchWithData;
@end
