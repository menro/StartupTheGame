#import "AsyncImageView.h"

@implementation AsyncImageView

- (void)dealloc
{
	[connection cancel]; 
	[connection release];
	[data release]; 
    [super dealloc];
}


- (void)loadImageFromURL:(NSURL*)url
{
	if (connection!=nil) 
	{ 
		[connection release]; 
	} 
	if (data!=nil)
	{ 
		[data release];
	}
	NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
	connection = [[NSURLConnection alloc] initWithRequest:request delegate:self]; 
}


- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)incrementalData
{
	if (data==nil)
	{
		data = [[NSMutableData alloc] initWithCapacity:2048];
	} 
	[data appendData:incrementalData];
}

- (void)connectionDidFinishLoading:(NSURLConnection*)theConnection 
{
	[connection release];
	connection=nil;
	if ([[self subviews] count]>0)
	{
		[[[self subviews] objectAtIndex:0] removeFromSuperview];
	}
	UIImageView* imageView = [[[UIImageView alloc] initWithImage:[UIImage imageWithData:data]] autorelease];
	[self addSubview:imageView];
	imageView.frame = self.bounds;
	[imageView setNeedsLayout];
	[self setNeedsLayout];
	
	[data release];
	data=nil;
}

- (UIImage*) image {
	UIImageView* iv = [[self subviews] objectAtIndex:0];
	return [iv image];
}

@end