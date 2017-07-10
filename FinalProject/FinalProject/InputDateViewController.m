//
//  InputDateViewController.m
//  FinalProject
//
//  Created by student on 2017/1/5.
//  Copyright © 2017年 student. All rights reserved.
//

#import "InputDateViewController.h"

@interface InputDateViewController ()

@end

@implementation InputDateViewController
@synthesize YearInputField;
@synthesize MonthInputField;
@synthesize DayInputField;
@synthesize DataInputField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect tempRect = DataInputField.frame;
    tempRect.size.height = 200;
    DataInputField.frame = tempRect;
    
    tempRect = YearInputField.frame;
    tempRect.size.height = 90;
    YearInputField.frame = tempRect;
    
    tempRect = MonthInputField.frame;
    tempRect.size.height = 90;
    MonthInputField.frame = tempRect;
    
    tempRect = DayInputField.frame;
    tempRect.size.height = 90;
    DayInputField.frame = tempRect;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)SureButton:(id)sender {
    [AppDelegate insertDateDataIntoDateData:YearInputField.text andMonth:MonthInputField.text andDay:DayInputField.text andContent:DataInputField.text];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)selectDataInCoreData {
    
    NSManagedObjectContext *context = [AppDelegate getManaedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"DateData"];
    NSArray *dateDataArray = [context executeFetchRequest:request error:nil];
    
    return dateDataArray.count;
}

@end
