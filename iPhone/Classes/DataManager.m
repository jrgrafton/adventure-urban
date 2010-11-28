//
//  DataManager.m
//  RecipeShopper
//
//  Created by Simon Barnett on 21/09/2010.
//  Copyright (c) 2010 Assentec. All rights reserved.
//

#import "DataManager.h"
#import "Adventure.h"
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
	
	
	
	
}

- (Adventure *)getAdventureByName:(NSString *) adventureName {
	return nil;
}

@end