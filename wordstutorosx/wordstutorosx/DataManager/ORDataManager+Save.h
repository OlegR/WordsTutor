//
//  ORDataManager+Save.h
//  wordstutorosx
//
//  Created by Oleg Reshetnyak on 10.01.14.
//  Copyright (c) 2014 OlegR. All rights reserved.
//

#import "ORDataManager.h"

@interface ORDataManager (Save)

/*!
 @method        saveDataModelWithApplication:
 @abstract      Saves data of the application.
 @param         application Instance of the NSApplication.
 @result        reply Application terminate reply.
 */
- (NSApplicationTerminateReply)saveDataModelWithApplication:(NSApplication*)application;

@end
