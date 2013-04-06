//
//  ORAppDelegate+DataModel.h
//  wordstutorosx
//
//  Created by OlegR on 06.04.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//

#import "ORAppDelegate.h"


/*!
 @category      DataModel
 @abstract      Application delegate category. Works with core data.
 */
@interface ORAppDelegate (DataModel)

/*!
 @method
 @abstract
 @discussion
 @param
 @result
 */
- (NSApplicationTerminateReply)saveDataModelWithApplication:(NSApplication*)application;

@end
