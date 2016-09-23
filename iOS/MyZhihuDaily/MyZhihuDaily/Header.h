//
//  Header.h
//  MyZhihuDaily
//
//  Created by xuyanli on 16/9/22.
//  Copyright © 2016年 xuyanli. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(__CLASSNAME__)	\
\
+ (__CLASSNAME__*) sharedInstance;

#define SYNTHESIZE_SINGLETON_FOR_CLASS(__CLASSNAME__)	\
+ (__CLASSNAME__ *)sharedInstance\
{\
static __CLASSNAME__ *shared##className = nil;\
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[super allocWithZone:NULL] init]; \
}); \
return shared##className; \
}\
+ (id)allocWithZone:(NSZone*)zone {\
return [self sharedInstance];\
}\
- (id)copyWithZone:(NSZone *)zone {\
return self;\
}


#endif /* Header_h */
