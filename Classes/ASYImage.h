//
//  ASYImage.h
//  newMillionaire
//
//  Created by Sumit Prasad on 12/12/09.
//  Copyright 2009 Objectsol Technologes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASYImage : UIView 
{
	NSURLConnection* connection;
    NSMutableData* data;
	UIImage* myImageLoaded;
	UIActivityIndicatorView *networkIndicator;
	
	CGFloat height;
	CGFloat width;
}

@property (nonatomic, retain) NSURLConnection* connection;
@property (nonatomic, retain) UIImage* myImageLoaded;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat width;
- (void)loadImageFromURL:(NSURL*)url indicator:(UIActivityIndicatorView *)activeIndicator;
- (UIImage*) image;


@end
