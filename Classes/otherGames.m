//
//  Created by Objectsol on 16/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "otherGames.h"
#import "SimpleAudioEngine.h"

@implementation otherGames


+(id) scene
{
	
	CCScene *scene = [CCScene node];
    
    HUDsound *hud = [HUDsound node];
    [scene addChild:hud z:1];
    
    otherGames *layer = [[[otherGames alloc] initWithHUD:hud] autorelease];
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
	[[UIApplication sharedApplication] setStatusBarOrientation:UIDeviceOrientationPortrait];
	CCSprite *backGround = [CCSprite spriteWithFile:@"mainmenuak.png"];
	backGround.position = ccp(240, 160); 
	
	[self addChild:backGround  z:-2]; 
	
	CCMenuItem *starMenuItem11 = [CCMenuItemImage 
								  itemFromNormalImage:@"StartButtonUp.png" selectedImage:@"StartButtonDown.png" 
								  target:self selector:@selector(aCase)];
	starMenuItem11.position = ccp(60, 280);
	
	CCMenu *starMenu11 = [CCMenu menuWithItems:starMenuItem11, nil];
	starMenu11.position = CGPointZero;
	[self addChild:starMenu11 z:44];
	
	CCMenuItem *starMenuItem12 = [CCMenuItemImage 
								  itemFromNormalImage:@"othergame75.png" selectedImage:@"othergamesak.png" 
								  target:self selector:@selector(aCase)];
	starMenuItem12.position = ccp(70, 20);
	
	CCMenu *starMenu12 = [CCMenu menuWithItems:starMenuItem12, nil];
	starMenu12.position = CGPointZero;
	starMenu12.scale=1.04;
	[self addChild:starMenu12 z:44];
	
	
	CCMenuItem *starMenuItem14 = [CCMenuItemImage 
								  itemFromNormalImage:@"tutorial75.png" selectedImage:@"tutorialak.png" 
								  target:self selector:@selector(aCase)];
	starMenuItem14.position = ccp(256, 20);
	
	CCMenu *starMenu14 = [CCMenu menuWithItems:starMenuItem14, nil];
	starMenu14.position = CGPointZero;
	starMenu14.scale=1.04;
	[self addChild:starMenu14 z:44];
	
	
	
	/*CCMenuItem *starMenuItem121 = [CCMenuItemImage 
	 itemFromNormalImage:@"leaderboard.png" selectedImage:@"leaderboardTap.png" 
	 target:self selector:@selector(levelSelectionPage)];
	 starMenuItem121.position = ccp(320, 20);
	 
	 CCMenu *starMenu121 = [CCMenu menuWithItems:starMenuItem121, nil];
	 starMenu121.position = CGPointZero;
	 [self addChild:starMenu121 z:44];*/
	
	
	CCMenuItem *starMenuItem141 = [CCMenuItemImage 
								   itemFromNormalImage:@"about75.png" selectedImage:@"aboutak.png" 
								   target:self selector:@selector(aCase)];
	starMenuItem141.position = ccp(430, 20);
	
	CCMenu *starMenu141 = [CCMenu menuWithItems:starMenuItem141, nil];
	starMenu141.position = CGPointZero;
	starMenu141.scale=1.04;
	[self addChild:starMenu141 z:44];
	
	
	[self otherGamesCase];
	
}
- (void)loadRequest:(NSURLRequest *)request
{
    [self retain];
    if ([vw_img1 isLoading])
        [vw_img1 stopLoading];
    [vw_img1 loadRequest:request];
    [self release];
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self retain];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self release];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self release];
}

- (void)viewWillDisappear
{
    if ([vw_img1 isLoading])
        [vw_img1 stopLoading];
}



-(void)aCase
{
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
    //return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

-(void)otherGamesCase
{
	if(vw_img1)
	{
		[vw_img1 removeFromSuperview];
		[vw_img1 release],vw_img1=nil;
	}
	
	[[NSUserDefaults standardUserDefaults] 
     registerDefaults:[NSDictionary 
                       dictionaryWithObject:@"some old phone or other" 
                       forKey:@"UserAgent"]];
	vw_img1=[[UIWebView alloc]initWithFrame:CGRectMake(80,-80,320,480)];
    vw_img1.backgroundColor=[UIColor clearColor];
    vw_img1.delegate=self;
	[vw_img1 setBackgroundColor:[UIColor clearColor]];
    NSString *urlAddress = @"https://openspacestore.com/widget/openspacestore.html?FBRedirect=true";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [vw_img1 loadRequest:requestObj];
    //[self.view addSubview:vw_img1];
	
	vw_img1.transform = CGAffineTransformMakeRotation(CC_DEGREES_TO_RADIANS( -90.0f ));
	[[[CCDirector sharedDirector]openGLView] addSubview:vw_img1];
	
	UIButton *buttonForFood=[UIButton buttonWithType:UIButtonTypeCustom];
	[buttonForFood setImage:[UIImage imageNamed:@"x.png"] forState: UIControlStateNormal];
	[buttonForFood addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
	buttonForFood.frame = CGRectMake(280, 2, 38, 38);
	[vw_img1 addSubview:buttonForFood];
	
	
	
	
}




-(void)buttonPressed
{
	//[vw_img1 stopLoading];
	
	[vw_img1 setDelegate:nil];
    [vw_img1 stopLoading];
  //  [vw_img1 release];
	
	[vw_img1   removeFromSuperview];
	vw_img1=nil;
	[[UIApplication sharedApplication] setStatusBarOrientation:UIDeviceOrientationLandscapeLeft];
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[menuPage scene]];
	
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

-(void)levelSelectionPage
{
	//[[CCDirector sharedDirector] pause] ;
	//[[CCDirector sharedDirector] replaceScene:[labelSelection scene]];
}

-(void)needToStart2
{
	
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[HelloWorld scene]];
	
}

- (void)viewWillUnload {
    [vw_img1 setDelegate:nil];
    [vw_img1 stopLoading];
}

- (void) dealloc
{
	
	[vw_img1 setDelegate:nil];
    [vw_img1 stopLoading];
    [vw_img1 release];
    
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

