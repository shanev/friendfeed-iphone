//
//  preferencesController.m
//  FriendFeed
//
//  Created by Nicolas Rolland on 1/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "preferencesController.h"

NSString * const FFSettingsChanged = @"settingsChanged";
NSString * const FFUserName = @"userName";
NSString * const FFRemoteKey = @"remoteKey";

@implementation PreferencesController


- (id)init
{
	if (self = [super initWithNibName:@"settings"bundle:nil]) {
		// Initialize your view controller.
		self.title = @"Settings";
		self.tabBarItem.image = [UIImage imageNamed:@"toolbar_settings.png"];
	}
	
	return self;
}

-(void)viewDidLoad{
	
	NSLog(@"View did load");
	[userNameField setText:[[NSUserDefaults standardUserDefaults] valueForKey:FFUserName]];
	[remoteKeyField setText: [[NSUserDefaults standardUserDefaults] valueForKey:FFRemoteKey]];
	[userNameField setDelegate:self];
	[remoteKeyField setDelegate:self];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];	
	return YES;	
}


- (IBAction) deactivateBothFields:(id)sender {
	[[NSUserDefaults standardUserDefaults] setValue:[userNameField text]  forKey:FFUserName];
	[[NSUserDefaults standardUserDefaults] setValue:[remoteKeyField text] forKey:FFRemoteKey];	
	[userNameField resignFirstResponder];
	[remoteKeyField resignFirstResponder];

}

-(void)viewWillDisappear:(BOOL)animated
{
	NSLog(@"view will disappear");
	[[NSNotificationCenter defaultCenter] postNotificationName:FFSettingsChanged object:nil]; 
}


@end
