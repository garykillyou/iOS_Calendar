//
//  MonthCollectionViewController.m
//  FinalProject
//
//  Created by student on 2016/12/29.
//  Copyright © 2016年 student. All rights reserved.
//

#import "MonthCollectionViewController.h"

@interface MonthCollectionViewController ()

@end

@implementation MonthCollectionViewController {
    NSMutableArray *MonthDayNumber;
    NSInteger numberOfDays;
    NSInteger weekDayNumer;
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    // [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    [self loadMonthDayData];
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    
    return numberOfDays + weekDayNumer - 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * CellIdentifier = @"MonthDayCell";
    
    MonthDataCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    if( ![[MonthDayNumber objectAtIndex:indexPath.row] isEqualToString:@"empty"]) {
        if( [[MonthDayNumber objectAtIndex:indexPath.row] isEqualToString:[[MyDateObject sharedMyDateObject] getTodayDay]] && [[MyDateObject sharedMyDateObject] isToday]) {
            
            [myCell setBackgroundColor:[UIColor magentaColor]];
        }
        else {
            
            [myCell setBackgroundColor:[UIColor orangeColor]];
        }
        [myCell.MonthDayLabel setText:[MonthDayNumber objectAtIndex:indexPath.row]];
        myCell.year = [[MyDateObject sharedMyDateObject] getYear];
        myCell.month = [[MyDateObject sharedMyDateObject] getMonth];
        myCell.day = myCell.MonthDayLabel.text;
        myCell.data = nil;
        NSArray *tempArray = [AppDelegate selectDateDataFromEntity:@"DateData" andYear:myCell.year andMonth:myCell.month andDay:myCell.day];
        if( tempArray.count > 0 ) {
            for (NSManagedObject *obj in tempArray) {
                NSLog(@"%@ / %@ / %@ : %@", [obj valueForKey:@"year"], [obj valueForKey:@"month"], [obj valueForKey:@"day"], [obj valueForKey:@"data"]);
                if( myCell.data ) {
                    myCell.data= [myCell.data stringByAppendingString:[obj valueForKey:@"data"]];
                }
                else {
                    myCell.data = [obj valueForKey:@"data"];
                }
            }
            [myCell.MonthDayLabel setBackgroundColor:[UIColor cyanColor]];
        }
        else {
            [myCell.MonthDayLabel setBackgroundColor:[UIColor clearColor]];
        }
    }
    else {
        [myCell.MonthDayLabel setText:nil];
        [myCell setBackgroundColor:[UIColor whiteColor]];
    }
    
    return myCell;
}

- (void) loadMonthDayData {
    
    numberOfDays = [MyDateObject numberOfDaysInMonth:[MyDateObject stringToDate:[[MyDateObject sharedMyDateObject] getLongDate]]];
    
    weekDayNumer = [MyDateObject weekdayWithDate:[MyDateObject stringToDate:[[MyDateObject sharedMyDateObject] getFirstDayInMonth]]];
    
    MonthDayNumber = [[NSMutableArray alloc]init];
    
    for( int i = 1; i < weekDayNumer; i++ ){
        [MonthDayNumber addObject:@"empty"];
    }
    
    for( int i = 1; i <= numberOfDays; i++ ){
        [MonthDayNumber addObject:[NSString stringWithFormat:@"%d", i]];
    }
}

- (void) upMonth {
    [[MyDateObject sharedMyDateObject] addMonth];
    NSLog(@"%@", [[MyDateObject sharedMyDateObject] getShortDate]);
    [self loadMonthDayData];
    [self.collectionView reloadData];
}

- (void) downMonth {
    [[MyDateObject sharedMyDateObject] unaddMonth];
    NSLog(@"%@", [[MyDateObject sharedMyDateObject] getShortDate]);
    [self loadMonthDayData];
    [self.collectionView reloadData];
}


- (void) todayMonth {
    [[MyDateObject sharedMyDateObject] todayMonth];
    NSLog(@"%@", [[MyDateObject sharedMyDateObject] getShortDate]);
    [self loadMonthDayData];
    [self.collectionView reloadData];
}

// 彈出輸入視窗
- (void)popoverInputSelectedDateViewController:(NSString *)year andMonth:(NSString *)month andDay:(NSString *)day andData:(NSString *)data {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main"
                                                 bundle:nil];
    
    InputSelectedDateViewController *detailController = [sb instantiateViewControllerWithIdentifier:@"InputSelectedDate"];
    
    detailController.modalPresentationStyle = UIModalPresentationPopover;
    detailController.year = year;
    detailController.month = month;
    detailController.day = day;
    detailController.data = data;
    
    [self presentViewController:detailController animated:YES completion:nil];
    
    UIPopoverPresentationController *popController = [detailController popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionUnknown;
    popController.delegate = self;
    
    popController.sourceView = self.view;
    popController.sourceRect = CGRectMake(1, 1, self.view.frame.size.width / 2 - 250, self.view.frame.size.height / 2 + 160);
    
}

// 當日期被點擊時觸發
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"You selected cell %ld", indexPath.row);
    MonthDataCell *myCell = (MonthDataCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSLog(@"當日期被點擊時觸發 %@ / %@ / %@ : %@", myCell.year, myCell.month, myCell.day, myCell.data);
    [self popoverInputSelectedDateViewController:myCell.year andMonth:myCell.month andDay:myCell.day andData:myCell.data];
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
