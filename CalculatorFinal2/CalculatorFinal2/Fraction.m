//
//  Fraction.m
//  CalculatorFinal2
//
//  Created by omid sharghi on 11/15/13.
//  Copyright (c) 2013 TransPower. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

@synthesize numerator, denominator;

-(void) setNumerator:(int)n andDenominator:(int)d
{

    numerator =n;
    denominator = d;
    
}

-(void) print
{
    NSLog(@"%i/%i", numerator, denominator);
}

-(double) convertToNum
{
    
    if (denominator!=0)
    {
        return (double) numerator/denominator;
    }
    else
    {
        return NAN;
    }
    
}

-(NSString*) convertToString
{
    
    if(numerator == denominator)
    {
        if(numerator == 0)
            return @"0";
        else
            return @"1";
    }
    else if (denominator ==1)
        return [NSString stringWithFormat:@"%i", numerator];
    else
        return [NSString stringWithFormat:@"%i/%i", numerator, denominator];
    
    
}

-(void) reduce
{
    
    int u = numerator;
    int v = denominator;
    int temp;
    
    if(u==0)
        return;
    else if (u<0)
    {
        u=-u;
    }
    
    
    while(v!=0)
    {
        temp = u%v;
        u=v;
        v=temp;
    }
    
    numerator /=u;
    denominator /=v;
    
}

-(Fraction*) add: (Fraction*)f
{
    
    Fraction*result = [[Fraction alloc] init];
    
    result.numerator = (numerator * f.denominator) + (f.numerator * denominator);
    result.denominator = denominator * f.denominator;
    
    [result reduce];
    
    return result;
    
    
}

-(Fraction*) subtract:(Fraction *)f
{
    
    Fraction * result = [[Fraction alloc] init];
    
    result.numerator = (numerator * f.denominator) - (denominator * f.numerator);
    result.denominator  = denominator * f.denominator;
    
    [result reduce];
    return result;
    
}

-(Fraction*) multiply:(Fraction *)f
{
    
    Fraction * result = [[Fraction alloc] init];
    
    result.numerator = numerator * f.numerator;
    result.denominator = denominator * denominator;
    
    [result reduce];
    return result;
    
}

-(Fraction *) divide:(Fraction *)f
{
    Fraction * result = [[Fraction alloc] init];
    
    result.numerator = numerator * f.denominator;
    result.denominator = denominator * f.numerator;
    
    [result reduce];
    
    return result;
    
    
}

@end
