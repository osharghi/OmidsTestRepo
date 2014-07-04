//
//  Calculator.h
//  CalculatorFinal2
//
//  Created by omid sharghi on 11/16/13.
//  Copyright (c) 2013 TransPower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Fraction.h"

@interface Calculator : NSObject

@property (strong, nonatomic) Fraction *operand1, *operand2, *accumulator;

-(void) clear;
-(Fraction*) performOperation: (char) op;


@end
