//
//  UICellTextView.h
//  FriendFeed
//
//  Created by Shane Vitarana on 4/7/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICellTextView : UITableViewCell
{
    UITextView *view;
}

@property (nonatomic, retain) UITextView *view;

@end
