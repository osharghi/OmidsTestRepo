//
//  Fraction.h
//  CalculatorFinal2
//
//  Created by omid sharghi on 11/15/13.
//  Copyright (c) 2013 TransPower. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Fraction : NSObject

@property int numerator, denominator;

-(void) setNumerator:(int) n andDenominator:(int) d;
-(void) print;
-(Fraction*) add: (Fraction*)f;
-(Fraction*) subtract: (Fraction*)f;
-(Fraction*) multiply: (Fraction*)f;
-(Fraction*) divide: (Fraction*)f;
-(double) convertToNum;
-(NSString*) convertToString;
-(void) reduce;


@end
