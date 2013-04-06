//
//  ORAppDelegate.m
//  wordstutorosx
//
//  Created by OlegR on 30.03.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//

#import "ORAppDelegate.h"
#import "ORAppDelegate+DataModel.h"


@implementation ORAppDelegate

@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize managedObjectContext = _managedObjectContext;

#pragma mark - Application delegate notifications

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender
{
    return [self saveDataModelWithApplication:sender];
}

#pragma mark - Main window NSWindowDelegate

- (NSUndoManager *)windowWillReturnUndoManager:(NSWindow *)window
{
    return [[self managedObjectContext] undoManager];
}

#pragma mark -

// Performs the save action for the application, which is to send the save: message to the application's managed object context. Any encountered errors are presented to the user.
- (IBAction)saveAction:(id)sender
{
    NSError *error = nil;
    
    if ( ![[self managedObjectContext] commitEditing] )
    {
        NSLog(@"%@:%@ unable to commit editing before saving", [self class], NSStringFromSelector(_cmd));
    }
    
    if ( ![[self managedObjectContext] save:&error] )
    {
        [[NSApplication sharedApplication] presentError:error];
    }
}


@end
