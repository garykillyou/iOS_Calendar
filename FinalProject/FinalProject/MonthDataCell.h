//
//  MonthDataCell.h
//  FinalProject
//
//  Created by 472 on 2017/1/1.
//  Copyright © 2017年 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonthDataCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UILabel *MonthDayLabel;

@property (strong, nonatomic) NSString *year;
@property (strong, nonatomic) NSString *month;
@property (strong, nonatomic) NSString *day;
@property (strong, nonatomic) NSString *data;

@end
