//
//  CJSONScanner.h
//  CocoaJSON
//
//  Created by Jonathan Wight on 12/07/2005.
//  Copyright 2005 Toxic Software. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSScanner (NSScanner_JSONExtensions)

- (BOOL)scanJSONObject:(id *)outObject;
- (BOOL)scanJSONDictionary:(NSDictionary **)outDictionary;
- (BOOL)scanJSONArray:(NSArray **)outArray;
- (BOOL)scanJSONTuple:(NSArray **)outArray;
- (BOOL)scanJSONStringConstant:(NSString **)outStringConstant;
- (BOOL)scanJSONNumberConstant:(NSNumber **)outNumberConstant;
- (void)skipJSONWhitespace;

@end
