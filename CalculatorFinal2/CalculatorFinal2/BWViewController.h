//
//  BWViewController.h
//  CalculatorFinal2
//
//  Created by omid sharghi on 11/15/13.
//  Copyright (c) 2013 TransPower. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BWViewController : UIViewController

@property (strong,nonatomic) IBOutlet UILabel * display;

-(void) processDigit: (int) digit;
-(void) processOp: (char) theOp;
-(void) storeFracPart;

-(IBAction) clickDigit: (UIButton *) sender;

-(IBAction) clickPlus;
-(IBAction) clickMinus;
-(IBAction) clickMultiply;
-(IBAction) clickDivide;

-(IBAction) clickOver;
-(IBAction) clickClear;
-(IBAction) clickEquals;


@end
