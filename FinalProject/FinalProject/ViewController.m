//
//  ViewController.m
//  FinalProject
//
//  Created by student on 2016/12/9.
//  Copyright © 2016年 student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    SecondViewController *secondViewController;
    
}

@synthesize UpToolBar;
@synthesize ButtomToolBar;
@synthesize DateView;
@synthesize FirstView;
@synthesize SecondView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*CGRect tempRect = ButtomToolBar.frame;
    tempRect.origin.y = tempRect.origin.y + tempRect.size.height - 80;
    tempRect.size.height = 80;
    ButtomToolBar.frame = tempRect;
    
    tempRect = UpToolBar.frame;
    tempRect.size.height = 80;
    UpToolBar.frame = tempRect;*/
    
    [self InitStartView];
    [self GetDateView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)GetDateView {
    
    [DateView setTitle:[[MyDateObject sharedMyDateObject] getLongDate] forState:UIControlStateNormal];
}

- (void)InitStartView {
    
    FirstView.hidden = true;
    SecondView.hidden = false;
}

- (IBAction)UpSegmentedControl:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            FirstView.hidden = false;
            SecondView.hidden = true;
            break;
        case 1:
            FirstView.hidden = true;
            SecondView.hidden = false;
            break;
        default:
            break;
    }
}

- (IBAction)TodayButton:(UIButton *)sender {
    [secondViewController todayMonth];
}

- (IBAction)DebugButton:(UIButton *)sender {
    NSLog(@"%ld", [self selectDataInCoreData]);
}

- (void) loadTodayDate {
    
    NSCalendar *nowCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *nowTime = [nowCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    
    [[MyDateObject sharedMyDateObject] setYear:nowTime.year];
    [[MyDateObject sharedMyDateObject] setMonth:nowTime.month];
    [[MyDateObject sharedMyDateObject] setDay:nowTime.day];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if( [[segue identifier]  isEqualToString: @"MySecondView"] ) {
        secondViewController = [segue destinationViewController];
        NSLog(@"secondViewController is connected");
    }
    else {
        NSLog(@"secondViewController is not connected");
    }
}

- (NSInteger)selectDataInCoreData {
    
    NSManagedObjectContext *context = [AppDelegate getManaedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"DateData"];
    NSArray *dateDataArray = [context executeFetchRequest:request error:nil];
    
    if(dateDataArray) {
        for (NSObject *obj in dateDataArray) {
            NSLog(@"%@ / %@ / %@ : %@", [obj valueForKey:@"year"], [obj valueForKey:@"month"], [obj valueForKey:@"day"], [obj valueForKey:@"data"]);
        }
    }
    return dateDataArray.count;
}

@end
