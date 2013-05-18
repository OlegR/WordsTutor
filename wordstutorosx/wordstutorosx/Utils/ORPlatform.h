//
//  ORPlatform.h
//  wordstutorosx
//
//  Created by OlegR on 15.05.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//


/*!
 @class         ORPlatform
 @abstract      The utils class to get info about OS version, device model an so on.
 */
@interface ORPlatform : NSObject

/*!
 @method        iPad
 @abstract      Is it an iPad.
 @result        isIpad The BOOL value.
 */
+ (BOOL)iPad;

/*!
 @method        iPhone
 @abstract      Is it an iPhone.
 @result        isIphone The BOOL value.
 */
+ (BOOL)iPhone;

@end
