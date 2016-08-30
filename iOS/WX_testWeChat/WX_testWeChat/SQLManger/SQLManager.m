//
//  SQLManger.m
//  WX_testWeChat
//
//  Created by xuyanli on 16/8/15.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#import "SQLManager.h"
#import "sqlite3.h"
@implementation SQLManager
//创建单例
static SQLManager *manger = nil;

+(SQLManager *)shareManger
{
    static dispatch_once_t  once;
    dispatch_once(&once, ^{
    
        manger = [[self alloc] init];
        [manger createConversionTable];
        [manger createMessageTable];
        [manger createContactTable];
    });
    return manger;
}

//获取路径
-(NSString *)applicationDocumentsDirectoryFile
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    //拼接路径并返回
    NSString *finalPath = [documentsDirectory stringByAppendingPathComponent:@"Message.sqlite"];
    NSLog(@"%@",finalPath);
    return finalPath;
}

-(void)createDataBaseTableIfNeeded:(NSString *)createSQL
{
    if ([self openDB])
    {       //打开数据库成功则创建表
            if (sqlite3_exec(db, [createSQL UTF8String], NULL, NULL, NULL) != SQLITE_OK) {
                sqlite3_close(db);
    
            }
    }
    sqlite3_close(db);
}

- (BOOL)openDB {
    BOOL result = YES;
    NSString *path = [self applicationDocumentsDirectoryFile];
    if (sqlite3_open([path UTF8String], &db) != SQLITE_OK) {
        sqlite3_close(db);
        result = false;
    }
    return result;
}

-(void)createConversionTable
{
    NSString *conversionSql = @"create table if not exists Conversion (conversionID TEXT PRIMARY KEY,nickName TEXT,lastMessageTime TEXT, message TEXT,imageName TEXT)";
    [self createDataBaseTableIfNeeded:conversionSql];
}

- (void)createMessageTable {
    NSString *messageSql = @"CREATE TABLE IF NOT EXISTS Message ( msgId TEXT PRIMARY KEY,isMyself TEXT,NickName TEXT, Time TEXT, Message TEXT,ImageName TEXT,messageType TEXT,conversionID TEXT)";
    [self createDataBaseTableIfNeeded:messageSql];
}

-(void)createContactTable
{
    NSString *contactSql = @"CREATE TABLE IF NOT EXISTS  Contact (ContactID TEXT  PRIMARY KEY,nickName TEXT, imageName TEXT)";
    [self createDataBaseTableIfNeeded:contactSql];
}

-(NSMutableArray *)loadAllConversions
{
    NSString *querySql = @"select * from Conversion";
    return [self loadAllDBData:querySql withClass:[ConversionDatasModel class]];
}

-(NSMutableArray *)loadMessages:(NSString *)conversionID
{
    NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM Message where conversionID = '%@' ", conversionID];
    return [self loadAllDBData:querySql withClass:[MessageModel class]];
}

-(NSMutableArray *)loadAllContacts
{
    NSString *querySql = @"SELECT ContactID ,nickName,imageName FROM Contact";
    return [self loadAllDBData:querySql withClass:[ContactModel class]];
}

