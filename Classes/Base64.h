//
//  Base64.h
//  FriendFeed
//
//  Created by Nicolas Rolland on 1/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (Base64) 
	- (NSString *) base64Encode;

@end


@interface NSData (Base64) 
- (NSString *) base64Encode;

@end

