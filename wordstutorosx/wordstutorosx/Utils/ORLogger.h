//
//  ORLogger.h
//  wordstutorosx
//
//  Created by OlegR on 20.04.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//


#if defined DEBUG

    #define OR_LOG_D(...) NSLog(@"%s: %d: %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__, nil]);
    #define OR_LOG_A(...) NSLog(@"%s: %d: %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__, nil]);
    #define OR_LOG_R(...) NSLog(@"%s: %d: %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__, nil]);

#elif defined ADHOC

    #define OR_LOG_D(...);
    #define OR_LOG_A(...) NSLog(@"%s: %d: %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__, nil]);
    #define OR_LOG_R(...) NSLog(@"%s: %d: %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__, nil]);

#elif defined RELEASE

    #define OR_LOG_D(...);
    #define OR_LOG_A(...);
    #define OR_LOG_R(...) NSLog(@"%s: %d: %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__, nil]);

#endif


/*!
 @class         ORLogger
 @abstract      The logger.
 */
@interface ORLogger : NSObject

/*!
 @method        redirectLogToFile
 @abstract      Redirects logs from stderr to file.
 @result        void
 */
+ (void)redirectLogToFile;

@end
