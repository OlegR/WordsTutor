//
//  ORMainWindowController.m
//  wordstutorosx
//
//  Created by OlegR on 11.05.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//

#import "ORMainWindowController.h"
#import "ORLearnWordsViewController.h"


@implementation ORMainWindowController

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    self.window.title = [ORApp bundleName];
    
    _learnWordsViewController = [ORLearnWordsViewController learnWordsViewController];
    
    [self.window setContentView:_learnWordsViewController.view];
    
    
}

@end
