//
//  main.m
//  AdressBook
//
//  Created by Rigel on 7/8/16.
//  Copyright © 2016 RJ. All rights reserved.
//

#import "AdressCard.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *aName = @"JULia KOchan";
        NSString *aEmail = @"jewls337@axlc.com";
        AdressCard *card1 = [[AdressCard alloc]init];
        [card1 setName: aName];
        [card1 setEmail: aEmail];
        [card1 print];
        
    }
    return 0;
}
