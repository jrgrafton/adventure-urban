//
//  HomeViewController.m
//  RecipeShopper
//
//  Created by James Grafton on 13/10/2010.
//  Copyright 2010 Assentec. All rights reserved.
//

#import "HomeViewController.h"
#import "AdventureUrbanAppDelegate.h"
#import "Adventure.h"
#import "UITableViewCellFactory.h"

@interface HomeViewController()
- (void)notAvailable;
@end

@implementation HomeViewController

@synthesize adventureViewController;

- (void)viewDidLoad {
	[super viewDidLoad];
	
	//init adventures
	
	/* Nearby Adventures */
	nearbyAdventures = [[NSMutableArray alloc] initWithCapacity:2];
	NSString *adventureTitle = @"Churchills Legacy";
	NSString *adventureLocation = @"Location: London, UK";
	NSString *adventureSolvedByText = @"Solved By: 90";
	UIImage *adventureImage = [UIImage imageNamed: @"churchill_adventure.png"];
	Adventure *adventure = [[Adventure alloc] initWithAdventureTitle:adventureTitle andAdventureLocation:adventureLocation 
											  andAdventureSolvedByText:adventureSolvedByText andAdventureImage:adventureImage];
	[nearbyAdventures addObject:adventure];
	
	adventureTitle = @"Jack The Ripper";
	adventureLocation = @"Location: London, UK";
	adventureSolvedByText = @"Solved By: 120";
	adventureImage = [UIImage imageNamed: @"jack_adventure.png"];
	adventure = [[Adventure alloc] initWithAdventureTitle:adventureTitle andAdventureLocation:adventureLocation 
								 andAdventureSolvedByText:adventureSolvedByText andAdventureImage:adventureImage];
	[nearbyAdventures addObject:adventure];
	
	/* Popular Adventures */
	popularAdventures = [[NSMutableArray alloc] initWithCapacity:2];
	adventureTitle = @"Discover Banksy";
	adventureLocation = @"Location: London, UK";
	adventureSolvedByText = @"Solved By: 30";
	adventureImage = [UIImage imageNamed: @"banksy_adventure.png"];
	adventure = [[Adventure alloc] initWithAdventureTitle:adventureTitle andAdventureLocation:adventureLocation 
								 andAdventureSolvedByText:adventureSolvedByText andAdventureImage:adventureImage];
	[popularAdventures addObject:adventure];
	
	adventureTitle = @"The Beatles Experience";
	adventureLocation = @"Location: London, UK";
	adventureSolvedByText = @"Solved By: 20";
	adventureImage = [UIImage imageNamed: @"beatles_adventure.png"];
	adventure = [[Adventure alloc] initWithAdventureTitle:adventureTitle andAdventureLocation:adventureLocation 
								 andAdventureSolvedByText:adventureSolvedByText andAdventureImage:adventureImage];
	[popularAdventures addObject:adventure];
	
	//Add logo to nav bar
	UIImage *image = [UIImage imageNamed: @"header.png"];
	UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
	self.navigationItem.titleView = imageView;
	[imageView release];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return ([indexPath row] == 0)? 110:85;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
		return 2;
	}else {
		return 2;
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *CellIdentifier;
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	/* Create a cell for this row's product */
	Adventure* adventure;
	
	if ([indexPath section] == 0) {
		CellIdentifier = ([indexPath row] == 0)? @"NearAdventureCellHeader":@"NearAdventureCell";
		adventure = [nearbyAdventures objectAtIndex:[indexPath row]];
	}else if ([indexPath section] == 1) {
		CellIdentifier = ([indexPath row] == 0)? @"PopularAdventureCellHeader":@"PopularAdventureCell";
		adventure = [popularAdventures objectAtIndex:[indexPath row]];
	}
	
	[UITableViewCellFactory createAdventureTableCell:&cell withIdentifier:CellIdentifier withAdventure:(Adventure *)adventure isHeader:([indexPath row] == 0)];
	
	if ([indexPath row] == 0) {
		UILabel *headerLabel = (UILabel *)[cell viewWithTag:5];
		if ([indexPath section] == 0) {
			[headerLabel setText:@"Adventures Nearby"];
		}else if ([indexPath section] == 1) {
			[headerLabel setText:@"Popular Adventures"];
		}
	}
	
	return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	
	return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (!([indexPath section] == 0 && [indexPath row] == 0)) {
		[self notAvailable];
		return;
	}
	
	/*
	if (adventureViewController == nil) {
		AdventureViewController *adventureViewController = [[AdventureViewController alloc] initWithNibName:@"AdventureView" bundle:nil];
		[self setAislesViewController:adventureViewController];
		[adventureViewController release];
	}
	
	[adventuresView deselectRowAtIndexPath:indexPath animated:YES];
	
	AdventureUrbanAppDelegate *appDelegate = (AdventureUrbanAppDelegate *)[[UIApplication sharedApplication] delegate];
	[[appDelegate homeViewController] pushViewController:self.adventureViewController animated:YES];*/
}

- (void)notAvailable {
	UIAlertView *successAlert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Adventure Not Currently Available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[successAlert show];
	[successAlert release];
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
