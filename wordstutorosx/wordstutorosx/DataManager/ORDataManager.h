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
    NSManagedObjectModel* _managedObjectModel;
    NSManagedObjectContext* _managedObjectContext;
    NSPersistentStoreCoordinator* _persistentStoreCoordinator;
}

/*!
 @method        sharedDataManager
 @abstract      Returns data manager instance.
 @result        sharedDataManager
 */
+ (ORDataManager*)sharedDataManager;


@end
