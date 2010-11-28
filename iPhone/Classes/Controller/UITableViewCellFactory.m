//
//  UITableViewCellFactory.m
//  Adventure Urban
//
//  Created by James Grafton on 05/09/2010.
//  Copyright 2010 Assentec. All rights reserved.
//

#import "UITableViewCellFactory.h"
#import "UIImage-Extended.h"

#define ADVENTURE_IMAGE_TAG 1
#define ADVENTURE_TITLE_TAG 2
#define ADVENTURE_LOCATION_TAG 3
#define ADVENTURE_SOLVEDCOUNT_TAG 4


@implementation UITableViewCellFactory

+ (void)createAdventureTableCell:(UITableViewCell **)cellReference withIdentifier:(NSString *)cellIdentifier withAdventure:(Adventure *)adventure isHeader:(BOOL)isHeader {
	UILabel *label;
	UIImageView *image;
	
	if (*cellReference == nil) {
		/* load the recipe view cell nib */
        NSArray *bundle;	
		
		if (isHeader) {
			bundle = [[NSBundle mainBundle] loadNibNamed:@"AdventureCellHeader" owner:self options:nil];
		}else{
			bundle = [[NSBundle mainBundle] loadNibNamed:@"AdventureCell" owner:self options:nil];
		}
		
        for (id viewElement in bundle) {
			if ([viewElement isKindOfClass:[UITableViewCell class]])
				*cellReference = (UITableViewCell *)viewElement;
		}
    }
	
	UITableViewCell *cell = *cellReference;
	
	image = (UIImageView *)[cell viewWithTag:ADVENTURE_IMAGE_TAG];
	[image setImage:[adventure adventureImage]];// resizedImage:CGSizeMake(150,150) interpolationQuality:kCGInterpolationHigh andScale:2.0]];
	
	label = (UILabel *)[cell viewWithTag:ADVENTURE_TITLE_TAG];
    [label setText:[adventure adventureTitle]];
	
	label = (UILabel *)[cell viewWithTag:ADVENTURE_LOCATION_TAG];
	[label setText:[adventure adventureLocation]];
	 
	label = (UILabel *)[cell viewWithTag:ADVENTURE_SOLVEDCOUNT_TAG];
	[label setText:[adventure adventureSolvedByText]];
}

@end
