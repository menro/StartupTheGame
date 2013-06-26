//
//  nextStage1.m
//  Ninjaboy
//
//  Created by Objectsol on 16/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "insPage.h"
#import "SimpleAudioEngine.h"

@implementation insPage


+(id) scene
{
	
	CCScene *scene = [CCScene node];
    
    HUDsound *hud = [HUDsound node];
    [scene addChild:hud z:1];
    
    insPage *layer = [[[insPage alloc] initWithHUD:hud] autorelease];
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
		
		CCSprite *backGround = [CCSprite spriteWithFile:@"instruction.png"];
		backGround.position = ccp(240, 160); 
		
		[self addChild:backGround  z:-2]; 
			
	
		self.isTouchEnabled = YES;
	    
	    scrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(6, 60,279,240)];
	    [scrollView1 setBackgroundColor:[UIColor clearColor]];
	    scrollView1.clipsToBounds = YES;		// default is NO, we want to restrict drawing within our scrollview
	    scrollView1.scrollEnabled = YES;
	    scrollView1.showsHorizontalScrollIndicator=NO;
	    scrollView1.showsVerticalScrollIndicator=NO;
	    scrollView1.pagingEnabled=NO;
	    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"atutorial.png"]];
	    [scrollView1 addSubview:imageView];
	    [scrollView1 setContentSize:CGSizeMake(scrollView1.frame.size.width, imageView.frame.size.height)];
	    [scrollView1 setScrollEnabled:YES];
	    [imageView release];
	    [[[CCDirector sharedDirector]openGLView] addSubview:scrollView1];
			
		/*[self schedule:@selector(particleBubble) interval:1.4];
		[[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"Background.wav"];*/		
        CCMenuItem *starMenuItem14 = [CCMenuItemImage 
								  itemFromNormalImage:@"MainMenuUp.png" selectedImage:@"MainMenuDown.png" 
								  target:self selector:@selector(goToMain)];
	    starMenuItem14.position = ccp(180, 260);
	
	    CCMenu *starMenu14 = [CCMenu menuWithItems:starMenuItem14, nil];
	    starMenu14.position = CGPointZero;
	starMenu14.scale=1.3;
	    [self addChild:starMenu14 z:44];
	/*CCMenuItem *starMenuItem141 = [CCMenuItemImage 
								  itemFromNormalImage:@"playc.png" selectedImage:@"playc.png" 
								  target:self selector:@selector(goToPlay)];
	starMenuItem141.position = ccp(80, 290);
	
	CCMenu *starMenu141 = [CCMenu menuWithItems:starMenuItem141, nil];
	starMenu141.position = CGPointZero;
	
	[self addChild:starMenu141 z:441];*/
	    

}

 

-(void)goToPlay
{
	[scrollView1   removeFromSuperview];
	scrollView1=nil;
	
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[HelloWorld scene]];
	
}	 








-(void)goToMain
{
	[scrollView1   removeFromSuperview];
	scrollView1=nil;
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[menuPage scene]];
	
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
