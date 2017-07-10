//
//  InputSelectedDateViewController.h
//  FinalProject
//
//  Created by 472 on 2017/1/12.
//  Copyright © 2017年 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface InputSelectedDateViewController : UIViewController <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *DateLabel;
@property (weak, nonatomic) IBOutlet UITextView *DataInputFiled;
- (IBAction)SaveButton:(UIButton *)sender;

@property (strong, nonatomic) NSString *year;
@property (strong, nonatomic) NSString *month;
@property (strong, nonatomic) NSString *day;
@property (strong, nonatomic) NSString *data;

@end
