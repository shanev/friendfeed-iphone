//
//  FeedItem.h
//  FriendFeed
//
//  Created by Shane Vitarana on 4/2/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FeedItem : NSObject {
	NSString *nickName;
	NSString *serviceId;
	NSString *serviceName;
	NSString *title;
	NSArray *comments;
}

@property (nonatomic, retain) NSString *nickName;
@property (nonatomic, retain) NSString *serviceId;
@property (nonatomic, retain) NSString *serviceName;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSArray *comments;


@end
