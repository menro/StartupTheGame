//
//  nextStage1.m
//  Ninjaboy
//
//  Created by Objectsol on 16/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "labelSelection2.h"
#import "SimpleAudioEngine.h"

@implementation labelSelection2


+(id) scene
{
	
	CCScene *scene = [CCScene node];
    
    HUDsound *hud = [HUDsound node];
    [scene addChild:hud z:1];
    
    labelSelection2 *layer = [[[labelSelection2 alloc] initWithHUD:hud] autorelease];
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

-(void) startOfGame
{
	// always call "super" init
	
	[[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
	
	[[CCDirector sharedDirector] resume] ;
	[[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"sound"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	
	[[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"music"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	CCSprite *backGround = [CCSprite spriteWithFile:@"newAdd.png"];
	backGround.position = ccp(240, 160); 
	
	[self addChild:backGround  z:-2]; 
	
	CCMenuItem *starMenuItem11 = [CCMenuItemImage 
								  itemFromNormalImage:@"addPlay.png" selectedImage:@"addPlay.png" 
								  target:self selector:@selector(showAdd)];
	starMenuItem11.position = ccp(234, 109);
	
	CCMenu *starMenu11 = [CCMenu menuWithItems:starMenuItem11, nil];
	//starMenu11.opacity=0;
	//starMenu11.scale=2;
	starMenu11.position = CGPointZero;
	
	[self addChild:starMenu11 z:44];
	
	
	CCMenuItem *starMenuItem5 = [CCMenuItemImage 
								 itemFromNormalImage:@"addClose.png" selectedImage:@"addClose.png" 
								 target:self selector:@selector(needToStart)];
	starMenuItem5.position = ccp(328, 235);
	
	CCMenu *starMenu5 = [CCMenu menuWithItems:starMenuItem5, nil];
	starMenu5.position = CGPointZero;
	starMenu5.opacity=0;
	[self addChild:starMenu5 z:44];
	
	
	
    
}



-(void)showAdd
{
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://bit.ly/openspacestore"]];
	
}








-(void)needToStart
{
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[menuPage scene]];
	
}

- (void) dealloc
{
	
	[[CCDirector sharedDirector] purgeCachedData];
	[self unscheduleAllSelectors];
	[[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
	[[CCTextureCache sharedTextureCache] removeAllTextures];	[super dealloc];
}





@end
