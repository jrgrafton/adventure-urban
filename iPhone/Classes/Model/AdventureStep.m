//
//  AdventureStep.m
//  AdventureUrban
//
//  Created by James Pollock on 28/11/2010.
//  Copyright 2010 Assentec. All rights reserved.
//

#import "AdventureStep.h"

@implementation AdventureStep

@synthesize stepType;
@synthesize introductionText;
@synthesize stepText;
@synthesize answerText;
@synthesize rewardImage;
@synthesize summaryLeftText;
@synthesize summaryRightText;

- (id)initAsIntroStep:(NSString *)inAdventureIntroduction
{
	if (self = [super init]) {
		[self setIntroductionText:inAdventureIntroduction];
	}
	
	return self;    
}

- (id)initAsIntroStep:(NSString *)inAdventureIntroduction andAdventureSummaryLeft:(NSString *)inAdventureSummaryLeft
                                                          andAdventureSummaryRight: (NSString *) inAdventureSummaryRight
{
	if (self = [super init]) {
		[self setIntroductionText:inAdventureIntroduction];
		[self setSummaryLeftText: inAdventureSummaryLeft];
		[self setSummaryRightText:inAdventureSummaryRight];
	}
	
	return self;    
}

- (id)initAsStandardStep:(NSString *)inStepText
{
	if (self = [super init]) {
		[self setStepText:inStepText];
	}
	
	return self;    
}

- (id)initAsStandardStep:(NSString *)inStepText andAnswerText:(NSString *)inAnswerText
{
	if (self = [super init]) {
		[self setStepText:inStepText];
		[self setAnswerText:inAnswerText];
	}
	
	return self;    
}

- (id)initAsAudioRewardStep:(NSString *)inAudioResourceLocation
{
	if (self = [super init]) {
        NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], inAudioResourceLocation]];
        
        NSError *error;
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        audioPlayer.numberOfLoops = -1;
        
        if (audioPlayer == nil)
        {
            NSLog(@"%@", [error description]);
        }
	}
	
	return self;    
}

- (id)initAsVideoRewardStep:(NSString *)inVideoResourceLocation
{
	if (self = [super init]) 
    {
        NSLog(@"Video Loading / Playback Not Implemented");
	}
	
	return self;    
}

- (void) playAudio
{  
    [audioPlayer play];
}

- (void)dealloc {
    [introductionText release];
    [stepText release];
    [answerText release];
    [rewardImage release];
    [summaryLeftText release];
    [summaryRightText release];
    [audioPlayer release];
	
	[super dealloc];
}

@end
