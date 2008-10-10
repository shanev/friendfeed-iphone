//
//  CJSONScanner.m
//  CocoaJSON
//
//  Created by Jonathan Wight on 12/07/2005.
//  Copyright 2005 Toxic Software. All rights reserved.
//

#import "CJSONScanner.h"

#import "NSCharacterSet_Extensions.h"
#import "NSScanner_Extensions.h"

inline static int HexToInt(char inCharacter)
{
int theValues[] = { 0x0 /* 48 '0' */, 0x1 /* 49 '1' */, 0x2 /* 50 '2' */, 0x3 /* 51 '3' */, 0x4 /* 52 '4' */, 0x5 /* 53 '5' */, 0x6 /* 54 '6' */, 0x7 /* 55 '7' */, 0x8 /* 56 '8' */, 0x9 /* 57 '9' */, -1 /* 58 ':' */, -1 /* 59 ';' */, -1 /* 60 '<' */, -1 /* 61 '=' */, -1 /* 62 '>' */, -1 /* 63 '?' */, -1 /* 64 '@' */, 0xa /* 65 'A' */, 0xb /* 66 'B' */, 0xc /* 67 'C' */, 0xd /* 68 'D' */, 0xe /* 69 'E' */, 0xf /* 70 'F' */, -1 /* 71 'G' */, -1 /* 72 'H' */, -1 /* 73 'I' */, -1 /* 74 'J' */, -1 /* 75 'K' */, -1 /* 76 'L' */, -1 /* 77 'M' */, -1 /* 78 'N' */, -1 /* 79 'O' */, -1 /* 80 'P' */, -1 /* 81 'Q' */, -1 /* 82 'R' */, -1 /* 83 'S' */, -1 /* 84 'T' */, -1 /* 85 'U' */, -1 /* 86 'V' */, -1 /* 87 'W' */, -1 /* 88 'X' */, -1 /* 89 'Y' */, -1 /* 90 'Z' */, -1 /* 91 '[' */, -1 /* 92 '\' */, -1 /* 93 ']' */, -1 /* 94 '^' */, -1 /* 95 '_' */, -1 /* 96 '`' */, 0xa /* 97 'a' */, 0xb /* 98 'b' */, 0xc /* 99 'c' */, 0xd /* 100 'd' */, 0xe /* 101 'e' */, 0xf /* 102 'f' */, };
if (inCharacter >= '0' && inCharacter <= 'f')
	return(theValues[inCharacter - '0']);
else
	return(-1);
}

@implementation NSScanner (NSScanner_JSONExtensions)

- (BOOL)scanJSONObject:(id *)outObject
{
[self setCharactersToBeSkipped:NULL];
[self setCaseSensitive:YES];

id theObject = NULL;

[self skipJSONWhitespace];

if ([self scanString:@"true" intoString:NULL])
	{
	theObject = [NSNumber numberWithBool:YES];
	}
else if ([self scanString:@"false" intoString:NULL])
	{
	theObject = [NSNumber numberWithBool:NO];
	}
else if ([self scanString:@"null" intoString:NULL])
	{
	theObject = [NSNull null];
	}
else if ([self scanJSONStringConstant:&theObject] == YES)
	{
	}
else if ([self scanJSONNumberConstant:&theObject] == YES)
	{
	}
else if ([self scanJSONDictionary:&theObject] == YES)
	{
	}
else if ([self scanJSONArray:&theObject] == YES)
	{
	}
else if ([self scanJSONTuple:&theObject] == YES)
	{
	}
else
	{
	return(NO);
	}

if (outObject != NULL)
	*outObject = theObject;
return(YES);
}

- (BOOL)scanJSONDictionary:(NSDictionary **)outDictionary;
{
unsigned theScanLocation = [self scanLocation];

[self skipJSONWhitespace];

NSMutableDictionary *theDictionary = [NSMutableDictionary dictionary];

if ([self scanCharacter:'{'] == NO)
	return(NO);

while ([self scanCharacter:'}'] == NO)
	{
	NSString *theKey = NULL;
	if ([self scanJSONStringConstant:&theKey] == NO)
		{
		[self setScanLocation:theScanLocation];
		return(NO);
		}

	[self skipJSONWhitespace];

	if ([self scanCharacter:':'] == NO)
		{
		[self setScanLocation:theScanLocation];
		return(NO);
		}

	id theValue = NULL;
	if ([self scanJSONObject:&theValue] == NO)
		{
		[self setScanLocation:theScanLocation];
		return(NO);
		}

	[theDictionary setValue:theValue forKey:theKey];

	[self skipJSONWhitespace];
	if ([self scanCharacter:','] == NO)
		{
		if ([self currentCharacter] != '}')
			{
			[self setScanLocation:theScanLocation];
			return(NO);
			}
		break;
		}
	else
		{
		[self skipJSONWhitespace];
		if ([self currentCharacter] == '}')
			break;
		}
	}

if ([self scanCharacter:'}'] == NO)
	{
	[self setScanLocation:theScanLocation];
	return(NO);
	}
	
if (outDictionary != NULL)
	*outDictionary = theDictionary;
return(YES);
}

