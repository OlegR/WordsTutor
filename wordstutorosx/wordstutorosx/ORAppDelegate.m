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
    [ORLogger redirectLogToFile];
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

@end
