//
//  SecondViewController.h
//  FinalProject
//
//  Created by 472 on 2017/1/2.
//  Copyright © 2017年 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyDateObject.h"
#import "MonthCollectionViewController.h"

@interface SecondViewController : UIViewController

- (void) upMonth;
- (void) downMonth;
- (void) todayMonth;

@property (weak, nonatomic) IBOutlet UILabel *SecondViewDate;
- (IBAction)UpMonthSwipe:(id)sender;
- (IBAction)DownMonthSwipe:(id)sender;

@end
