//
//  ORDataManager.m
//  wordstutorosx
//
//  Created by OlegR on 27.04.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//

#import "ORDataManager.h"


@implementation ORDataManager

#pragma mark - Constants

NSString* const ORDataManagerDomain = @"ORDataManagerDomain";

const NSUInteger ORFailedInitializeStoreErrorCode = 10000;
const NSUInteger ORExpectedFolderStoreAppDataErrorCode = 10001;

#pragma mark - Singleton

+ (ORDataManager*)sharedDataManager
{
    __strong static id _sharedDataManager = nil;
    
    static dispatch_once_t dispatchOncePointer = 0;
    
    dispatch_once(&dispatchOncePointer, ^{
        _sharedDataManager = [[super allocWithZone:NULL] init];
    });
    
    return _sharedDataManager;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedDataManager];
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

#pragma mark - Managed object model

- (NSManagedObjectModel *)managedObjectModel
{
    if ( managedObjectModel )
    {
        return managedObjectModel;
    }
	
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"wordstutorosx" withExtension:@"momd"];
    managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    return managedObjectModel;
}

#pragma mark - Managed object context

- (NSManagedObjectContext *)managedObjectContext
{
    if ( managedObjectContext )
    {
        return managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if ( coordinator == nil )
    {
        NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
        userInfo[NSLocalizedDescriptionKey] = NSLocalizedString(@"Failed to initialize the store", @"");
        userInfo[NSLocalizedFailureReasonErrorKey] = NSLocalizedString(@"There was an error building up the data file.", @"");
        
        NSError *error = [NSError errorWithDomain:ORDataManagerDomain code:ORFailedInitializeStoreErrorCode userInfo:userInfo];
        
        [[NSApplication sharedApplication] presentError:error];
        return nil;
    }
    
    managedObjectContext = [[NSManagedObjectContext alloc] init];
    [managedObjectContext setPersistentStoreCoordinator:coordinator];
    
    return managedObjectContext;
}

#pragma mark - Persistent store coordinator

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if ( persistentStoreCoordinator )
    {
        return persistentStoreCoordinator;
    }
    
    if ( self.managedObjectModel == nil )
    {
        OR_LOG_R(@"No model to generate a store from.");
        return nil;
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *applicationFilesDirectory = [ORAppUtils appFilesDirectory];
    NSError *error = nil;
    
    NSDictionary *properties = [applicationFilesDirectory resourceValuesForKeys:@[NSURLIsDirectoryKey] error:&error];
    
    if ( properties == nil )
    {
        BOOL ok = NO;
        
        if ( [error code] == NSFileReadNoSuchFileError )
        {
            ok = [fileManager createDirectoryAtPath:[applicationFilesDirectory path] withIntermediateDirectories:YES attributes:nil error:&error];
        }
        
        if ( ok == NO )
        {
            [[NSApplication sharedApplication] presentError:error];
            return nil;
        }
    }
    else
    {
        if ( [properties[NSURLIsDirectoryKey] boolValue] == NO )
        {
            NSString *failureDescription = [NSString stringWithFormat:NSLocalizedString(@"Expected a folder to store application data, found a file (%@).", @""), [applicationFilesDirectory path]];
            
            NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
            userInfo[NSLocalizedDescriptionKey] = failureDescription;
            
            error = [NSError errorWithDomain:ORDataManagerDomain code:ORExpectedFolderStoreAppDataErrorCode userInfo:userInfo];
            
            [[NSApplication sharedApplication] presentError:error];
            return nil;
        }
    }
    
    NSURL *url = [applicationFilesDirectory URLByAppendingPathComponent:@"wordstutorosx.storedata"];
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    
    if ( [coordinator addPersistentStoreWithType:NSXMLStoreType configuration:nil URL:url options:nil error:&error] == nil )
    {
        [[NSApplication sharedApplication] presentError:error];
        return nil;
    }
    
    persistentStoreCoordinator = coordinator;
    
    return persistentStoreCoordinator;
}

#pragma mark -

- (NSApplicationTerminateReply)saveDataModelWithApplication:(NSApplication *)application
{
    if ( self.managedObjectContext == nil )
    {
        return NSTerminateNow;
    }
    
    if ( [self.managedObjectContext commitEditing] == NO )
    {
        OR_LOG_R(@"Unable to commit editing to terminate");
        return NSTerminateCancel;
    }
    
    if ( [self.managedObjectContext hasChanges] == NO )
    {
        return NSTerminateNow;
    }
    
    NSError *error = nil;
    
    if ( [self.managedObjectContext save:&error] == NO )
    {
        BOOL result = [application presentError:error];
        
        if ( result )
        {
            return NSTerminateCancel;
        }
        
        NSString *question = NSLocalizedString(@"Could not save changes while quitting. Quit anyway?", @"Quit without saves error question message");
        NSString *info = NSLocalizedString(@"Quitting now will lose any changes you have made since the last successful save", @"Quit without saves error question info");
        NSString *quitButton = NSLocalizedString(@"Quit anyway", @"Quit anyway button title");
        NSString *cancelButton = NSLocalizedString(@"Cancel", @"Cancel button title");
        
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setMessageText:question];
        [alert setInformativeText:info];
        [alert addButtonWithTitle:quitButton];
        [alert addButtonWithTitle:cancelButton];
        
        NSInteger answer = [alert runModal];
        
        if ( answer == NSAlertAlternateReturn )
        {
            return NSTerminateCancel;
        }
    }
    
    return NSTerminateNow;
}

@end
