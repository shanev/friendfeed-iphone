//
//  FeedItemTableViewCell.m
//  FriendFeed
//
//  Created by Shane Vitarana on 4/2/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "FeedItemTableViewCell.h"

static UIImage *amazonImage = nil;
static UIImage *blogImage = nil;
static UIImage *deliciousImage = nil;
static UIImage *diggImage = nil;
static UIImage *disqusImage = nil;
static UIImage *flickrImage = nil;
static UIImage *furlImage = nil;
static UIImage *googletalkImage = nil;
static UIImage *goodreadsImage = nil;
static UIImage *readerImage = nil;
static UIImage *googleImage = nil;
static UIImage *ilikeImage = nil;
static UIImage *jaikuImage = nil;
static UIImage *lastfmImage = nil;
static UIImage *libraryThingImage = nil;
static UIImage *linkedInImage = nil;
static UIImage *magnoliaImage = nil;
static UIImage *netflixImage = nil;
static UIImage *pandoraImage = nil;
static UIImage *picasaImage = nil;
static UIImage *pownceImage = nil;
static UIImage *redditImage = nil;
static UIImage *seesmicImage = nil;
static UIImage *slideshareImage = nil;
static UIImage *smugmugImage = nil;
static UIImage *stumbleuponImage = nil;
static UIImage *tumblrImage = nil;
static UIImage *twitterImage = nil;
static UIImage *upcomingImage = nil;
static UIImage *vimeoImage = nil;
static UIImage *yelpImage = nil;
static UIImage *youtubeImage = nil;
static UIImage *zoomrImage = nil;
static UIImage *friendFeedImage = nil;

@implementation FeedItemTableViewCell

@synthesize feedItem;

+ (void)initialize
{
    twitterImage = [[UIImage imageNamed:@"twitter.png"] retain];
    blogImage = [[UIImage imageNamed:@"blog.png"] retain];
    deliciousImage = [[UIImage imageNamed:@"delicious.png"] retain];
    diggImage = [[UIImage imageNamed:@"digg.png"] retain];
    googletalkImage = [[UIImage imageNamed:@"googletalk.png"] retain];
    lastfmImage = [[UIImage imageNamed:@"lastfm.png"] retain];
    amazonImage = [[UIImage imageNamed:@"amazon.png"] retain];
    disqusImage = [[UIImage imageNamed:@"disqus.png"] retain];
    flickrImage = [[UIImage imageNamed:@"flickr.png"] retain];
    furlImage = [[UIImage imageNamed:@"furl.png"] retain];
    goodreadsImage = [[UIImage imageNamed:@"goodreads.png"] retain];
    readerImage = [[UIImage imageNamed:@"googlereader.png"] retain];
    googleImage = [[UIImage imageNamed:@"googleshared.png"] retain];
    ilikeImage = [[UIImage imageNamed:@"ilike.png"] retain];
    jaikuImage = [[UIImage imageNamed:@"jaiku.png"] retain];
    libraryThingImage = [[UIImage imageNamed:@"librarything.png"] retain];
    linkedInImage = [[UIImage imageNamed:@"linkedin.png"] retain];
    magnoliaImage = [[UIImage imageNamed:@"magnolia.png"] retain];
    netflixImage = [[UIImage imageNamed:@"netflix.png"] retain];
    pandoraImage = [[UIImage imageNamed:@"pandora.png"] retain];
    picasaImage = [[UIImage imageNamed:@"picasa.png"] retain];
    pownceImage = [[UIImage imageNamed:@"pownce.png"] retain];
    redditImage = [[UIImage imageNamed:@"reddit.png"] retain];
    seesmicImage = [[UIImage imageNamed:@"seesmic.png"] retain];
    smugmugImage = [[UIImage imageNamed:@"smugmug.png"] retain];
    stumbleuponImage = [[UIImage imageNamed:@"stumbleupon.png"] retain];
    slideshareImage = [[UIImage imageNamed:@"slideshare.png"] retain];
    tumblrImage = [[UIImage imageNamed:@"tumblr.png"] retain];
    upcomingImage = [[UIImage imageNamed:@"upcoming.png"] retain];
    vimeoImage = [[UIImage imageNamed:@"vimeo.png"] retain];
    yelpImage = [[UIImage imageNamed:@"yelp.png"] retain];
    zoomrImage = [[UIImage imageNamed:@"zoomr.png"] retain];
    friendFeedImage = [[UIImage imageNamed:@"internal.png"] retain];
}	

