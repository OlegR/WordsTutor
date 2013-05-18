//
//  ORPlatform.m
//  wordstutorosx
//
//  Created by OlegR on 15.05.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//


@implementation ORPlatform

#pragma mark - iOS device info

+ (BOOL)iPad
{
#if TARGET_OS_IPHONE
    return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
#else
    return NO;
#endif
}

+ (BOOL)iPhone
{
#if TARGET_OS_IPHONE
    return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone;
#else
    return NO;
#endif
}

@end
