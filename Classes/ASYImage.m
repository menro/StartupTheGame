#import "ASYImage.h"

@implementation ASYImage
@synthesize  myImageLoaded;
@synthesize connection;

@synthesize height,width;

- (void)dealloc {
	[connection cancel]; 
	[connection release];
	[data release]; 
    [super dealloc];
}


- (void)loadImageFromURL:(NSURL*)url indicator:(UIActivityIndicatorView *)activeIndicator 
{
	if (connection!=nil)
	{ 
		[connection cancel];
		[connection release];
	} 
	if (data!=nil) 
	{ 
		[data release];
	}
	networkIndicator=activeIndicator;
	NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
	connection = [[NSURLConnection alloc] initWithRequest:request delegate:self]; 
}

- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)incrementalData {
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
	if(networkIndicator)
	{
		[networkIndicator stopAnimating];
	}
	
	UIImageView* imageView = [[[UIImageView alloc] initWithImage:[UIImage imageWithData:data]] autorelease];
	//Modify by Ashim
	/*UIImage *img = [UIImage imageWithData:data];
	NSLog(@"Height = %f",img.size.height);
	NSLog(@"WIDTH = %f",img.size.width);
	self.height = img.size.height;
	self.width = img.size.width;
	//
	/*if(app.acpectratio)
	{
		imageView.contentMode = UIViewContentModeScaleAspectFit;
	}*/
	imageView.autoresizingMask = ( UIViewAutoresizingFlexibleWidth || UIViewAutoresizingFlexibleHeight );
	
	[self addSubview:imageView];
	//self.bounds = CGRectMake(0, 0, self.width, self.height);
	imageView.frame = self.bounds;
	[imageView setNeedsLayout];
	[self setNeedsLayout];
	myImageLoaded=imageView.image;
	[data release]; 
	data=nil;
}
- (void)connection:(NSURLConnection *)theConnection didFailWithError:(NSError *)error
{
	[connection release];
	connection=nil;
	if ([[self subviews] count]>0)
	{
		[[[self subviews] objectAtIndex:0] removeFromSuperview];
	}
	if(networkIndicator)
	{
		[networkIndicator stopAnimating];
	}
	
	UILabel *lblError=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
	lblError.numberOfLines=0;
	lblError.font=[UIFont fontWithName:@"Helvetica-Bold" size:8];
	lblError.text=@"Problem in Loading Image";
	lblError.backgroundColor=[UIColor clearColor];
	lblError.textColor=[UIColor whiteColor];
	lblError.textAlignment=UITextAlignmentCenter;
	lblError.numberOfLines=0;
	[lblError setNeedsLayout];
	[self setNeedsLayout];
	[self addSubview:lblError];
	[lblError release];
}

- (UIImage*) image {
	UIImageView* iv = [[self subviews] objectAtIndex:0];
	myImageLoaded=[iv image];
	return myImageLoaded;
}


@end
