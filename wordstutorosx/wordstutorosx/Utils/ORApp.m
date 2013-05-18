//
//  ORApp.m
//  wordstutorosx
//
//  Created by OlegR on 20.04.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//

@implementation ORApp

#pragma mark -

+ (NSURL*)applicationSupportDirectoryURL
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *appSupportURL = [[fileManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
    
    return [appSupportURL URLByAppendingPathComponent:[ORApp bundleIdentifier]];
}

#pragma mark - Bundle utils

+ (NSString*)bundleName
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
}

+ (NSString*)versionString
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (NSString*)buildString
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

+ (NSString*)bundleIdentifier
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

@end
