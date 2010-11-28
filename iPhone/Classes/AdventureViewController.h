//
//  AdventureViewController.h
//  AdventureUrban
//
//  Created by User on 11/28/10.
//  Copyright 2010 Assentec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView-Extended.h"
#import "AdventureStep.h"
#import "Adventure.h"

@interface AdventureViewController : UIViewController {
	/* Intro Screen */
	IBOutlet UILabel *adventureIntroduction;
	IBOutlet UILabel *adventureSummaryLeft;
	IBOutlet UILabel *adventureSummaryRight;
	IBOutlet UIButton *smallStartButton;
	
	/* Step Screen */
	IBOutlet UILabel *stepText;
	IBOutlet UITextField *answerInput;
	
	/* Reward Screen */
	IBOutlet UIImageView *rewardImage;
	
	/* Summary Screen */
	IBOutlet UILabel *summaryTextLeft;
	IBOutlet UILabel *summaryTextRight;
	IBOutlet UIButton *socialButton;
	IBOutlet UIButton *voucherButton;
	
	/* Every Screen */
	IBOutlet UIButton *bigGreenButton;
}

/* IB Actions */
- (IBAction)bigGreenPressed:(id)sender;
- (IBAction)littleStartPressed:(id)sender;
- (IBAction)voucherClicked:(id)sender;
- (IBAction)socialClicked:(id)sender;

+ (void)configureWithAdventure:(Adventure *)inAdventure;


@end
