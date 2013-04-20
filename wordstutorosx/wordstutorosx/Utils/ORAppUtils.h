//
//  ORAppUtils.h
//  wordstutorosx
//
//  Created by OlegR on 20.04.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//


/*!
 @class         ORAppUtils
 @abstract      The application utils.
 */
@interface ORAppUtils : NSObject

/*!
 @method        appNameString
 @abstract      Returns the application bundle name string.
 @result        appNameString App name string.
 */
+ (NSString*)appNameString;

/*!
 @method        appVersionString
 @abstract      Returns the application version string.
 @result        appVersionString App version string.
 */
+ (NSString*)appVersionString;

/*!
 @method        appBuildString
 @abstract      Returns the application build string.
 @result        appBuildString App build string.
 */
+ (NSString*)appBuildString;

@end
