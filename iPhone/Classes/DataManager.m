//
//  DataManager.m
//  RecipeShopper
//
//  Created by Simon Barnett on 21/09/2010.
//  Copyright (c) 2010 Assentec. All rights reserved.
//

#import "DataManager.h"
#import "Adventure.h"
#import "AdventureStep.h"
#import "JSON.h"

static DataManager *sharedInstance = nil;

@implementation DataManager

+ (DataManager *)getInstance {
	@synchronized(self){
		if (sharedInstance == nil) {
			sharedInstance = [[DataManager alloc] init];
		}
	}
    return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [super allocWithZone:zone];
            return sharedInstance;  // assignment and return on first allocation
        }
    }
    return nil; // on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return self;
}

- (NSUInteger)retainCount {
    return NSUIntegerMax;  //denotes an object that cannot be released
}

- (void)release {
    //do nothing
}

- (id)autorelease {
    return self;
}

- (id)init {
	@synchronized(self) {
		[super init];
        adventures = [[NSMutableDictionary alloc] init];
	}
	
	return self;
}

- (void)uninitialiseAll {
}

- (void)loadAdventures:(NSString *) fileName {
	NSString *jsonString = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
	
	/* parse the JSON results */
	SBJSON *parser = [[SBJSON alloc] init];
	NSError *jsonError = nil;
	NSDictionary *jsonResults = [parser objectWithString:jsonString error:&jsonError];
	
    if ( jsonResults )
    {
        NSArray *adventureArray = [jsonResults objectForKey:@"Adventures"];

        NSEnumerator *adventureIt = [adventureArray objectEnumerator];
        NSDictionary *adventure;
        while (adventure = [adventureIt nextObject]) {
            NSArray *adventureSteps = [adventure objectForKey:@"adventureSteps"];
            if ( adventureSteps )
            {
                NSMutableArray *stepContainer = [[NSMutableArray alloc] initWithCapacity: [adventureSteps count]];
                
                NSEnumerator *stepIt = [adventureSteps objectEnumerator];
                NSDictionary *stepDict;
                while ( stepDict = [stepIt nextObject] )
                {
                    NSString *stepTypeString = [stepDict objectForKey: @"stepType"];
                    if ( stepTypeString )
                    {
                        StepType stepType = [stepTypeString intValue];
                        AdventureStep *step = nil;
                        switch (stepType)
                        {
                            case STEP_INTRO:
                                step = [[AdventureStep alloc] initAsIntroStep: [stepDict objectForKey:@"adventureIntroduction"]];
                                break;
                            case STEP_STANDARD:
                                step = [[AdventureStep alloc] initAsStandardStep: [stepDict objectForKey:@"stepTextString"]
                                                                   andAnswerText: [stepDict objectForKey:@"answerText"]];
                                break;
                            case STEP_REWARD_AUDIO:
                                step = [[AdventureStep alloc] initAsAudioRewardStep: [stepDict objectForKey:@"resourceName"]];
                                break;
                            case STEP_REWARD_MOVIE:
                                step = [[AdventureStep alloc] initAsVideoRewardStep: [stepDict objectForKey:@"resourceName"]];
                                break;
                            case STEP_SUMMARY:
                                step = [[AdventureStep alloc] initAsSummaryStep: [stepDict objectForKey:@"summaryLeft"]
                                                       andAdventureSummaryRight: [stepDict objectForKey:@"summaryRight"]];
                                break;                                
                            default:
                                NSLog(@"Unknown step type: %@", stepType);
                                break;
                        }
                        
                        if ( step )
                        {
                            [stepContainer addObject: step];
                        }
                        
                    }
                    else {
                        NSLog(@"Unknown step type");
                    }

                    Adventure *newAdventure = [[Adventure alloc] initWithAdventureTitle: [adventure objectForKey:@"adventureTitle"]
                                                                   andAdventureLocation: [adventure objectForKey:@"adventureLocation"]
                                                               andAdventureSolvedByText: [adventure objectForKey:@"adventureSolvedByText"]
                                                                      andAdventureImage: [adventure objectForKey:@"adventureImage"]
                                                                               andSteps: stepContainer];
                    [adventures setObject: newAdventure forKey: newAdventure.adventureTitle];
                }
                
            }
            else {
                NSLog(@"No steps found in adventure");
            }

        }
    }
    else {
        NSLog(@"No adventures found in JSON");
    }

	
}

- (Adventure *)getAdventureByName:(NSString *) adventureName {
    return [adventures objectForKey:adventureName];
}

@end