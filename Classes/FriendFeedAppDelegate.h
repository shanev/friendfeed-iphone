//
//  FriendFeedAppDelegate.h
//  FriendFeed
//
//  Created by Shane Vitarana on 3/31/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "FeedItem.h"

@interface FriendFeedAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UITabBarController *tabBarController;
}

//-(IBAction)ShowPreferences:(id)sender;

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UITabBarController *tabBarController;

@end
