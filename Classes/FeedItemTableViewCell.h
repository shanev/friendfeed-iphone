//
//  FeedItemTableViewCell.h
//  FriendFeed
//
//  Created by Shane Vitarana on 4/2/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedItem.h"


@interface FeedItemTableViewCell : UITableViewCell {

	FeedItem *feedItem;
}

@property (nonatomic, retain) FeedItem *feedItem;

- (UIImage *)imageForService:(NSString *)service;

@end
