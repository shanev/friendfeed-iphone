//
//  preferencesController.h
//  FriendFeed
//
//  Created by Nicolas Rolland on 1/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>

extern NSString * const FFSettingsChanged;
extern NSString * const FFUserName;
extern NSString * const FFRemoteKey;


@interface PreferencesController : UIViewController <UITextFieldDelegate> {
	IBOutlet UITextField *userNameField;
	IBOutlet UITextField *remoteKeyField;	
}

- (IBAction) deactivateBothFields:(id)sender;
@end
