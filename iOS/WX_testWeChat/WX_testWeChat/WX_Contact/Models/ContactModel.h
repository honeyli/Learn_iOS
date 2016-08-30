#import <Foundation/Foundation.h>
@interface ContactModel : NSObject
@property (nonatomic,strong) NSString *contactID;
@property (nonatomic,strong) NSString *nickName;
@property (nonatomic,strong) NSString *pinyin;
@property (nonatomic,strong) NSString *imageName;
+ (NSString *)transform:(NSString *)chinese;
@end
