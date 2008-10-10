//
//  DetailViewController.m
//  FriendFeed
//
//  Created by Shane Vitarana on 4/6/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "UICellTextView.h"
#import "Constants.h"
#import "UISourceCell.h"

@implementation DetailViewController

@synthesize feedItem;
@synthesize myTableView;

- (id)init
{
	if (self = [super init]) {
		// Initialize your view controller.
		//self.title = [NSString ];
	}
	return self;
}


- (void)loadView
{
	// create and configure the table view
	myTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStyleGrouped];	
	myTableView.delegate = self;
	myTableView.dataSource = self;
	myTableView.rowHeight = 60.0;
	myTableView.scrollEnabled = NO;
	self.view = myTableView;

	self.view.autoresizesSubviews = YES;
}

- (UITextView *)create_UITextView
{
	CGRect frame = CGRectMake(0.0, 0.0, 100.0, 100.0);

	//TODO: use a UIWebView to render HTML with links??
	
	UITextView *textView = [[[UITextView alloc] initWithFrame:frame] autorelease];
    textView.textColor = [UIColor blackColor];
    textView.font = [UIFont fontWithName:kFontName size:kTextViewFontSize];
    textView.delegate = self;
    textView.backgroundColor = [UIColor whiteColor];
	
	textView.text = feedItem.title;
	textView.returnKeyType = UIReturnKeyDefault;
	textView.keyboardType = UIKeyboardTypeDefault;	// use the default type input method (entire keyboard)
	
	// note: for UITextView, if you don't like autocompletion while typing use:
	// myTextView.autocorrectionType = UITextAutocorrectionTypeNo;
	
	return textView;
}


#pragma mark UITextView delegate methods

- (void)textViewDidBeginEditing:(UITextView *)textView
{
	// provide my own Save button to dismiss the keyboard
	UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[saveButton addTarget:self action:@selector(saveAction:) forControlEvents:UIControlEventTouchUpInside];
	[saveButton setTitle:NSLocalizedString(@"Save", @"") forStates:UIControlStateNormal];
	UINavigationItem *navItem = self.navigationItem;
	navItem.rightBarButtonItem.customView = saveButton;
}

- (void)saveAction:(id)sender
{
	// finish typing text/dismiss the keyboard by removing it as the first responder
	
	UITableViewCell *cell = [myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];

	[((UICellTextView*)cell).view resignFirstResponder];
	UINavigationItem *navItem = self.navigationItem;
	navItem.rightBarButtonItem.customView.hidden = YES;
}


#pragma mark - UITableView delegates

// if you want the entire table to just be re-orderable then just return UITableViewCellEditingStyleNone
//
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellEditingStyleNone;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	NSString *label = [NSString stringWithFormat:@"%@ on %@", feedItem.nickName, feedItem.serviceName];
	return label;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [feedItem.comments count] + 1;
}

// to determine specific row height for each cell, override this.  In this example, each row is determined
// buy the its subviews that are embedded.
//
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	CGFloat result;
	
	switch ([indexPath row])
	{
		case 0:
		{
			result = 155.0;
			break;
		}
		default:
		{
			result = kUIRowLabelHeight;
			break;
		}
	}

	return result;
}

// utility routine leveraged by 'cellForRowAtIndexPath' to determine which UITableViewCell to be used on a given row.
//
- (UITableViewCell *)obtainTableCell:(UITableViewCell *)availableCell forRow:(NSInteger)row
{
	UITableViewCell *cell;
	
	if (availableCell != nil)
	{
		// Use the existing cell if it's there
		cell = availableCell;
	}
	else
	{
		if (row == 0)
		{
			cell = [[UICellTextView alloc] initWithFrame:CGRectZero];
		}
		else
		{
			cell = [[UISourceCell alloc] initWithFrame:CGRectZero];
		}
	}
	return cell;
}

// to determine which UITableViewCell to be used on a given row.
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	int row = [indexPath row];
	UITableViewCell *cell = nil;
	
	// we are creating a new cell, setup its attributes
	if (row == 0)
	{
		// this cell hosts the UISwitch control
		((UICellTextView*)cell).view = [self create_UITextView];
	}
	else
	{
		int commentIndex = row - 1;
		NSMutableString *comment = [[feedItem.comments objectAtIndex:commentIndex] objectForKey:@"body"];
		((UISourceCell*)cell).sourceLabel.text = comment;
		
	}
	return cell;
}

- (void)dealloc
{
	[myTableView dealloc];
	[feedItem dealloc];
	[super dealloc];
}


@end
