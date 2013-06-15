//
//  ORAppDelegate.m
//  wordstutorosx
//
//  Created by OlegR on 30.03.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//

#import "ORAppDelegate.h"
#import "ORDataManager.h"
#import "ORMainWindowController.h"


@implementation ORAppDelegate

#pragma mark - Application delegate notifications

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [ORLog redirectLogToFile];
    [ORLog logAppInfo];
    
    _mainWindowController = [[ORMainWindowController alloc] initWithWindowNibName:@"ORMainWindowController"];
    [_mainWindowController showWindow:self];
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender
{
    return [[ORDataManager sharedDataManager] saveDataModelWithApplication:sender];
}

#pragma mark - Main window NSWindowDelegate

- (NSUndoManager *)windowWillReturnUndoManager:(NSWindow *)window
{
    return [[ORDataManager sharedDataManager].managedObjectContext undoManager];
}

#pragma mark - Save action

- (IBAction)saveAction:(id)sender
{
    if ( [[ORDataManager sharedDataManager].managedObjectContext commitEditing] == NO )
    {
        LOG_R(@"Unable to commit editing before saving.");
    }
    
    NSError *error = nil;
    
    if ( [[ORDataManager sharedDataManager].managedObjectContext save:&error] == NO )
    {
        [[NSApplication sharedApplication] presentError:error];
    }
}

@end
