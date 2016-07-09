//
//  main.m
//  Fraction
//
//  Created by Rigel on 7/8/16.
//  Copyright © 2016 RJ. All rights reserved.
//

#import "Fraction.h"
@interface Fraction (MathOps)
-(Fraction *)add: (Fraction *)f;
-(Fraction *)mul: (Fraction *)f;
-(Fraction *)sub: (Fraction *)f;
-(Fraction *)div: (Fraction *)f;
@end

@implementation Fraction (MathOps)
-(Fraction *)add: (Fraction *)f
{
    Fraction *result = [[Fraction alloc]init];
    result.numerator = (numerator * f.denominator) +(denominator * f.numerator);
    result.denominator = denominator * f.denominator;
    [result reduce];
    return result;
}

-(Fraction *)mul:(Fraction *)f
{
    Fraction *result = [[Fraction alloc]init];
    result.numerator = numerator * f.denominator;
    result.denominator = denominator * f.denominator;
    [result reduce];
    [return result];
}

-(Fraction *)sub: (Fraction *)f;
{
    Fraction *result = [[Fraction alloc]init];
    result.numerator = (numerator * f.denominator) - (denominator * f.numerator);
    result.denominator = denominator * f.denominator;
    [result reduce];
    return result;
}

-(Fraction *)div:(Fraction *)f
{
    Fraction *result = [[Fraction alloc]init];
    result.numerator = numerator * f.denominator;
    result.denominator = denominator * f.numerator;
    [result reduce];
    
    [return result]
}
                         
@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Fraction *a = [[Fraction alloc]init];
        Fraction *b = [[Fraction alloc]init];
        Fraction *result;
        
        [a setTo: 1 over: 3];
        [b setTo: 2 over: 5];
        
        [a print];
        NSLog(@" +");
        [b print];
        NSLog(@"-----");
        result = [a add:b];
        [result print];
        NSLog(@"\n");
        
        [a print];
        NSLog(@" -");
        [b print];
        NSLog(@"-----");
        result = [a sub:b];
        [result print];
        NSLog(@"\n");
        
        [a print];
        NSLog(@" *");
        [b print];
        NSLog(@"-----");
        result = [a mul:b];
        [result print];
        NSLog(@"\n");
        
        [a print];
        NSLog(@" /");
        [b print];
        NSLog(@"-----");
        result = [a div:b];
        [result print];
        NSLog(@"\n");
    }
    return 0;
}
