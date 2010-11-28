//
//  HomeViewController.h
//  RecipeShopper
//
//  Created by James Grafton on 13/10/2010.
//  Copyright 2010 Assentec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdventureViewController.h"

@interface HomeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	IBOutlet UITableView *adventuresView;
	
@private 
	NSMutableArray *nearbyAdventures;
	NSMutableArray *popularAdventures;
	AdventureViewController *adventureViewController;
}

@property (nonatomic, retain) AdventureViewController *adventureViewController;

@end
