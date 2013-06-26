//
//  HUDLayer.mm
//  Raycast
//
//  Created by Ray Wenderlich on 8/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HUDLayer.h"


@implementation HUDLayer

- (id)init {
    
    if ((self = [super init])) {
        
        
		
		
		
				
		
		
    }
    return self;
}




- (void) dealloc
{
	[[CCDirector sharedDirector] purgeCachedData];
	[self unscheduleAllSelectors];
	[[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
	[[CCTextureCache sharedTextureCache] removeAllTextures];
	[super dealloc];
}






@end
