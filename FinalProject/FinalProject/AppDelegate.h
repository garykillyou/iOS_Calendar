//
//  AppDelegate.h
//  FinalProject
//
//  Created by student on 2016/12/9.
//  Copyright © 2016年 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (NSManagedObjectContext *)getManaedObjectContext;
+ (void)insertDateDataIntoDateData:(NSString*)year andMonth:(NSString *)month andDay:(NSString *)day andContent:(NSString *)content;
+ (NSArray *)selectDateDataFromEntity:(NSString *)entityName andYear:(NSString *)year andMonth:(NSString *)month andDay:(NSString *)day;

@end
