//
//  WTDetailViewController.h
//  wordstutorios
//
//  Created by OlegR on 20.01.13.
//  Copyright (c) 2013 OlegR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
