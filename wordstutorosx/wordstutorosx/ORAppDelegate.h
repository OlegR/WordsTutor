//
//  ORAppDelegate.h
//  wordstutorosx
//
//  Created by OlegR on 30.03.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//


/*!
 @class         ORAppDelegate
 @abstract      Application delegate.
 */
@interface ORAppDelegate : NSObject <NSApplicationDelegate>
{
    NSPersistentStoreCoordinator* _persistentStoreCoordinator;
    NSManagedObjectModel* _managedObjectModel;
    NSManagedObjectContext* _managedObjectContext;
}

/*!
 @property
 @abstract
 */
@property (assign) IBOutlet NSWindow *window;

/*!
 @property
 @abstract
 @discussion
 */
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

/*!
 @property
 @abstract
 @discussion
 */
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;

/*!
 @property
 @abstract
 @discussion
 */
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

/*!
 @method
 @abstract
 @discussion
 @param
 @result
 */
- (IBAction)saveAction:(id)sender;

@end
