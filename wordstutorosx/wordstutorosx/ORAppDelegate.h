//
//  ORAppDelegate.h
//  wordstutorosx
//
//  Created by OlegR on 30.03.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//


/*!
 @class         ORAppDelegate
 @abstract      Application delegate.
 */
@interface ORAppDelegate : NSObject <NSApplicationDelegate>
{
}

/*!
 @property      window
 @abstract      Main window outlet.
 */
@property (assign) IBOutlet NSWindow *window;

/*!
 @method        saveAction
 @abstract
 @param
 @result
 */
- (IBAction)saveAction:(id)sender;

@end
