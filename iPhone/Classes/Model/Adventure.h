//
//  Adventure.h
//  AdventureUrban
//
//  Created by James Grafton on 07/09/2010.
//  Copyright 2010 Assentec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdventureStep.h"

@interface Adventure : NSObject {
}

@property (readwrite,copy) NSString *adventureTitle;
@property (readwrite,copy) NSString *adventureLocation;
@property (readwrite,copy) NSString *adventureSolvedByText;
@property (readwrite,copy) UIImage *adventureImage;
@property (readwrite,retain) NSArray *adventureSteps;

- (id)initWithAdventureTitle:(NSString *)inAdventureTitle andAdventureLocation:(NSString *)inAdventureLocation 
    andAdventureSolvedByText:(NSString *)inadventureSolvedByText andAdventureImage:(UIImage *)inAdventureImage;

- (id)initWithAdventureTitle:(NSString *)inAdventureTitle andAdventureLocation:(NSString *)inAdventureLocation 
	 andAdventureSolvedByText:(NSString *)inadventureSolvedByText andAdventureImage:(UIImage *)inAdventureImage
     andSteps: (NSArray*) steps; 

- (NSString *)description;

@end
