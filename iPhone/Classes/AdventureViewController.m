    //
//  AdventureViewController.m
//  AdventureUrban
//
//  Created by User on 11/28/10.
//  Copyright 2010 Assentec. All rights reserved.
//

#import "AdventureViewController.h"

@implementation AdventureViewController

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

- (void) viewDidAppear:(BOOL)animated
{
 	switch (step.stepType) {
        case STEP_REWARD_AUDIO:
            [step playAudio];
            break;
        default:break;
    }
}

- (void)configureWithStep:(AdventureStep *)inAdventureStep 
                          andWithNextStepController:(AdventureViewController *) inNextStep
{
    step = inAdventureStep;
    [step retain];
    nextStepController = inNextStep;
    [nextStepController retain];
    
	UIImage *loadedImage;
	
	switch (step.stepType) {
        case STEP_INTRO:
            [adventureIntroduction setText:step.introductionText];
            [adventureIntroduction setHidden:NO];
            [adventureSummaryLeft setText:step.summaryLeftText];
            [adventureSummaryLeft setHidden:NO];
            [adventureSummaryRight setText:step.summaryRightText];
            [adventureSummaryRight setHidden:NO];
            [smallStartButton setHidden:NO];
            [bigGreenButton setTitle:@"Start" forState:UIControlStateNormal];
            break;
        case STEP_STANDARD:
            [stepText setText:step.stepText];
            [stepText setHidden:NO];
            [stepText setText:step.answerText];
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
            /*TODO: Load video controller here */
            [bigGreenButton setTitle:@"Thanks!" forState:UIControlStateNormal];
            break;
        case STEP_SUMMARY:
            [summaryTextLeft setText:step.summaryLeftText];
            [summaryTextLeft setHidden:NO];
            [summaryTextRight setText:step.summaryRightText];
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
