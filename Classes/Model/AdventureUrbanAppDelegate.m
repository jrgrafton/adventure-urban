//
//  AdventureUrbanAppDelegate.m
//  AdventureUrban
//
//  Created by James Grafton on 05/09/2010.
//  Copyright Assentec 2010. All rights reserved.
//

#import "AdventureUrbanAppDelegate.h"

@interface AdventureUrbanAppDelegate()
- (void)startupAnimationDone:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;
@end

@implementation AdventureUrbanAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize homeViewController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /* add the tab bar controller's view to the window and display */
    [window addSubview:tabBarController.view];
    [window makeKeyAndVisible];

	/* animate the splash screen's disappearance */
	splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
	splashView.image = [UIImage imageNamed:@"Default.png"];
	[window addSubview:splashView];
	[window bringSubviewToFront:splashView];
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:2.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:window cache:YES];
	[UIView setAnimationDelegate:self]; 
	[UIView setAnimationDidStopSelector:@selector(startupAnimationDone:finished:context:)];
	splashView.alpha = 0.0;
	splashView.frame = CGRectMake(-60, -85, 440, 635);
	[UIView commitAnimations];
	
    return YES;
}

- (void)startupAnimationDone:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	[splashView removeFromSuperview];
	[splashView release];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {

}

#pragma mark -
#pragma mark Tab Bar Controller delegate

- (BOOL)tabBarController:(UITabBarController *)theTabBarController shouldSelectViewController:(UIViewController *)viewController {
	if (viewController == [theTabBarController.viewControllers objectAtIndex:1] || viewController == [theTabBarController.viewControllers objectAtIndex:2]) {
		UIAlertView *offlineAlert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Feature not implemented yet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[offlineAlert show];
		[offlineAlert release];
		return NO;
		
	}
	
	return YES;
}

#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[homeViewController release];
    [tabBarController release];
    [window release];
    [super dealloc];
}

@end

