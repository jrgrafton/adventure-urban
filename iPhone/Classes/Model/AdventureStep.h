//
//  AdventureStep.h
//  AdventureUrban
//
//  Created by James Pollock on 28/11/2010.
//  Copyright 2010 Assentec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


typedef enum StepType
{
	STEP_INTRO,
	STEP_STANDARD,
	STEP_REWARD_AUDIO,
	STEP_REWARD_MOVIE,
	STEP_SUMMARY,
    STEP_TEXT
} StepType;

@interface AdventureStep : NSObject {

    @private
    AVAudioPlayer *audioPlayer;
}

@property (readwrite,nonatomic) StepType stepType;

/* Intro Step */
@property (readwrite,copy) NSString *introductionText;

/* Standard Step */
@property (readwrite,copy) NSString *stepText;
@property (readwrite,copy) NSString *answerText;

/* Intro Step & Summary Step */
@property (readwrite,copy) NSString *summaryLeftText;
@property (readwrite,copy) NSString *summaryRightText;

- (id)initAsIntroStep:(NSString *)inAdventureIntroduction;
- (id)initAsIntroStep:(NSString *)inAdventureIntroduction andAdventureSummaryLeft:(NSString *)inAdventureSummaryLeft
                                                          andAdventureSummaryRight: (NSString *) inAdventureSummaryRight; 
- (id)initAsStandardStep:(NSString *)inStepText;
- (id)initAsStandardStep:(NSString *)inStepText andAnswerText:(NSString *)inAnswerText;
- (id)initAsSummaryStep:(NSString *)inAdventureSummaryLeft andAdventureSummaryRight:(NSString*) inAdventureSummaryRight;
- (id)initAsAudioRewardStep:(NSString *)inAudioResourceLocation;
- (id)initAsVideoRewardStep:(NSString *)inVideoResourceLocation;
- (id)initAsStepText:(NSString *)inStepText;

- (void)playAudio;
- (void)stopAudio;

- (NSString *)description;

@end
