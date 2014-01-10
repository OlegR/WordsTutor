//
//  ORDataManager+Save.m
//  wordstutorosx
//
//  Created by Oleg Reshetnyak on 10.01.14.
//  Copyright (c) 2014 OlegR. All rights reserved.
//

#import "ORDataManager+Save.h"

@implementation ORDataManager (Save)

#pragma mark -

- (NSApplicationTerminateReply)saveDataModelWithApplication:(NSApplication *)application
{
    if ( self.managedObjectContext == nil )
    {
        return NSTerminateNow;
    }
    
    if ( [self.managedObjectContext commitEditing] == NO )
    {
        LOG_R(@"Unable to commit editing to terminate");
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
