//
//  FBIntegration.m
//  AdventureUrban
//
//  Created by James Pollock on 28/11/2010.
//  Copyright 2010 Assentec. All rights reserved.
//

#import "FBIntegration.h"

#define kAppID @"26889cefc63f3e75f9003f506fd792c3"

@implementation FBIntegration

- (id)initWithAdventureTitle : (NSString *) title;
{
    if (self = [super init]) {
        
        NSLog(@"FBIntegration init");
        
        _logged_in = false;
        _permissions = [[NSArray arrayWithObjects:
                         @"publish_stream", @"read_stream", @"status_update",nil] retain];
        
        _facebook = [[Facebook alloc] init];
        adventureTitle = title;
        [adventureTitle retain];
        [self authorize: kAppID];
    }
    
    return self;
}

- (void) authorize : (NSString*) apiKey 
{
    NSLog(@"FBIntegration authorize");
    [_facebook authorize:apiKey permissions:_permissions delegate:self];
}

- (void) logout
{
    NSLog(@"FBIntegration logout");
    [_facebook logout: self];
}

- (void)dialogDidSucceed:(FBDialog*)dialog 
{
}

- (void)dialogDidCancel:(FBDialog*)dialog 
{
}

- (void) publishToFeed 
{
    NSLog(@"FBIntegration publishToFeed");
    if ( _logged_in )
    {
        NSLog(@"FBIntegration publishToFeed - logged in. Posting");
        SBJSON *jsonWriter = [[SBJSON new] autorelease];
        
        NSDictionary* actionLinks = [NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:
                                                               @"Get AdventureUrban!",@"text",@"http://adventureurban.com/",@"href", nil], nil];
        
        NSString *headlineText = [NSString stringWithFormat: @"Completed the %@ adventure!", adventureTitle];
        NSString *subText = @"It was awesome!";
        NSString *actionLinksStr = [jsonWriter stringWithObject:actionLinks];
        
        NSString *imgUrl = @"http://adventureurban.com/fb_logo.png";
        NSDictionary* picture    = [NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:
                                                              imgUrl, @"src",
                                                              @"image", @"type",
                                                              @"http://adventureurban.com", @"href", nil], nil ];
        NSDictionary* attachment = [NSDictionary dictionaryWithObjectsAndKeys:
                                    headlineText, @"name",
                                    @"Adventure Urban - The New Sensation!", @"caption",
                                    subText, @"description",
                                    @"http://adventureurban.com/", @"href", 
                                    picture, @"media", nil];

        NSString *attachmentStr = [jsonWriter stringWithObject:attachment];
        NSLog(@"%@", attachmentStr);
        
        NSMutableDictionary* params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                       kAppID, @"api_key",
                                       @"Share on Facebook", @"user_message_prompt",
                                       actionLinksStr, @"action_links",
                                       attachmentStr, @"attachment",
                                       nil];
        
        
        [_facebook dialog: @"stream.publish"
                andParams: params
              andDelegate:self]; 
    }
    else {
        NSLog(@"FBIntegration publishToFeed - not logged in. No post.");
    }
    
}

/**
 * Called when the dialog successful log in the user
 */
- (void)fbDidLogin
{
	NSLog(@"FBIntegration: User logged in.");
	_logged_in = YES;
    [self publishToFeed];
}


/**
 * Called when the user dismiss the dialog without login
 */
- (void)fbDidNotLogin
{
	NSLog(@"FBIntegration: User did NOT log.");
	_logged_in = NO;
}


/**
 * Called when the user is logged out
 */
- (void)fbDidLogout
{
	NSLog(@"FBIntegration sessionDidLogout");
	_logged_in = NO;
}

@end


