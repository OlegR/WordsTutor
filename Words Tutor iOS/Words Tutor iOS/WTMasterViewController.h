//
//  WTMasterViewController.h
//  Words Tutor iOS
//
//  Created by OlegR on 20.01.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WTDetailViewController;

#import <CoreData/CoreData.h>

@interface WTMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) WTDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
