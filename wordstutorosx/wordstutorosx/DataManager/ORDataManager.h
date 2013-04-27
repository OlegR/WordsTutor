//
//  ORDataManager.h
//  wordstutorosx
//
//  Created by OlegR on 27.04.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//


/*!
 @class         ORDataManager
 @abstract      Code data manager.
 */
@interface ORDataManager : NSObject
{
    NSManagedObjectModel* managedObjectModel;
    NSManagedObjectContext* managedObjectContext;
    NSPersistentStoreCoordinator* persistentStoreCoordinator;
}

/*!
 @method        sharedDataManager
 @abstract      Returns data manager instance.
 @result        sharedDataManager
 */
+ (ORDataManager*)sharedDataManager;

/*!
 @property      managedObjectModel
 @abstract      Gives access to the managedObjectModel.
 */
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;

/*!
 @property      managedObjectContext
 @abstract      Gives access to the managedObjectContext.
 */
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

/*!
 @property      persistentStoreCoordinator
 @abstract      Gives access to the persistentStoreCoordinator.
 */
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

/*!
 @method        saveDataModelWithApplication:
 @abstract      Saves data of the application.
 @param         application Instance of the NSApplication.
 @result        reply Application terminate reply.
 */
- (NSApplicationTerminateReply)saveDataModelWithApplication:(NSApplication*)application;

@end
