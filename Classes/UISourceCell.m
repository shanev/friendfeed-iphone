//
//  UISourceCell.m
//  FriendFeed
//
//  Created by Shane Vitarana on 4/7/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "UISourceCell.h"

#import "Constants.h"

@implementation UISourceCell

@synthesize sourceLabel;

- (id)initWithFrame:(CGRect)aRect
{
	if (self = [super initWithFrame:aRect])
	{
		// turn off selection use
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		
		sourceLabel = [[UILabel alloc] initWithFrame:aRect];
		sourceLabel.backgroundColor = [UIColor clearColor];
		sourceLabel.opaque = NO;
		sourceLabel.textAlignment = UITextAlignmentCenter;
		sourceLabel.textColor = [UIColor grayColor];
		sourceLabel.highlightedTextColor = [UIColor blackColor];
		sourceLabel.font = [UIFont systemFontOfSize:12];
		[self addSubview:sourceLabel];
	}
	return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
	//sourceLabel.frame = [self contentRectForBounds:self.bounds];
	sourceLabel.frame = self.contentView.bounds;
}

- (void)dealloc
{
	[sourceLabel release];
	
    [super dealloc];
}

@end
