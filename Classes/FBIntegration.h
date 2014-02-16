//
//  FBIntegration.h
//  AdventureUrban
//
//  Created by James Pollock on 28/11/2010.
//  Copyright 2010 Assentec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBConnect.h"


@interface FBIntegration : NSObject<FBRequestDelegate, FBDialogDelegate, FBSessionDelegate>{
    Facebook* _facebook;
    NSArray* _permissions;
    bool _logged_in;
    NSString *adventureTitle;
}

- (id)initWithAdventureTitle : (NSString *) title;

- (void)dialogDidSucceed:(FBDialog*)dialog;
- (void)dialogDidCancel:(FBDialog*)dialog;

- (void) publishToFeed ;
- (void) authorize : (NSString*) apiKey;

@end
