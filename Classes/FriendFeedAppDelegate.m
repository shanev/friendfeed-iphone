//
//  FriendFeedAppDelegate.m
//  FriendFeed
//
//  Created by Shane Vitarana on 3/31/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "FriendFeedAppDelegate.h"
#import "EveryoneListController.h"
#import "MeListController.h"
#import "FriendsListController.h"
#import "PreferencesController.h"


@implementation FriendFeedAppDelegate

@synthesize window;
@synthesize tabBarController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {	

	// Create a tabbar controller and an array to contain the view controllers
	tabBarController = [[UITabBarController alloc] init];
	NSMutableArray *localViewControllersArray = [[NSMutableArray alloc] initWithCapacity:2];
	UINavigationController *navigationController;
	
	FriendsListController *friendsListController = [[FriendsListController alloc] init];
	navigationController = [[UINavigationController alloc] initWithRootViewController:friendsListController];
	[friendsListController release];
	[localViewControllersArray addObject:navigationController];
	[navigationController release];

	MeListController *meListController = [[MeListController alloc] init];
	navigationController = [[UINavigationController alloc] initWithRootViewController:meListController];
	[meListController release];
	[localViewControllersArray addObject:navigationController];
	[navigationController release];

	EveryoneListController *everyoneListController = [[EveryoneListController alloc] init];
	navigationController = [[UINavigationController alloc] initWithRootViewController:everyoneListController];
	[everyoneListController release];
	[localViewControllersArray addObject:navigationController];
	[navigationController release];
	
	PreferencesController *preferencesController = [[PreferencesController alloc] init];
	navigationController = [[UINavigationController alloc] initWithRootViewController:preferencesController];
	[preferencesController release];
	[localViewControllersArray addObject:navigationController];
	[navigationController release];
	
	
	tabBarController.viewControllers = localViewControllersArray;
	[localViewControllersArray release];
	
	[[NSNotificationCenter defaultCenter] postNotificationName:FFSettingsChanged object:nil]; 
	// Create window
	self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
	// Add the tab controller's view to the window
	[self.window addSubview:[self.tabBarController view]];

	// Show window
	[self.window makeKeyAndVisible];	

}

-(void)changed:(NSNotification *)note{
	NSLog(@"notified");
}

- (void)dealloc {
	[window release];
	[super dealloc];
}

@end
