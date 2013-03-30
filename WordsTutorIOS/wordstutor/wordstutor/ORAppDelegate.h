//
//  ORAppDelegate.h
//  wordstutor
//
//  Created by OlegR on 30.03.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ORAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
