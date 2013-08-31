//
//  ORLearnWordsViewController.h
//  wordstutorosx
//
//  Created by OlegR on 18.05.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//


/*!
 @enum          ORLearnWordsViewControllerState
 @abstract      The states of the ORLearnWordsViewController.
 */
typedef NS_ENUM(NSUInteger, ORLearnWordsViewControllerState)
{
    ORLearnWordsViewControllerStateCheckWord,
    ORLearnWordsViewControllerStateNextWord
};


/*!
 @class         ORLearnWordsViewController
 @abstract      Imlements controller to learn words.
 */
@interface ORLearnWordsViewController : NSViewController
{
    IBOutlet NSTextField *_wordToLearnTextField;
    IBOutlet NSTextField *_wordEnteredToCheckTextField;
    IBOutlet NSButton *_checkWordButton;
    IBOutlet NSTextField *_correctTranslationTextField;
    IBOutlet NSTextField *_otherLanguagesTranslationsTextField;
    IBOutlet NSButton *_nextWordButton;
}

/*!
 @method        learnWordsViewController
 @abstract      Factory method creates ORLearnWordsViewController instance.
 @result        ORLearnWordsViewController instance.
 */
+ (ORLearnWordsViewController*)learnWordsViewController;

@end
