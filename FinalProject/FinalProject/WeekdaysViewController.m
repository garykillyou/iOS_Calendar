//
//  WeekdaysViewController.m
//  FinalProject
//
//  Created by 472 on 2016/12/28.
//  Copyright © 2016年 student. All rights reserved.
//

#import "WeekdaysViewController.h"

@interface WeekdaysViewController ()

@end

@implementation WeekdaysViewController {
    NSArray *Weekdays;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Weekdays = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [Weekdays count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *weekdaysTableIdentifier = @"WeekdaysTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:weekdaysTableIdentifier];
    
    // Configure the cell...
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:weekdaysTableIdentifier];
    }
    cell.textLabel.text = [Weekdays objectAtIndex:indexPath.row];

    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
