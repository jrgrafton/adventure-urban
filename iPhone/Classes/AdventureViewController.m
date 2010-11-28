    //
//  AdventureViewController.m
//  AdventureUrban
//
//  Created by User on 11/28/10.
//  Copyright 2010 Assentec. All rights reserved.
//

#import "AdventureViewController.h"


@implementation AdventureViewController

/* Intro Screen */
@synthesize adventureSummary;

/* Step  screen */
@synthesize stepTextString;
@synthesize answerText;

/* All screens */
@synthesize stepType;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)configureForType:(StepType) inStepType {
	UIImage *loadedImage;
	
	switch (inStepType) {
				
			case STEP_INTRO:
				[adventureIntroduction setText:adventureSummary];
				[adventureIntroduction setHidden:NO];
				[adventureSummaryLeft setHidden:NO];
				[adventureSummaryRight setHidden:NO];
				[smallStartButton setHidden:NO];
				[bigGreenButton setTitle:@"Start" forState:UIControlStateNormal];
				break;
			case STEP_STANDARD:
				[stepText setText:stepTextString];
				[stepText setHidden:NO];
				[answerInput setHidden:NO];
				[bigGreenButton setTitle:@"Next" forState:UIControlStateNormal];
				break;
			case STEP_REWARD_AUDIO:
				loadedImage = [UIImage imageNamed: @"reward_audio.png"];
				[rewardImage setImage:loadedImage];
				[rewardImage setHidden:NO];
				[bigGreenButton setTitle:@"Thanks!" forState:UIControlStateNormal];
				break;
			case STEP_REWARD_MOVIE:
				loadedImage = [UIImage imageNamed: @"reward_movie.png"];
				[rewardImage setImage:loadedImage];
				[rewardImage setHidden:NO];
				[bigGreenButton setTitle:@"Thanks!" forState:UIControlStateNormal];
				break;
			case STEP_SUMMARY:
				[summaryTextLeft setHidden:NO];
				[summaryTextRight setHidden:NO];
				[socialButton setHidden:NO];
				[voucherButton setHidden:NO];
				[bigGreenButton setTitle:@"Finish" forState:UIControlStateNormal];
				break;
			default:
				break;
		}
	
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (IBAction)bigGreenPressed:(id)sender{}
- (IBAction)littleStartPressed:(id)sender{}
- (IBAction)voucherClicked:(id)sender{}
- (IBAction)socialClicked:(id)sender{}

@end
