//
//  DataManager.h
//  RecipeShopper
//
//  Created by Simon Barnett on 21/09/2010.
//  Copyright (c) 2010 Assentec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Adventure.h"

@interface DataManager : NSObject {
	@private
    NSMutableDictionary *adventures;
}

+ (DataManager *)getInstance;

- (id)init;
- (void)uninitialiseAll;

- (void)loadAdventures:(NSString *) fileName;
- (Adventure *)getAdventureByName:(NSString *) adventureName;

@end