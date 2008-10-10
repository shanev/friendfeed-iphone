//
//  UICellTextView.m
//  FriendFeed
//
//  Created by Shane Vitarana on 4/7/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "UICellTextView.h"
#import "Constants.h"

@implementation UICellTextView

@synthesize view;

- (id)initWithFrame:(CGRect)aRect
{
	if (self = [super initWithFrame:aRect])
	{
		// turn off selection use
		self.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	return self;
}

- (void)setView:(UITextView *)inView
{
	view = inView;
	[self.view retain];
	[self addSubview:inView];
	[self layoutSubviews];
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
	//CGRect contentRect = [self contentRectForBounds:self.bounds];
	CGRect contentRect = self.contentView.bounds;
	
	// In this example we will never be editing, but this illustrates the appropriate pattern
	CGRect frame = CGRectMake(	contentRect.origin.x + 8.0,
								contentRect.origin.y + 8.0,
								contentRect.size.width - 16.0,
								contentRect.size.height - 16.0);
	self.view.frame  = frame;
}

- (void)dealloc
{
    [view release];
    [super dealloc];
}

@end
