//
//  CJSONDeserializer.m
//  CocoaJSON
//
//  Created by Jonathan Wight on 12/15/2005.
//  Copyright 2005 __MyCompanyName__. All rights reserved.
//

#import "CJSONDeserializer.h"

#import "CJSONScanner.h"

@implementation CJSONDeserializer

+ (id)deserializer
{
return([[[self alloc] init] autorelease]);
}

- (id)deserialize:(NSString *)inString
{
NSScanner *theScanner = [NSScanner scannerWithString:inString];
id theObject = NULL;
if ([theScanner scanJSONObject:&theObject] == YES)
	return(theObject);
else
	return(NULL);
}

@end
