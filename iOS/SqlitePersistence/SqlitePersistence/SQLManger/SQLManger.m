//
//  SQLManger.m
//  SqlitePersistence
//
//  Created by xuyanli on 16/8/17.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "SQLManger.h"
#import "sqlite3.h"
@implementation SQLManger
-(NSString *)datafieldPath
{
    //检索documents目录路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"data.sqlite"];
}

-(void)createTableIFNeeded
{
    sqlite3 *database;
    if (sqlite3_open([[self datafieldPath] UTF8String],&database) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"failed to open database");
        
    }
    NSString *createSQL = @"CREATE TABLE IF NOT EXISTS  FIELDS " "(ROW INTEGER PRIMARY KEY, FIELD_DATA TEXT);";
    char *errorMessage;
    if (sqlite3_exec (database, [createSQL UTF8String],NULL,NULL,&errorMessage)!= SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Error creating table: %s ",errorMessage);
    }
    NSString *query = @"SELECT ROW, FIELD_DATA FROM FIELDS ORDER BY ROW";
    sqlite3_stmt *statement;
    int  result = sqlite3_prepare_v2(database,[query UTF8String],-1,&statement,nil);
    if (result == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int row = sqlite3_column_int(statement,0);
            char *rowData = (char *)sqlite3_column_text(statement,1);
            
            NSString *filedValue = [[NSString alloc] initWithUTF8String:rowData];
            UITextField *field = self.lineArrays[row];
            field.text = filedValue;
        }
        sqlite3_finalize(statement);
    }
    sqlite3_close(database);
    
}

-(void)searchWithData
{
    sqlite3 *database;
    if (sqlite3_open([[self datafieldPath] UTF8String],&database) != SQLITE_OK ) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    for (int i = 0; i < 4; i++) {
        UITextField *field = self.lineArrays[i];
        char *update = "INSERT OR REPLACE INTO FIELDS (ROW, FIELD_DATA)" "VALUES (?, ?);";
        char *errorMsg = NULL;
        sqlite3_stmt  *stmt;
        if (sqlite3_prepare_v2(database,update,-1,&stmt,nil) == SQLITE_OK) {
            sqlite3_bind_int(stmt ,1,i);
            sqlite3_bind_text(stmt,2,[field.text UTF8String],-1,NULL);
        }
        if (sqlite3_step(stmt) != SQLITE_DONE) {
            NSAssert(0, @"Error updating table: %s",errorMsg);
            sqlite3_finalize(stmt);
        }
    }
    sqlite3_close(database);

}
@end
