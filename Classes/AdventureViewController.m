    //
//  AdventureViewController.m
//  AdventureUrban
//
//  Created by User on 11/28/10.
//  Copyright 2010 Assentec. All rights reserved.
//

#import "AdventureViewController.h"
#import "AdventureUrbanAppDelegate.h"
#import "FBIntegration.h"

/* Static class fields */
static NSArray* __currentAdventureSteps__;
static AdventureStep* __currentAdventureStep__;
static NSInteger __currentAdventureStepNumber__;

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
	[super viewDidAppear:animated];
	
 	switch ([__currentAdventureStep__ stepType]) {
        case STEP_REWARD_AUDIO:
            [__currentAdventureStep__ playAudio];
            break;
        default:break;
    }
}

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	//Add logo to nav bar
	UIImage *image = [UIImage imageNamed: @"header.png"];
	UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
	self.navigationItem.titleView = imageView;
	[imageView release];
	
	self.navigationItem.title = @"Title";
	
	if (__currentAdventureStepNumber__ != 1) {
		self.navigationItem.hidesBackButton = FALSE;
	}else{
		self.navigationItem.hidesBackButton = TRUE;
	}
	
	UIImage *loadedImage;
	
	switch ([__currentAdventureStep__ stepType]) {
        case STEP_INTRO:
            [adventureIntroduction setText:[__currentAdventureStep__ introductionText]];
			[adventureIntroduction alignTop];
            [adventureIntroduction setHidden:NO];
            [adventureSummaryLeft setText:[__currentAdventureStep__ summaryLeftText]];
            [adventureSummaryLeft setHidden:NO];
            [adventureSummaryRight setText:[__currentAdventureStep__ summaryRightText]];
            [adventureSummaryRight setHidden:NO];
            [smallStartButton setHidden:NO];
            [bigGreenButton setTitle:@"Start" forState:UIControlStateNormal];
            break;
        case STEP_STANDARD:
			[adventureIntroduction setHidden:YES];
			[adventureSummaryLeft setHidden:YES];
			[adventureSummaryRight setHidden:YES];
			
            [stepText setText:[__currentAdventureStep__ stepText]];
			[stepText alignTop];
            [stepText setHidden:NO];
            [answerInput setHidden:NO];
            [bigGreenButton setTitle:@"Next" forState:UIControlStateNormal];
            break;
        case STEP_TEXT:
			[adventureIntroduction setHidden:YES];
			[adventureSummaryLeft setHidden:YES];
			[adventureSummaryRight setHidden:YES];
			
            [stepText setText:[__currentAdventureStep__ stepText]];
			[stepText alignTop];
            [stepText setHidden:NO];
            [answerInput setHidden:YES];
            [bigGreenButton setTitle:@"Next" forState:UIControlStateNormal];
            break;
        case STEP_REWARD_AUDIO:
            loadedImage = [UIImage imageNamed: @"reward_audio.png"];
            [rewardImage setImage:loadedImage];
            [rewardImage setHidden:NO];
            [bigGreenButton setTitle:@"Thanks!" forState:UIControlStateNormal];
            break;
        case STEP_REWARD_MOVIE:
            loadedImage = [UIImage imageNamed: @"reward_video.png"];
            [rewardImage setImage:loadedImage];
            [rewardImage setHidden:NO];
            /*TODO: Load video controller here */
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

+ (void)configureWithAdventure:(Adventure *)inAdventure {
	__currentAdventureSteps__ = inAdventure.adventureSteps;
	__currentAdventureStepNumber__ = 0;
	__currentAdventureStep__ = [__currentAdventureSteps__ objectAtIndex:__currentAdventureStepNumber__];
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

- (IBAction)bigGreenPressed:(id)sender{

 	switch ([__currentAdventureStep__ stepType]) {
        case STEP_REWARD_AUDIO:
            [__currentAdventureStep__ stopAudio];
            break;
        default:break;
    }
    
	__currentAdventureStepNumber__++;
    if ( __currentAdventureStepNumber__ < [__currentAdventureSteps__ count] )
    {
		if ([__currentAdventureStep__ stepType] == STEP_STANDARD) {
			NSString *correctAnswer = [[__currentAdventureStep__ answerText] lowercaseString];
			NSString *userAnswer = [[answerInput text] lowercaseString];
			if (![correctAnswer isEqualToString:userAnswer]) {
				UIAlertView *successAlert = [[UIAlertView alloc] initWithTitle:@"Buffoonery" message:@"We shall never overcome with answers such as that!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
				[successAlert show];
				[successAlert release];
                __currentAdventureStepNumber__--;
				return;
			}
		}
        __currentAdventureStep__ = [__currentAdventureSteps__ objectAtIndex:__currentAdventureStepNumber__];
        AdventureViewController *adventureViewController = [[AdventureViewController alloc] initWithNibName:@"AdventureView" bundle:nil];
        AdventureUrbanAppDelegate *appDelegate = (AdventureUrbanAppDelegate *)[[UIApplication sharedApplication] delegate];
        [[appDelegate homeViewController] pushViewController:adventureViewController animated:YES];
    }
	/* We are at end of adventure */
    else {
        AdventureUrbanAppDelegate *appDelegate = (AdventureUrbanAppDelegate *)[[UIApplication sharedApplication] delegate];
        [[appDelegate homeViewController] popToRootViewControllerAnimated: YES];
    }

}

- (IBAction)littleStartPressed:(id)sender{
	__currentAdventureStepNumber__++;;
	__currentAdventureStep__ = [__currentAdventureSteps__ objectAtIndex:__currentAdventureStepNumber__];
	AdventureViewController *adventureViewController = [[AdventureViewController alloc] initWithNibName:@"AdventureView" bundle:nil];
	AdventureUrbanAppDelegate *appDelegate = (AdventureUrbanAppDelegate *)[[UIApplication sharedApplication] delegate];
	[[appDelegate homeViewController] pushViewController:adventureViewController animated:YES];	
}


- (IBAction)voucherClicked:(id)sender{
	NSURL *url = [NSURL URLWithString:@"http://www.amazon.com/Memoirs-Second-World-Abridgement-Volumes/dp/0395599687/ref=sr_1_4?s=books&ie=UTF8&qid=1290949338&sr=1-4"];
	[[UIApplication sharedApplication] openURL:url];
}


- (IBAction)socialClicked:(id)sender
{
    FBIntegration *fb_stuff = [[FBIntegration alloc] initWithAdventureTitle: @"Churchill Legacy"];
    [fb_stuff publishToFeed];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[answerInput becomeFirstResponder];
    [answerInput resignFirstResponder];
    return YES;
}

@end
