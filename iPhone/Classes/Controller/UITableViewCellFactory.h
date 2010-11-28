//
//  UITableViewCellFactory.h
//  RecipeShopper
//
//  Created by James Grafton on 05/09/2010.
//  Copyright 2010 Assentec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Adventure.h"

@interface UITableViewCellFactory : NSObject {

}

/* create adventure table cell */
+ (void)createAdventureTableCell:(UITableViewCell **)cellReference withIdentifier:(NSString *)cellIdentifier withAdventure:(Adventure *)adventure isHeader:(BOOL)isHeader;

@end
