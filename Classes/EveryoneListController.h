//
//  EveryoneListController.h
//  FriendFeed
//
//  Created by Shane Vitarana on 4/4/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EveryoneListController : UIViewController <UITableViewDelegate, UITableViewDataSource> {

	NSMutableData *receivedData;
	NSMutableArray *feedItems;
	UIView *containerView;	

}

@property (retain) NSMutableData *receivedData;
@property (nonatomic, retain) NSMutableArray *feedItems;
@property (nonatomic,retain) UIView *containerView;


@end
