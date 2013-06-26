//
//  nextStage1.m
//  Ninjaboy
//
//  Created by Objectsol on 16/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "menuPage.h"
#import "SimpleAudioEngine.h"
#import "openspaceAppDelegate.h"

@implementation menuPage



+(id) scene
{
	
	CCScene *scene = [CCScene node];
    
    HUDsound *hud = [HUDsound node];
    [scene addChild:hud z:1];
    
    menuPage *layer = [[[menuPage alloc] initWithHUD:hud] autorelease];
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
	
//	[SHKTwitter logout];
	
	    
		[[CCDirector sharedDirector] resume] ;
		[[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
		CCSprite *backGround = [CCSprite spriteWithFile:@"mainmenuCase.png"];
		backGround.position = ccp(240, 160); 
		
		[self addChild:backGround  z:-2]; 
	    CCSprite *backGroundT = [CCSprite spriteWithFile:@"whitescreen.png"];
     	backGroundT.position = ccp(240, 160); 
	
	    [self addChild:backGroundT  z:-5]; 
	
	    scroll= [CCSprite spriteWithFile:@"starta1.png"];
    	scroll.position = ccp(132, -10); 
	
	   [self addChild:scroll  z:-4];
			
		CCMenuItem *starMenuItem11 = [CCMenuItemImage 
									  itemFromNormalImage:@"StartButtonUp.png" selectedImage:@"StartButtonDown.png" 
									  target:self selector:@selector(needToStart2)];
		starMenuItem11.position = ccp(60, 280);
		
		CCMenu *starMenu11 = [CCMenu menuWithItems:starMenuItem11, nil];
		starMenu11.position = CGPointZero;
		[self addChild:starMenu11 z:44];
		
		CCMenuItem *starMenuItem12 = [CCMenuItemImage 
									  itemFromNormalImage:@"othergame75.png" selectedImage:@"othergamesak.png" 
									  target:self selector:@selector(otherGamesCase)];
		starMenuItem12.position = ccp(70, 20);
		
		CCMenu *starMenu12 = [CCMenu menuWithItems:starMenuItem12, nil];
		starMenu12.position = CGPointZero;
	    starMenu12.scale=1.04;
		[self addChild:starMenu12 z:44];

		self.isTouchEnabled =YES;
		CCMenuItem *starMenuItem14 = [CCMenuItemImage 
									  itemFromNormalImage:@"tutorial75.png" selectedImage:@"tutorialak.png" 
									  target:self selector:@selector(tutorialPage)];
		starMenuItem14.position = ccp(186, 20);
		
		CCMenu *starMenu14 = [CCMenu menuWithItems:starMenuItem14, nil];
		starMenu14.position = CGPointZero;
	     starMenu14.scale=1.04;
		[self addChild:starMenu14 z:44];
	
	GameKitHelper* gkHelper = [GameKitHelper sharedGameKitHelper];
	gkHelper.delegate = self;
	[gkHelper authenticateLocalPlayer];
	
	CCMenuItem *starMenuItem121 = [CCMenuItemImage 
								  itemFromNormalImage:@"leaderdown75.png" selectedImage:@"leaderUp100.png" 
								  target:self selector:@selector(leaderBoardShowing)];
	starMenuItem121.position = ccp(320, 15);
	
	CCMenu *starMenu121 = [CCMenu menuWithItems:starMenuItem121, nil];
	starMenu121.position = CGPointZero;
	[self addChild:starMenu121 z:44];
	
	
	CCMenuItem *starMenuItem141 = [CCMenuItemImage 
								  itemFromNormalImage:@"about75.png" selectedImage:@"aboutak.png" 
								  target:self selector:@selector(aboutPage)];
	starMenuItem141.position = ccp(430, 20);
	
	CCMenu *starMenu141 = [CCMenu menuWithItems:starMenuItem141, nil];
	starMenu141.position = CGPointZero;
	starMenu141.scale=1.04;
	[self addChild:starMenu141 z:44];
			
   	
	
	[self musicCase];
	
	[self soundCase];
}


-(void)leaderBoardShowing
{
	
	openspaceAppDelegate* appDelegate = (openspaceAppDelegate*)([UIApplication sharedApplication].delegate);
	[appDelegate showLeaderboard];
}


-(void)soundCase
{
	int yy = [[NSUserDefaults standardUserDefaults] integerForKey:@"sound"];
	if(yy==0)
	{
		_plusItem = [[CCMenuItemImage itemFromNormalImage:@"sound-on.png" 
											selectedImage:@"sound-on.png" target:nil selector:nil] retain];
		_minusItem = [[CCMenuItemImage itemFromNormalImage:@"sound-off.png" 
											 selectedImage:@"sound-off.png" target:nil selector:nil] retain];
		CCMenuItemToggle *toggleItem = [CCMenuItemToggle itemWithTarget:self 
															   selector:@selector(plusMinusButtonTapped:) items:_plusItem, _minusItem, nil];
		CCMenu *toggleMenu = [CCMenu menuWithItems:toggleItem, nil];
		toggleMenu.position = ccp(95, 235);
		[self addChild:toggleMenu z:142];
	}
	else
	{
		_plusItem = [[CCMenuItemImage itemFromNormalImage:@"sound-on.png" 
											selectedImage:@"sound-on.png" target:nil selector:nil] retain];
		_minusItem= [[CCMenuItemImage itemFromNormalImage:@"sound-off.png" 
											selectedImage:@"sound-off.png" target:nil selector:nil] retain];
		CCMenuItemToggle *toggleItem = [CCMenuItemToggle itemWithTarget:self 
															   selector:@selector(plusMinusButtonTapped:) items:_minusItem, _plusItem, nil];
		CCMenu *toggleMenu = [CCMenu menuWithItems:toggleItem, nil];
		toggleMenu.position = ccp(95, 235);
		[self addChild:toggleMenu z:142];
	}
	
}

- (void)plusMinusButtonTapped:(id)sender {  
	if ([[SimpleAudioEngine sharedEngine] mute]) 
	{
		// This will unmute the sound
		[[SimpleAudioEngine sharedEngine] setMute:0];
		
		[[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"sound"];
		[[NSUserDefaults standardUserDefaults] synchronize];
		
		
	}
	
	else 
	{
		//This will mute the sound
		[[SimpleAudioEngine sharedEngine] setMute:1];
		[[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"sound"];
		[[NSUserDefaults standardUserDefaults] synchronize];

	}
	
	
}
- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	//[scroll stopAllActions];
}
- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint point1 = [touch previousLocationInView: [touch view]];

	CCSprite * player1 = [CCSprite spriteWithFile:@"Icon.png"];
	
	player1.position = ccp(point1.x,point1.y);
	player1.scale=.1;
	//player.anchorPoint = ccp(.5,0);
	[self addChild:player1];
	if (CGRectIntersectsRect([scroll boundingBox], [player1 boundingBox]))
	 {
	  [scroll stopAllActions];
	 }
	[self removeChild:player1 cleanup:YES];
	
	player1=nil;
}
- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint point1 = [touch previousLocationInView: [touch view]];
    CGPoint point = [touch locationInView: [touch view]];
	CGPoint translation = ccpSub(point1, point);   
	CCSprite * player1 = [CCSprite spriteWithFile:@"Icon.png"];
	
	player1.position = ccp(point1.x,point1.y);
	player1.scale=.1;
	//player.anchorPoint = ccp(.5,0);
	[self addChild:player1];
	if (CGRectIntersectsRect([scroll boundingBox], [player1 boundingBox]))
	{
	if(point1.y>point.y)
	{
		
		
		[scroll stopAllActions];
		// self.isTouchEnabled = NO;
		[self caseForTouchUp];
		
	}
	
	else if	(point.y>point1.y)
	{
		[scroll stopAllActions];
		
		// self.isTouchEnabled = NO;
		[self caseForTouchDown];
		
	}
	}
	[self removeChild:player1 cleanup:YES];
	
	player1=nil;
	
}

-(void)caseForTouchUp
{
	
	[scroll runAction:[CCMoveTo actionWithDuration:1 position:ccp(scroll.position.x,280)]];
		
}



-(void)caseForTouchDown
{
	[scroll runAction:[CCMoveTo actionWithDuration:1 position:ccp(scroll.position.x,-10)]];
	
}



-(void)musicCase
{
	int yy = [[NSUserDefaults standardUserDefaults] integerForKey:@"music"];
	if(yy==1)
	{
		_plusItem1 = [[CCMenuItemImage itemFromNormalImage:@"music-on.png" 
											selectedImage:@"music-on.png" target:nil selector:nil] retain];
		_minusItem1 = [[CCMenuItemImage itemFromNormalImage:@"music-off.png" 
											 selectedImage:@"music-off.png" target:nil selector:nil] retain];
		CCMenuItemToggle *toggleItem1 = [CCMenuItemToggle itemWithTarget:self 
															   selector:@selector(plusMinusButtonTapped1:) items:_plusItem1, _minusItem1, nil];
		CCMenu *toggleMenu1 = [CCMenu menuWithItems:toggleItem1, nil];
		toggleMenu1.position = ccp(95, 200);
		[self addChild:toggleMenu1 z:142];
	}
	else
	{
		_plusItem1 = [[CCMenuItemImage itemFromNormalImage:@"music-on.png" 
											selectedImage:@"music-on.png" target:nil selector:nil] retain];
		_minusItem1= [[CCMenuItemImage itemFromNormalImage:@"music-off.png" 
											selectedImage:@"music-off.png" target:nil selector:nil] retain];
		CCMenuItemToggle *toggleItem1 = [CCMenuItemToggle itemWithTarget:self 
															   selector:@selector(plusMinusButtonTapped1:) items:_minusItem1, _plusItem1, nil];
		CCMenu *toggleMenu1 = [CCMenu menuWithItems:toggleItem1, nil];
		toggleMenu1.position = ccp(95, 200);
		[self addChild:toggleMenu1 z:142];
	}
	
}


- (void)plusMinusButtonTapped1:(id)sender { 
	int yy = [[NSUserDefaults standardUserDefaults] integerForKey:@"music"];
	if (yy==1) 
	{
		// This will unmute the sound
		
		[[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"music"];
		[[NSUserDefaults standardUserDefaults] synchronize];

		
		
		
	}
	
	else 
	{
		//This will mute the sound
		[[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"music"];
		[[NSUserDefaults standardUserDefaults] synchronize];
	}
	
	
}


-(void) onLocalPlayerAuthenticationChanged
{
	GKLocalPlayer* localPlayer = [GKLocalPlayer localPlayer];
	CCLOG(@"LocalPlayer isAuthenticated changed to: %@", localPlayer.authenticated ? @"YES" : @"NO");
	
	if (localPlayer.authenticated)
	{
		GameKitHelper* gkHelper = [GameKitHelper sharedGameKitHelper];
		[gkHelper getLocalPlayerFriends];
		//[gkHelper resetAchievements];
	}	
}

-(void) onFriendListReceived:(NSArray*)friends
{
	CCLOG(@"onFriendListReceived: %@", [friends description]);
	GameKitHelper* gkHelper = [GameKitHelper sharedGameKitHelper];
	[gkHelper getPlayerInfo:friends];
}

-(void) onPlayerInfoReceived:(NSArray*)players
{
	CCLOG(@"onPlayerInfoReceived: %@", [players description]);
	GameKitHelper* gkHelper = [GameKitHelper sharedGameKitHelper];
	[gkHelper submitScore:1234 category:@"Playtime"];
	
	//[gkHelper showLeaderboard];
	
	GKMatchRequest* request = [[[GKMatchRequest alloc] init] autorelease];
	request.minPlayers = 2;
	request.maxPlayers = 4;
	
	//GameKitHelper* gkHelper = [GameKitHelper sharedGameKitHelper];
	[gkHelper showMatchmakerWithRequest:request];
	[gkHelper queryMatchmakingActivity];
}

////////////////////////===================================================

-(void) onScoresSubmitted:(bool)success
{
	CCLOG(@"onScoresSubmitted: %@", success ? @"YES" : @"NO");
}

-(void) onScoresReceived:(NSArray*)scores
{
	CCLOG(@"onScoresReceived: %@", [scores description]);
}

-(void) onAchievementReported:(GKAchievement*)achievement
{
	CCLOG(@"onAchievementReported: %@", achievement);
}

-(void) onAchievementsLoaded:(NSDictionary*)achievements
{
	CCLOG(@"onLocalPlayerAchievementsLoaded: %@", [achievements description]);
}

-(void) onResetAchievements:(bool)success
{
	CCLOG(@"onResetAchievements: %@", success ? @"YES" : @"NO");
}

-(void) onLeaderboardViewDismissed
{
	CCLOG(@"onLeaderboardViewDismissed");
}

-(void) onAchievementsViewDismissed
{
	CCLOG(@"onAchievementsViewDismissed");
}

-(void) onReceivedMatchmakingActivity:(NSInteger)activity
{
	CCLOG(@"receivedMatchmakingActivity: %i", activity);
}

-(void) onMatchFound:(GKMatch*)match
{
	CCLOG(@"onMatchFound: %@", match);
}

-(void) onPlayersAddedToMatch:(bool)success
{
	CCLOG(@"onPlayersAddedToMatch: %@", success ? @"YES" : @"NO");
}

-(void) onMatchmakingViewDismissed
{
	CCLOG(@"onMatchmakingViewDismissed");
}
-(void) onMatchmakingViewError
{
	CCLOG(@"onMatchmakingViewError");
}

-(void) onPlayerConnected:(NSString*)playerID
{
	CCLOG(@"onPlayerConnected: %@", playerID);
}

-(void) onPlayerDisconnected:(NSString*)playerID
{
	CCLOG(@"onPlayerDisconnected: %@", playerID);
}

-(void) onStartMatch
{
	CCLOG(@"onStartMatch");
}


-(BOOL) webView:(UIWebView *)inWeb shouldStartLoadWithRequest:(NSURLRequest *)inRequest navigationType:(UIWebViewNavigationType)inType
{
	if (inType == UIWebViewNavigationTypeLinkClicked ) 
	{
		[[UIApplication sharedApplication] openURL:[inRequest URL]];
		return NO;
	}
    
	return YES;
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

-(void)otherGamesCase
{
	
	
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[otherGames scene]];
}


-(void)buttonPressed
{
	
	[vw_img1   removeFromSuperview];
	vw_img1=nil;
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[menuPage scene]];
	
}

-(void)tutorialPage
{
	

	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[insPage scene]];
}

-(void)aboutPage
{
	
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[about scene]];

}

/*- (void)plusMinusButtonTapped:(id)sender {  
	if ([[SimpleAudioEngine sharedEngine] mute]) 
	{
		// This will unmute the sound
		[[SimpleAudioEngine sharedEngine] setMute:0];
		[[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"StoryMusic.mp3"];
		
		
	}
	
	else 
	{
		//This will mute the sound
		[[SimpleAudioEngine sharedEngine] setMute:1];
	}
	
}*/

-(void)leaderBoardScore
{
	//[[CCDirector sharedDirector] pause] ;
	//[[CCDirector sharedDirector] replaceScene:[labelSelection scene]];
}

-(void)needToStart2
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
