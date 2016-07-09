//
//  AdressCard.m
//  AdressBook
//
//  Created by Rigel on 7/8/16.
//  Copyright © 2016 RJ. All rights reserved.
//

#import "AdressCard.h"

@implementation AdressCard
{
    NSString *name ;
    NSString *email;
}
-(void)setName:(NSString *)theName
{
    name = [NSString stringWithString: theName];
}
-(void)setEmail:(NSString *)theEmail
{
    email = [NSString stringWithString: theEmail];
}
-(NSString *)name
{
    return name;
}
-(NSString *)email
{
    return email;
}

-(void)print
{
    NSLog(@"==============================================");
    NSLog(@"|                          |");
    NSLog(@"|  %-31s |", [name UTF8String]);
    NSLog(@"|  %-31s |", [email UTF8String]);
    NSLog(@"|                         |");
    NSLog(@"|                         |");
    NSLog(@"|                         |");
    NSLog(@"|      0            0      |");
    NSLog(@"==============================================");
    
}
@end
