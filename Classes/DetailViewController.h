//
//  DetailViewController.h
//  FriendFeed
//
//  Created by Shane Vitarana on 4/6/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedItem.h"

@interface DetailViewController : UIViewController <UITextViewDelegate, UITableViewDelegate, UITableViewDataSource> {
	
	FeedItem *feedItem;
	UITableView	*myTableView;
}

@property (nonatomic, retain) FeedItem *feedItem;
@property (nonatomic, retain) UITableView *myTableView;

@end
