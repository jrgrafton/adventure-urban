//
//  AdventureViewController.h
//  AdventureUrban
//
//  Created by User on 11/28/10.
//  Copyright 2010 Assentec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView-Extended.h"

typedef enum StepType
{
	STEP_INTRO,
	STEP_STANDARD,
	STEP_REWARD_AUDIO,
	STEP_REWARD_MOVIE,
	STEP_SUMMARY
} StepType;

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
	
	@private
	AdventureViewController* nextStep;
}

/* IB Actions */
- (IBAction)bigGreenPressed:(id)sender;
- (IBAction)littleStartPressed:(id)sender;
- (IBAction)voucherClicked:(id)sender;
- (IBAction)socialClicked:(id)sender;

/* Properties */

/* Intro Screen */
@property (assign,nonatomic) NSString *adventureSummary;

/* Step  screen */
@property (assign,nonatomic) NSString *stepTextString;
@property (assign,nonatomic) NSString *answerText;

/* All screens */
@property (assign,nonatomic) StepType stepType;

/* Configure for type assumes all neccessary info has already been set */
/* This must be called before controller is pushed into view */
- (void)configureForType:(StepType) inStepType;

@end
