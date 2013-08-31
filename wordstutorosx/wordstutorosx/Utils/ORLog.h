//
//  ORLog.h
//  wordstutorosx
//
//  Created by OlegR on 20.04.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//


#ifdef EXCLUSIVE_LOG

    #define LOG_E(...) NSLog(@"%s: %d: %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__, nil]);
    #define LOG_D(...);
    #define LOG_A(...);
    #define LOG_R(...);

#elif defined TESTFLIGHT_LOG

#elif defined DEBUG

    #define LOG_E(...);
    #define LOG_D(...) NSLog(@"%s: %d: %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__, nil]);
    #define LOG_A(...) NSLog(@"%s: %d: %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__, nil]);
    #define LOG_R(...) NSLog(@"%s: %d: %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__, nil]);

#elif defined ADHOC

    #define LOG_E(...);
    #define LOG_D(...);
    #define LOG_A(...) NSLog(@"%s: %d: %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__, nil]);
    #define LOG_R(...) NSLog(@"%s: %d: %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__, nil]);

#elif defined RELEASE

    #define LOG_E(...);
    #define LOG_D(...);
    #define LOG_A(...);
    #define LOG_R(...) NSLog(@"%s: %d: %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__, nil]);

#endif


/*!
 @class         ORLog
 @abstract      The logger.
 */
@interface ORLog : NSObject

/*!
 @method        redirectLogToFile
 @abstract      Redirects logs from stderr to file.
 @result        void
 */
+ (void)redirectLogToFile;

/*!
 @method        logAppInfo
 @abstract      Logs application info.
 @result        void
 */
+ (void)logAppInfo;

@end
