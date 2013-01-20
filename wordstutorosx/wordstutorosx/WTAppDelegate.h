//
//  WTAppDelegate.h
//  wordstutorosx
//
//  Created by OlegR on 20.01.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface WTAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;

@end
