//
//  ORAppDelegate.h
//  wordstutorosx
//
//  Created by OlegR on 30.03.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ORAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;

@end
