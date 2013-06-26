//
//  HUDLayer.mm
//  Raycast
//
//  Created by Ray Wenderlich on 8/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HUDsound.h"


@implementation HUDsound

- (id)init {
    
    if ((self = [super init])) {
        
        
		//[self pauseCase];
    }
    return self;
}



-(void)pauseCase
{
	
	if(![[SimpleAudioEngine sharedEngine] mute])
	{
		_plusItem = [[CCMenuItemImage itemFromNormalImage:@"sound_on.png" 
											selectedImage:@"sound_on.png" target:nil selector:nil] retain];
		_minusItem = [[CCMenuItemImage itemFromNormalImage:@"sound_off.png" 
											 selectedImage:@"sound_off.png" target:nil selector:nil] retain];
		CCMenuItemToggle *toggleItem = [CCMenuItemToggle itemWithTarget:self 
															   selector:@selector(plusMinusButtonTapped:) items:_plusItem, _minusItem, nil];
		CCMenu *toggleMenu = [CCMenu menuWithItems:toggleItem, nil];
		toggleMenu.position = ccp(445, 285);
		[self addChild:toggleMenu z:142];
	}
	else
	{
		_plusItem = [[CCMenuItemImage itemFromNormalImage:@"sound_on.png" 
											selectedImage:@"sound_on.png" target:nil selector:nil] retain];
		_minusItem= [[CCMenuItemImage itemFromNormalImage:@"sound_off.png" 
											selectedImage:@"sound_off.png" target:nil selector:nil] retain];
		CCMenuItemToggle *toggleItem = [CCMenuItemToggle itemWithTarget:self 
															   selector:@selector(plusMinusButtonTapped:) items:_minusItem, _plusItem, nil];
		CCMenu *toggleMenu = [CCMenu menuWithItems:toggleItem, nil];
		toggleMenu.position = ccp(445, 285);
		[self addChild:toggleMenu z:142];
	}
	
}


- (void)plusMinusButtonTapped:(id)sender {  
	if ([[SimpleAudioEngine sharedEngine] mute]) 
	{
		// This will unmute the sound
		[[SimpleAudioEngine sharedEngine] setMute:0];
		
		
		
	}
	
	else 
	{
		//This will mute the sound
		[[SimpleAudioEngine sharedEngine] setMute:1];
	}
	
	
}

-(void)restart
{
	[self checking];
	[[CCDirector sharedDirector] pause] ;
	
	[[CCDirector sharedDirector] replaceScene:[HelloWorld scene]];
	
}



-(void)mainMenuGo
{
	[self checking];
	[[CCDirector sharedDirector] pause] ;
	
	[[CCDirector sharedDirector] replaceScene:[menuPage scene]];
    
}


-(void)checking
{
	//[[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"sound"];
	//[[NSUserDefaults standardUserDefaults] synchronize];
int yy = [[NSUserDefaults standardUserDefaults] integerForKey:@"sound"];
	if(yy==1)
			[[SimpleAudioEngine sharedEngine] setMute:1];
	else
			[[SimpleAudioEngine sharedEngine] setMute:0];
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
