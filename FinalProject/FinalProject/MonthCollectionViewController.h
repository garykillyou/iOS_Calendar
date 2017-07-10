//
//  MonthCollectionViewController.h
//  FinalProject
//
//  Created by student on 2016/12/29.
//  Copyright © 2016年 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyDateObject.h"
#import "MonthDataCell.h"
#import "AppDelegate.h"
#import "InputSelectedDateViewController.h"

@interface MonthCollectionViewController : UICollectionViewController

- (void) upMonth;
- (void) downMonth;
- (void) todayMonth;

@end
