//
//  ORAppDelegate+DataModel.m
//  wordstutorosx
//
//  Created by OlegR on 06.04.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//

#import "ORAppDelegate+DataModel.h"


@implementation ORAppDelegate (DataModel)

#pragma mark - Core data model

- (NSManagedObjectModel *)managedObjectModel
{
    if ( _managedObjectModel )
    {
        return _managedObjectModel;
    }
	
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"wordstutorosx" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if ( _persistentStoreCoordinator )
    {
        return _persistentStoreCoordinator;
    }
    
    NSManagedObjectModel *mom = [self managedObjectModel];
    
    if ( !mom )
    {
        NSLog(@"%@:%@ No model to generate a store from", [self class], NSStringFromSelector(_cmd));
        return nil;
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *applicationFilesDirectory = [self applicationFilesDirectory];
    NSError *error = nil;
    
    NSDictionary *properties = [applicationFilesDirectory resourceValuesForKeys:@[NSURLIsDirectoryKey] error:&error];
    
    if ( !properties )
    {
        BOOL ok = NO;
        
        if ( [error code] == NSFileReadNoSuchFileError )
        {
            ok = [fileManager createDirectoryAtPath:[applicationFilesDirectory path] withIntermediateDirectories:YES attributes:nil error:&error];
        }
        
        if ( !ok )
        {
            [[NSApplication sharedApplication] presentError:error];
            return nil;
        }
    }
    else
    {
        if ( ![properties[NSURLIsDirectoryKey] boolValue] )
        {
            NSString *failureDescription = [NSString stringWithFormat:NSLocalizedString(@"Expected a folder to store application data, found a file (%@).", @""), [applicationFilesDirectory path]];
            
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setValue:failureDescription forKey:NSLocalizedDescriptionKey];
#warning TODO ORWordsTutorDomain - constants //2013/04/06
            error = [NSError errorWithDomain:@"ORWordsTutorDomain" code:101 userInfo:dict];
            
            [[NSApplication sharedApplication] presentError:error];
            return nil;
        }
    }
    
    NSURL *url = [applicationFilesDirectory URLByAppendingPathComponent:@"wordstutorosx.storedata"];
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    
    if ( ![coordinator addPersistentStoreWithType:NSXMLStoreType configuration:nil URL:url options:nil error:&error] )
    {
        [[NSApplication sharedApplication] presentError:error];
        return nil;
    }
    
    _persistentStoreCoordinator = coordinator;
    
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext
{
    if ( _managedObjectContext )
    {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if ( !coordinator )
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setValue:@"Failed to initialize the store" forKey:NSLocalizedDescriptionKey];
        [dict setValue:@"There was an error building up the data file." forKey:NSLocalizedFailureReasonErrorKey];
#warning TODO ORWordsTutorDomain - constants //2013/04/06
        NSError *error = [NSError errorWithDomain:@"ORWordsTutorDomain" code:9999 userInfo:dict];
        [[NSApplication sharedApplication] presentError:error];
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    
    return _managedObjectContext;
}

#pragma mark -

- (NSURL *)applicationFilesDirectory
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *appSupportURL = [[fileManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
    
    return [appSupportURL URLByAppendingPathComponent:@"com.olegr.wordstutorosx"];
}

#pragma mark -

- (NSApplicationTerminateReply)saveDataModelWithApplication:(NSApplication *)application
{
    if ( !_managedObjectContext )
    {
        return NSTerminateNow;
    }
    
    if ( ![[self managedObjectContext] commitEditing] )
    {
        NSLog(@"%@:%@ unable to commit editing to terminate", [self class], NSStringFromSelector(_cmd));
        return NSTerminateCancel;
    }
    
    if ( ![[self managedObjectContext] hasChanges] )
    {
        return NSTerminateNow;
    }
    
    NSError *error = nil;
    
    if ( ![[self managedObjectContext] save:&error] )
    {
        // Customize this code block to include application-specific recovery steps.
        BOOL result = [application presentError:error];
        
        if (result)
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
        
        if (answer == NSAlertAlternateReturn)
        {
            return NSTerminateCancel;
        }
    }
    
    return NSTerminateNow;
}

@end
