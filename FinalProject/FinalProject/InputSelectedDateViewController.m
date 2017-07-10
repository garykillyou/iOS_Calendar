//
//  InputSelectedDateViewController.m
//  FinalProject
//
//  Created by 472 on 2017/1/12.
//  Copyright © 2017年 student. All rights reserved.
//

#import "InputSelectedDateViewController.h"

@interface InputSelectedDateViewController ()

@end

@implementation InputSelectedDateViewController
@synthesize DateLabel;
@synthesize DataInputFiled;
@synthesize year;
@synthesize month;
@synthesize day;
@synthesize data;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DateLabel.text = [NSString stringWithFormat:@"%@ / %@ / %@", year, month, day];
    NSLog(@"%@", data);
    if( data ) DataInputFiled.text = data;
    else DataInputFiled.text = @"No Data";
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

- (IBAction)SaveButton:(UIButton *)sender {
    [AppDelegate insertDateDataIntoDateData:year andMonth:month andDay:day andContent:DataInputFiled.text];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if( [textView.text isEqualToString:@"No Data"] ) {
        textView.text = @"";
    }
}

@end
