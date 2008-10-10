//
//  CJSONDeserializer.h
//  CocoaJSON
//
//  Created by Jonathan Wight on 12/15/2005.
//  Copyright 2005 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJSONDeserializer : NSObject {

}

+ (id)deserializer;

- (id)deserialize:(NSString *)inString;

@end
