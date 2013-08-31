//
//  ORAppDelegate.h
//  wordstutorosx
//
//  Created by OlegR on 30.03.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//

@import Cocoa;

@class ORMainWindowController;


/*!
 @class         ORAppDelegate
 @abstract      Application delegate.
 */
@interface ORAppDelegate : NSObject <NSApplicationDelegate>
{
    ORMainWindowController* _mainWindowController;
}

/*!
 @method        saveAction
 @abstract
 @param
 @result
 */
- (IBAction)saveAction:(id)sender;

@end
