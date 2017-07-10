//
//  ViewController.h
//  FinalProject
//
//  Created by student on 2016/12/9.
//  Copyright © 2016年 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MyDateObject.h"
#import "SecondViewController.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIToolbar *UpToolBar;
@property (strong, nonatomic) IBOutlet UIToolbar *ButtomToolBar;

@property (weak, nonatomic) IBOutlet UIButton *DateView;

@property (weak, nonatomic) IBOutlet UIView *FirstView;
@property (weak, nonatomic) IBOutlet UIView *SecondView;

- (IBAction)UpSegmentedControl:(UISegmentedControl *)sender;
- (IBAction)TodayButton:(UIButton *)sender;
- (IBAction)DebugButton:(UIButton *)sender;

@end

