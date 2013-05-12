//
//  ORAppDelegate.h
//  wordstutorosx
//
//  Created by OlegR on 30.03.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//


@class ORMainWindowController;


/*!
 @class         ORAppDelegate
 @abstract      Application delegate.
 */
@interface ORAppDelegate : NSObject <NSApplicationDelegate>
{
    ORMainWindowController* mainWindowController;
}

/*!
 @method        saveAction
 @abstract
 @param
 @result
 */
- (IBAction)saveAction:(id)sender;

@end
