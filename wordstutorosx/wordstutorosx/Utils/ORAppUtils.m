//
//  ORAppUtils.m
//  wordstutorosx
//
//  Created by OlegR on 20.04.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//


@implementation ORAppUtils

+ (NSString*)appNameString
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
}

+ (NSString*)appVersionString
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (NSString*)appBuildString
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

@end
