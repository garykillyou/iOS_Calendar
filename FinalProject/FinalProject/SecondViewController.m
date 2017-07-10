//
//  SeonodViewController.m
//  FinalProject
//
//  Created by 472 on 2017/1/2.
//  Copyright © 2017年 student. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController {
    MonthCollectionViewController *monthCollectionViewController;
}

@synthesize SecondViewDate;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self testDate];
    [self SecondViewDateChange];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) SecondViewDateChange {

    /*NSLog(@"year(年份): %@", [[MyDateObject sharedMyDateObject] getYear]);
    NSLog(@"month(月份):%@", [[MyDateObject sharedMyDateObject] getMonth]);
    NSLog(@"day(日期):%@", [[MyDateObject sharedMyDateObject] getDay]);*/
    
    [SecondViewDate setText:[[MyDateObject sharedMyDateObject] getShortDate]];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if( [[segue identifier]  isEqualToString: @"MonthViewCollection"] ) {
        monthCollectionViewController = [segue destinationViewController];
        NSLog(@"monthCollectionViewController is connected");
    }
    else {
        NSLog(@"monthCollectionViewController is not connected");
    }
}

- (void)upMonth {
    [monthCollectionViewController upMonth];
    [self SecondViewDateChange];
}

- (void)downMonth {
    [monthCollectionViewController downMonth];
    [self SecondViewDateChange];
}

- (void)todayMonth {
    [monthCollectionViewController todayMonth];
    [self SecondViewDateChange];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)UpMonthSwipe:(id)sender {
    [self upMonth];
}

- (IBAction)DownMonthSwipe:(id)sender {
    [self downMonth];
}

@end
