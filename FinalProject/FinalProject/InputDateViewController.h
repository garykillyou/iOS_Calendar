//
//  InputDateViewController.h
//  FinalProject
//
//  Created by student on 2017/1/5.
//  Copyright © 2017年 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface InputDateViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *YearInputField;
@property (strong, nonatomic) IBOutlet UITextField *MonthInputField;
@property (strong, nonatomic) IBOutlet UITextField *DayInputField;
- (IBAction)SureButton:(id)sender;

@property (strong, nonatomic) IBOutlet UITextView *DataInputField;

@end
