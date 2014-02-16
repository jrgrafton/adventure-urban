//
//  RecipeShopperAppDelegate.h
//  RecipeShopper
//
//  Created by James Grafton on 05/09/2010.
//  Copyright Assentec 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataManager;

@interface AdventureUrbanAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
@private
	UIImageView *splashView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet UINavigationController *homeViewController;

@end
