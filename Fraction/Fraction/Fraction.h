//
//  Fraction.h
//  Fraction
//
//  Created by Rigel on 7/8/16.
//  Copyright © 2016 RJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

@property int numerator, denominator;

-(void)setTo: (int)n over:(int)d;
-(Fraction *) add:(Fraction *)f;
-(double)converToNum;
-(void)print;
-(void)reduce;
@end
