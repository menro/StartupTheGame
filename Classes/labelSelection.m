//
//  nextStage1.m
//  Ninjaboy
//
//  Created by Objectsol on 16/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "labelSelection.h"
#import "SimpleAudioEngine.h"

@implementation labelSelection


+(id) scene
{
	
	CCScene *scene = [CCScene node];
    
    HUDsound *hud = [HUDsound node];
    [scene addChild:hud z:1];
    
    labelSelection *layer = [[[labelSelection alloc] initWithHUD:hud] autorelease];
    [scene addChild:layer];
    
    return scene;
}


- (id)initWithHUD:(HUDsound *)hud
{
    if ((self = [super init])) 
	{
		[self startOfGame];
    }
    return self;
}

-(id) startOfGame
{
	// always call "super" init
		
		[[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
		
		[[CCDirector sharedDirector] resume] ;
		
		CCSprite *backGround = [CCSprite spriteWithFile:@"stage 1.png"];
		backGround.position = ccp(240, 160); 
		
		[self addChild:backGround  z:-2]; 
			
	
		self.isTouchEnabled = YES;
	    id delay = [CCDelayTime actionWithDuration:6];
	    id callback = [CCCallFunc actionWithTarget: self selector: @selector(needToStart)];
	    id sequence = [CCSequence actions: delay, callback, nil];
	    [self runAction:sequence];
		
			
		
}

-(void)needToStart
{
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[HelloWorld scene]];
	
}

- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[[CCDirector sharedDirector] purgeCachedData];
	[self unscheduleAllSelectors];
	[[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
	[[CCTextureCache sharedTextureCache] removeAllTextures];
	[super dealloc];
}





@end