- (BOOL)scanJSONArray:(NSArray **)outArray
{
unsigned theScanLocation = [self scanLocation];

NSMutableArray *theArray = [NSMutableArray array];

[self skipJSONWhitespace];
if ([self scanCharacter:'['] == NO)
	return(NO);

[self skipJSONWhitespace];
while ([self currentCharacter] != ']')
	{
	NSString *theValue = NULL;
	if ([self scanJSONObject:&theValue] == NO)
		{
		[self setScanLocation:theScanLocation];
		return(NO);
		}

	[theArray addObject:theValue];
	
	[self skipJSONWhitespace];
	if ([self scanCharacter:','] == NO)
		{
		[self skipJSONWhitespace];
		if ([self currentCharacter] != ']')
			{
			[self setScanLocation:theScanLocation];
			return(NO);
			}
		
		break;
		}
	[self skipJSONWhitespace];
	}

[self skipJSONWhitespace];

if ([self scanCharacter:']'] == NO)
	{
	[self setScanLocation:theScanLocation];
	return(NO);
	}


if (outArray != NULL)
	*outArray = theArray;
return(YES);
}

- (BOOL)scanJSONTuple:(NSArray **)outArray
{
unsigned theScanLocation = [self scanLocation];

NSMutableArray *theArray = [NSMutableArray array];

[self skipJSONWhitespace];
if ([self scanCharacter:'('] == NO)
	return(NO);

[self skipJSONWhitespace];
while ([self currentCharacter] != ')')
	{
	NSString *theValue = NULL;
	if ([self scanJSONObject:&theValue] == NO)
		{
		[self setScanLocation:theScanLocation];
		return(NO);
		}

	[theArray addObject:theValue];
	
	[self skipJSONWhitespace];
	if ([self scanCharacter:','] == NO)
		{
		[self skipJSONWhitespace];
		if ([self currentCharacter] != ')')
			{
			[self setScanLocation:theScanLocation];
			return(NO);
			}
		
		break;
		}
	[self skipJSONWhitespace];
	}

[self skipJSONWhitespace];

if ([self scanCharacter:')'] == NO)
	{
	[self setScanLocation:theScanLocation];
	return(NO);
	}

if (outArray != NULL)
	*outArray = theArray;
return(YES);
}

- (BOOL)scanJSONStringConstant:(NSString **)outStringConstant
{
unsigned theScanLocation = [self scanLocation];

[self skipJSONWhitespace];

NSCharacterSet *theCharacters = [[NSCharacterSet characterSetWithCharactersInString:@"\\\""] invertedSet];

NSMutableString *theString = [NSMutableString string];

if ([self scanCharacter:'"'] == NO)
	{
	[self setScanLocation:theScanLocation];
	return(NO);
	}

while ([self scanCharacter:'"'] == NO)
	{
	NSString *theStringChunk = NULL;
	if ([self scanCharactersFromSet:theCharacters intoString:&theStringChunk])
		{
		[theString appendString:theStringChunk];
		}
	
	if ([self scanCharacter:'\\'] == YES)
		{
		unichar theCharacter = [self scanCharacter];
		switch (theCharacter)
			{
			case '"':
			case '\\':
			case '/':
				break;
			case 'b':
				theCharacter = '\b';
				break;
			case 'f':
				theCharacter = '\f';
				break;
			case 'n':
				theCharacter = '\n';
				break;
			case 'r':
				theCharacter = '\r';
				break;
			case 't':
				theCharacter = '\t';
				break;
			case 'u':
				{
				theCharacter = 0;

				int theShift;
				for (theShift = 12; theShift >= 0; theShift -= 4)
					{
					int theDigit = HexToInt([self scanCharacter]);
					if (theDigit == -1)
						{
						[self setScanLocation:theScanLocation];
						return(NO);
						}
					theCharacter |= (theDigit << theShift);
					}
				}
				break;
			default:
				[self setScanLocation:theScanLocation];
				return(NO);
				break;
			}
		[theString appendFormat:@"%C", theCharacter];
		}
	}
	
if (outStringConstant != NULL)
	*outStringConstant = theString;

return(YES);
}

- (BOOL)scanJSONNumberConstant:(NSNumber **)outNumberConstant
{
[self skipJSONWhitespace];

double theValue = NAN;
if ([self scanDouble:&theValue] == YES)
	{
	if (outNumberConstant != NULL)
		*outNumberConstant = [NSNumber numberWithDouble:theValue];
	return(YES);
	}
else
	{
	return(NO);
	}
}

- (void)skipJSONWhitespace
{
[self skipWhitespace];
[self scanCStyleComment:NULL];
[self scanCPlusPlusStyleComment:NULL];
[self skipWhitespace];
}

@end
