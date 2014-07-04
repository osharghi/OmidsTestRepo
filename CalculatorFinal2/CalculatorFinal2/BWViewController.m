//
//  BWViewController.m
//  CalculatorFinal2
//
//  Created by omid sharghi on 11/15/13.
//  Copyright (c) 2013 TransPower. All rights reserved.
//

#import "BWViewController.h"
#import "Calculator.h"

@interface BWViewController ()

@end

@implementation BWViewController
{
    
    char op;
    int currentNumber;
    BOOL isNumerator, firstOperand;
    Calculator * myCalculator;
    NSMutableString *displayString;
    
}

@synthesize display;


- (void)viewDidLoad
{

    firstOperand = YES;
    isNumerator = YES;
    
    displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [[Calculator alloc] init];
}


-(IBAction) clickDigit:(UIButton *)sender
{
    
    int digit = sender.tag;
    
    [self processDigit:digit];
    
}

-(IBAction) processDigit:(int)digit
{
    
    currentNumber = currentNumber*10 + digit;
    
    [displayString appendString: [NSString stringWithFormat:@"%i", digit]];
    
    display.text = displayString;
    
}

-(IBAction) clickOver
{
    
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString:@"/"];
    display.text = displayString;
    
}

-(void) storeFracPart
{
    
    if(firstOperand)
    {
        if(isNumerator)
        {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        }
        else
        {
            myCalculator.operand1.denominator = currentNumber;
        }
    }
    else if(isNumerator)
    {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator =1;
    }
    else
    {
        myCalculator.operand2.denominator = currentNumber;
    }
    currentNumber = 0;
    
}

-(IBAction) clickPlus
{
    [self processOp:'+'];
}

-(IBAction) clickMinus
{
    [self processOp:'-'];
    
}

-(IBAction) clickMultiply
{
    
    [self processOp:'*'];
    
}

-(IBAction) clickDivide
{
    [self processOp:'/'];
}


-(void) processOp:(char)theOp
{
    
    NSString * opStr;
    
    op = theOp;
    
    switch(op) /**this might need to be theOp**/
    {
            case '+':
            opStr = @"+";
            break;
            
            case '-':
            opStr = @"-";
            break;
            
            case '*':
            opStr = @"*";
            break;
            
            case '/':
            opStr = @"/";
            break;
    }
    
    
    
    [self storeFracPart];
    
    isNumerator = YES;
    firstOperand = NO;
    
    [displayString appendString:opStr];
    display.text = displayString;
    
}

-(IBAction) clickEquals
{
    
    if(isNumerator == NO)
    {
        [self storeFracPart];
        [myCalculator performOperation:op];
        
        [displayString appendString: @"="];
        [displayString appendString:[myCalculator.accumulator convertToString]];
        display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand =YES;
        [displayString setString: @" "];

    }
}

-(IBAction) clickClear
{
    
    currentNumber = 0;
    isNumerator = YES;
    firstOperand = YES;
    [myCalculator clear];
    
    [displayString setString:@" "];
    display.text = displayString;
}

@end
