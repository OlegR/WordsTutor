//
//  ORLearnWordsViewController.m
//  wordstutorosx
//
//  Created by OlegR on 18.05.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//

#import "ORLearnWordsViewController.h"


typedef NS_ENUM(NSInteger, ORLearnWordsViewControllerState)
{
    ORLearnWordsViewControllerStateCheckWord,
    ORLearnWordsViewControllerStateNextWord
};


@implementation ORLearnWordsViewController

#pragma mark - 

+ (ORLearnWordsViewController*)learnWordsViewController
{
    return [[ORLearnWordsViewController alloc] initWithNibName:@"ORLearnWordsViewController" bundle:nil];
}

#pragma mark - Actions

- (IBAction)checkWordButtonAction:(id)sender
{
    [self setState:ORLearnWordsViewControllerStateNextWord];
}

- (IBAction)nextWordButtonAction:(id)sender
{
    [self setState:ORLearnWordsViewControllerStateCheckWord];
}

#pragma mark -

- (void)setState:(ORLearnWordsViewControllerState)state
{
    BOOL checkWordButtonHidden = state != ORLearnWordsViewControllerStateCheckWord;
    CGFloat checkWordButtonAlpha = state != ORLearnWordsViewControllerStateCheckWord ? 0.0 : 1.0;

    [_checkWordButton.animator setAlphaValue:checkWordButtonAlpha];
    [_checkWordButton setHidden:checkWordButtonHidden];
    
    BOOL otherControlsHidden = state != ORLearnWordsViewControllerStateNextWord;
    CGFloat otherControlsAlpha = state != ORLearnWordsViewControllerStateNextWord ? 0.0 : 1.0;
    
    [_correctTranslationTextField.animator setAlphaValue:otherControlsAlpha];
    [_correctTranslationTextField setHidden:otherControlsHidden];
    
    [_otherLanguagesTranslationsTextField.animator setAlphaValue:otherControlsAlpha];
    [_otherLanguagesTranslationsTextField setHidden:otherControlsHidden];
    
    [_nextWordButton.animator setAlphaValue:otherControlsAlpha];
    [_nextWordButton setHidden:otherControlsHidden];
    
    BOOL editable = state == ORLearnWordsViewControllerStateCheckWord;
    [_wordEnteredToCheckTextField setEditable:editable];
}

@end
