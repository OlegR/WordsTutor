//
//  ORApp.h
//  wordstutorosx
//
//  Created by OlegR on 20.04.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//


/*!
 @class         ORApp
 @abstract      The application utils.
 */
@interface ORApp : NSObject

/*!
 @method        applicationSupportDirectoryURL
 @abstract      Returns application support directory URL.
 @result        applicationSupportDirectoryURL NSURL support directory.
 */
+ (NSURL*)applicationSupportDirectoryURL;

/*!
 @method        bundleName
 @abstract      Returns the application bundle name string.
 @result        bundleName Bundle name string.
 */
+ (NSString*)bundleName;

/*!
 @method        versionString
 @abstract      Returns the application version string.
 @result        versionString App version string.
 */
+ (NSString*)versionString;

/*!
 @method        buildString
 @abstract      Returns the application build string.
 @result        buildString App build string.
 */
+ (NSString*)buildString;

/*!
 @property      bundleIdentifier
 @abstract      Returns the application bundle identifier.
 @discussion    bundleIdentifier App bundle identifier string.
 */
+ (NSString*)bundleIdentifier;

@end
