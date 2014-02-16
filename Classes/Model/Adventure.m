//
//  Adventure.m
//  AdventureUrban
//
//  Created by James Grafton on 07/09/2010.
//  Copyright 2010 Assentec. All rights reserved.
//

#import "Adventure.h"

@implementation Adventure

@synthesize adventureTitle;
@synthesize adventureLocation;
@synthesize adventureSolvedByText;
@synthesize adventureImage;
@synthesize adventureSteps;

- (id)initWithAdventureTitle:(NSString *)inAdventureTitle andAdventureLocation:(NSString *)inAdventureLocation 
	 andAdventureSolvedByText:(NSString *)inAdventureSolvedByText andAdventureImage:(UIImage *)inAdventureImage
     andSteps: (NSArray*) steps{
	
	if (self = [super init]) {
		[self setAdventureTitle:inAdventureTitle];
		[self setAdventureLocation:inAdventureLocation];
		[self setAdventureSolvedByText:inAdventureSolvedByText];
		[self setAdventureImage:inAdventureImage];
        [self setAdventureSteps: steps];
	}
	
	return self;
}

- (id)initWithAdventureTitle:(NSString *)inAdventureTitle andAdventureLocation:(NSString *)inAdventureLocation 
    andAdventureSolvedByText:(NSString *)inAdventureSolvedByText andAdventureImage:(UIImage *)inAdventureImage
{	
	if (self = [super init]) {
		[self setAdventureTitle:inAdventureTitle];
		[self setAdventureLocation:inAdventureLocation];
		[self setAdventureSolvedByText:inAdventureSolvedByText];
		[self setAdventureImage:inAdventureImage];
        [self setAdventureSteps: nil];
	}
	
	return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat: @"\nTitle: %@\nLocation:%@\nSolvedBy:%@\nImageURL:%@\nSteps:%@\n", adventureTitle,
            adventureLocation,
            adventureSolvedByText,
            adventureImage,
            adventureSteps];
}

- (void)dealloc {
	[adventureTitle release];
	[adventureLocation release];
	[adventureSolvedByText release];
	[adventureImage release];
    [adventureSteps release];
	
	[super dealloc];
}

@end