- (UIImage *)imageForService:(NSString *)service
{
	if ([service isEqualToString:@"twitter"]) {
		return twitterImage;
	}
	if ([service isEqualToString:@"blog"]) {
		return blogImage;
	}
	if ([service isEqualToString:@"delicious"]) {
		return deliciousImage;
	}
	if ([service isEqualToString:@"digg"]) {
		return diggImage;
	}
	if ([service isEqualToString:@"googletalk"]) {
		return googletalkImage;
	}
	if ([service isEqualToString:@"lastfm"]) {
		return lastfmImage;
	}
	if ([service isEqualToString:@"youtube"]) {
		return youtubeImage;
	}
	if ([service isEqualToString:@"amazon"]) {
		return amazonImage;
	}
	if ([service isEqualToString:@"disqus"]) {
		return disqusImage;
	}
	if ([service isEqualToString:@"flickr"]) {
		return flickrImage;
	}
	if ([service isEqualToString:@"furl"]) {
		return furlImage;
	}
	if ([service isEqualToString:@"goodreads"]) {
		return goodreadsImage;
	}
	if ([service isEqualToString:@"googlereader"]) {
		return readerImage;
	}
	if ([service isEqualToString:@"googleshared"]) {
		return googleImage;
	}
	if ([service isEqualToString:@"ilike"]) {
		return ilikeImage;
	}
	if ([service isEqualToString:@"jaiku"]) {
		return jaikuImage;
	}
	if ([service isEqualToString:@"librarything"]) {
		return libraryThingImage;
	}
	if ([service isEqualToString:@"linkedin"]) {
		return linkedInImage;
	}
	if ([service isEqualToString:@"magnolia"]) {
		return magnoliaImage;
	}
	if ([service isEqualToString:@"netflix"]) {
		return netflixImage;
	}
	if ([service isEqualToString:@"pandora"]) {
		return pandoraImage;
	}
	if ([service isEqualToString:@"picasa"]) {
		return picasaImage;
	}
	if ([service isEqualToString:@"pownce"]) {
		return pownceImage;
	}
	if ([service isEqualToString:@"reddit"]) {
		return redditImage;
	}
	if ([service isEqualToString:@"seesmic"]) {
		return seesmicImage;
	}
	if ([service isEqualToString:@"smugmug"]) {
		return smugmugImage;
	}
	if ([service isEqualToString:@"stumbleupon"]) {
		return stumbleuponImage;
	}
	if ([service isEqualToString:@"slideshare"]) {
		return slideshareImage;
	}
	if ([service isEqualToString:@"tumblr"]) {
		return tumblrImage;
	}
	if ([service isEqualToString:@"upcoming"]) {
		return upcomingImage;
	}
	if ([service isEqualToString:@"vimeo"]) {
		return vimeoImage;
	}
	if ([service isEqualToString:@"yelp"]) {
		return yelpImage;
	}
	if ([service isEqualToString:@"zoomr"]) {
		return zoomrImage;
	}
	if ([service isEqualToString:@"internal"]) {
		return friendFeedImage;
	}
	return nil;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)drawRect:(CGRect)rect {

	NSString *nickname = [feedItem nickName];
	NSString *serviceId = [feedItem serviceId];
	NSString *serviceName = [feedItem serviceName];
	NSArray *comments = [feedItem comments];
	NSInteger commentCount = [comments count];
	//NSLog(@"comment count: %d", commentCount);
	
	NSString *title = [feedItem title];
	NSData *asciiData = [title dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *asciiTitle = [[NSString alloc] initWithData:asciiData encoding:NSASCIIStringEncoding];	
	//NSLog(@"Original: %@ (length %d)", title, [title length]);
	//NSLog(@"Converted: %@ (length %d)", asciiTitle, [asciiTitle length]);

	UIImage *serviceImage = [self imageForService:serviceId];
	NSString *line1 = [NSString localizedStringWithFormat: @"%@ on %@", nickname, serviceName];

	//CGRect contentRect = [self contentRectForBounds:self.bounds];

	CGRect contentRect = self.contentView.bounds;
	
	UIImage *backgroundImage = [UIImage imageNamed:@"logo-small.png"];
    CGRect elementSymbolRectangle = CGRectMake(75,7, [backgroundImage size].width, [backgroundImage size].height);
    [backgroundImage drawInRect:elementSymbolRectangle];
    
	[serviceImage drawAtPoint:CGPointMake(4,14)];	
	CGRect line1Rect = CGRectMake(contentRect.origin.x + 26, contentRect.origin.y, contentRect.size.width, contentRect.size.height);	
	[line1 drawInRect:line1Rect withFont:[UIFont systemFontOfSize:12]];
	CGRect feedItemTitleRec = CGRectMake(contentRect.origin.x + 26, contentRect.origin.y + 14, contentRect.size.width - 20, contentRect.size.height);
	[asciiTitle drawInRect:(CGRect)feedItemTitleRec withFont:[UIFont systemFontOfSize:12] lineBreakMode:UILineBreakModeWordWrap alignment:UITextAlignmentLeft];

    [super drawRect:rect];
}

@end
