//
//  AdressCard.h
//  AdressBook
//
//  Created by Rigel on 7/8/16.
//  Copyright © 2016 RJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdressCard : NSObject
-(void)setName: (NSString *) theName;
-(void)setEmail: (NSString *) theEmail;
-(NSString *)name;
-(NSString *)email;

-(void)print;
@end
