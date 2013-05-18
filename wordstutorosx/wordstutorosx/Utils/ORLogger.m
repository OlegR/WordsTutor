//
//  ORLogger.m
//  wordstutorosx
//
//  Created by OlegR on 20.04.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//


@implementation ORLogger

#pragma mark - Log file path

+ (NSString*)logDirectoryString
{
#if defined DEBUG
    NSSearchPathDirectory searchPathDirectory = -1;
#elif defined ADHOC
    NSSearchPathDirectory searchPathDirectory = NSDocumentDirectory;
#elif defined RELEASE
    NSSearchPathDirectory searchPathDirectory = NSApplicationSupportDirectory;
#endif
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(searchPathDirectory, NSUserDomainMask, YES);
    NSString *logDirectoryString = [paths count] ? [paths objectAtIndex:0] : nil;
    
    return logDirectoryString;
}

+ (NSString*)logFilePathString
{
    NSString* pathDirectory = [ORLogger logDirectoryString];    
    NSString* logSubFolderNameString = [ORApp bundleName];
    NSString* logFolderNameString = [pathDirectory stringByAppendingPathComponent:logSubFolderNameString];
    
    if ( [logFolderNameString length] )
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:logFolderNameString withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString* logFileNameString = [ORApp bundleName];
    NSString* logFilePathWithoutExtensionString = [logFolderNameString stringByAppendingPathComponent:logFileNameString];
    NSString* logFilePathString = [logFilePathWithoutExtensionString stringByAppendingPathExtension:@"log"];
    
    return logFilePathString;
}

#pragma mark - Redirect to file

+ (void)redirectLogToFile
{
    NSString* logFilePathString = [ORLogger logFilePathString];
    
    if ( [logFilePathString length] )
    {
        freopen([logFilePathString UTF8String], "w", stderr);
    }
}

#pragma mark - Logs

+ (void)logAppInfo
{
    OR_LOG_R(@"Version: %@. Build: %@.", [ORApp versionString], [ORApp buildString]);
}

@end