-(NSMutableArray *)loadAllDBData:(NSString *)querySql withClass:(Class)class {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    if ([self openDB]) {
        //构建查询语句
        //进行预处理
        sqlite3_stmt *statement;
        int result = sqlite3_prepare_v2(db, [querySql UTF8String], -1, &statement, NULL);
        if (result == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                NSObject *model;
                if (class == [MessageModel class]) {
                    model = [self getMessageModel:statement];
                } else if (class == [ConversionDatasModel class]) {
                    model = [self getConversionModel:statement];
                } else if (class == [ContactModel class]) {
                    model = [self getContactModel:statement];
                }
                [array addObject:model];
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    return array;
}

-(ConversionDatasModel *)getConversionModel:(sqlite3_stmt *)statement
{
    char *conversionID = (char *)sqlite3_column_text(statement, 0);
    NSString *conversionIDStr = [[NSString alloc] initWithUTF8String:conversionID];
    
    char *nickName = (char *)sqlite3_column_text(statement, 1);
    NSString *nickNameStr = [[NSString alloc] initWithUTF8String:nickName];
    
    char *lastMessageTime = (char *)sqlite3_column_text(statement, 2);
    NSString *timeStr = [[NSString alloc] initWithUTF8String:lastMessageTime];
    
    char *message = (char *)sqlite3_column_text(statement, 3);
    NSString *messageStr = [[NSString alloc] initWithUTF8String:message];
    
    char *imageName = (char *)sqlite3_column_text(statement, 4);
    NSString *imageNameStr = [[NSString alloc] initWithUTF8String:imageName];
    
    ConversionDatasModel *conversionData = [[ConversionDatasModel alloc] init];
    conversionData.conversionID = conversionIDStr;
    conversionData.nickName = nickNameStr;
    conversionData.lastMessageTime = timeStr;
    conversionData.imageName = imageNameStr;
    conversionData.message = messageStr;
    
    return conversionData;
}

- (MessageModel *)getMessageModel:(sqlite3_stmt *) statement
{
    char *msgId = (char *) sqlite3_column_text(statement, 0);
    NSString *msgIdStr = [[NSString alloc] initWithUTF8String:msgId];
    
    char *isMyself = (char *)sqlite3_column_text(statement, 1);
    NSString *isMyselfStr = [[NSString alloc] initWithUTF8String:isMyself];
    
    char *nickName = (char *) sqlite3_column_text(statement, 2);//提取nickName
    NSString *nickNameStr = [[NSString alloc] initWithUTF8String:nickName];//类型转换
    
    char *time = (char *) sqlite3_column_text(statement, 3);
    NSString *timeStr = [[NSString alloc] initWithUTF8String:time];
    
    char *message = (char *)sqlite3_column_text(statement, 4);
    NSString *messageStr = [[NSString alloc] initWithUTF8String:message];
    
    char *imageName = (char *)sqlite3_column_text(statement, 5);
    NSString *imageNameStr = [[NSString alloc] initWithUTF8String:imageName];
    
    char *messageType = (char *)sqlite3_column_text(statement, 6);
    NSString *messageTypeStr = [[NSString alloc] initWithUTF8String:messageType];
    
    char *conversionID = (char *)sqlite3_column_text(statement, 7);
    NSString *conversionIDStr = [[NSString alloc] initWithUTF8String:conversionID];
    
    
    MessageModel *msg = [[MessageModel alloc] init];
    msg.nickName = nickNameStr;
    msg.time = timeStr;
    msg.message = messageStr;
    msg.imageName = imageNameStr;
    msg.msgId = msgIdStr;
    msg.conversionID = conversionIDStr;
    msg.messageType = [messageTypeStr intValue];
    msg.isMyself = [isMyselfStr boolValue];
    return msg;
}

-(ContactModel *)getContactModel:(sqlite3_stmt *)statement
{
    char *contactID = (char *)sqlite3_column_text(statement, 0);
    NSString *contactIDStr = [[NSString alloc] initWithUTF8String:contactID];
    
    char *nickName = (char *)sqlite3_column_text(statement,1);
    NSString *nickNameStr = [[NSString alloc] initWithUTF8String:nickName];
    
    char *imageName = (char *)sqlite3_column_text(statement, 2);
    NSString *imageNameStr = [[NSString alloc] initWithUTF8String:imageName];
    
    ContactModel *contact = [[ContactModel alloc] init];
    contact.nickName = nickNameStr;
    contact.imageName = imageNameStr;
    contact.contactID = contactIDStr;
    return contact;
}


-(int) insertMessage:(MessageModel *)model
{
    //获取到数据库的路径
    if ([self openDB])
    {
        //构建插入语句
        NSString *sql = @"INSERT OR REPLACE INTO Message (msgId,isMyself,NickName,Time,Message,ImageName,messageType,conversionID)" " VALUES (?,?,?,?,?,?,?,?)";
        //进行预处理
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(db, [sql  UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            //绑定
            NSString *isMyselfStr = model.isMyself ? @"1" : @"0";
            NSString *type = [NSString stringWithFormat:@"%ld",(long)model.messageType];//int
            sqlite3_bind_text(statement, 1, [model.msgId UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 2, [isMyselfStr UTF8String], -1, NULL);
            sqlite3_bind_text(statement,3, [model.nickName UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 4, [model.time UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 5, [model.message UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 6, [model.imageName UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 7, [type UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 8, [model.conversionID UTF8String], -1, NULL);
            int step = sqlite3_step(statement);
            if (step != SQLITE_DONE) {
                NSAssert(NO, @"插入数据失败");
            }
            //成功后释放资源
            sqlite3_finalize(statement);
            sqlite3_close(db);
        }
    }
    
    return 0;
}

-(int)insertConversion:(ConversionDatasModel *)model
{
    if ([self openDB]) {
        NSString *sql = @"INSERT OR REPLACE INTO Conversion (conversionID, nickName, lastMessageTime, message,imageName )" "VALUES(?,?,?,?,?)";
        
        sqlite3_stmt *statement;
        int result = sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, NULL);
        if (result == SQLITE_OK) {
            sqlite3_bind_text(statement, 1, [model.conversionID UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 2, [model.nickName UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 3, [model.lastMessageTime UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 4, [model.message UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 5, [model.imageName UTF8String], -1, NULL);
            int step = sqlite3_step(statement);
            if (step != SQLITE_DONE ) {
                NSAssert(NO, @"插入数据失败");
            }
            sqlite3_finalize(statement);
            sqlite3_close(db);
        }
    }
    return 0;
}

-(int)insertContact:(ContactModel *)model
{
    if ([self openDB]) {
        NSString *sql = @"insert or replace into Contact (ContactID, nickName, imageName) VALUES(?,?,?)";
        sqlite3_stmt *statement;
        
        int result = sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, NULL) ;
        if (result == SQLITE_OK) {
            sqlite3_bind_text(statement, 1, [model.contactID UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 2, [model.nickName UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 3, [model.imageName UTF8String], -1, NULL);
            
            int step = sqlite3_step(statement);
            if (step != SQLITE_DONE) {
                NSAssert(NO, @"插入数据失败");
            }
            sqlite3_finalize(statement);
            sqlite3_close(db);
        }
    }
    return 0;
}
@end
