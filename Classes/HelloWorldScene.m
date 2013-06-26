//
//  HelloWorldLayer.m
//  submarine
//
//  Created by MADAN MOHAN PANDIT on 28/02/12.
//  Copyright HOME 2012. All rights reserved.
//

// Import the interfaces
#import "HelloWorldScene.h"
#import "ModalAlert.h"
#import "JSON.h"
// HelloWorld implementation
@implementation HelloWorld
#define URL1 @"http://addoncon.com/twitterapp/index.php?"
+(id) scene
{
	CCScene *scene = [CCScene node];
    
    HUDLayer *hud = [HUDLayer node];
    [scene addChild:hud z:1];
    
    HelloWorld *layer = [[[HelloWorld alloc] initWithHUD:hud] autorelease];
    [scene addChild:layer];
    
    return scene;
}



- (id)initWithHUD:(HUDLayer *)hud
{
    if ((self = [super init])) 
	{
		
		enemyArray=[[NSMutableArray alloc] init];
		goodArray=[[NSMutableArray alloc] init];
		dummyArray=[[NSMutableArray alloc] init];
		xt= [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreValue"];
		
		yt =  [[NSUserDefaults standardUserDefaults] integerForKey:@"showHighScore"];
		CCSprite * backGround = [CCSprite spriteWithFile:@"scoreboard.png"];
		
		backGround.position = ccp(240, 302); 
		
		[self addChild:backGround  z:322];
		CCMenuItem *pauseButton = [CCMenuItemImage 
								   itemFromNormalImage:@"pause.png" selectedImage:@"pause.png" 
								   target:self selector:@selector(pauseCase)];
		pauseButton.position = ccp(20, 305);
		
		pauseButton1 = [CCMenu menuWithItems:pauseButton, nil];
		pauseButton1.position = CGPointZero;
		[self addChild:pauseButton1 z:644];
		
		backGroundArray=[[NSMutableArray alloc] init];
		[[CCDirector sharedDirector] resume] ;
		[[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
		CCSprite * backGround2 = [CCSprite spriteWithFile:@"bkgrnd1.png"];
		backGround2.position = ccp(240, 160);
		backGround2.scale=2;
		[self addChild:backGround2  z:4];
		[backGroundArray addObject:backGround2];
		
		CCMenuItem *starMenuItem14 = [CCMenuItemImage 
									  itemFromNormalImage:@"advancedUp.png" selectedImage:@"advancedDown.png" 
									  target:self selector:@selector(anotherStart)];
		starMenuItem14.position = ccp(232, 210);
		
		starMenu14 = [CCMenu menuWithItems:starMenuItem14, nil];
		starMenu14.position = CGPointZero;
		
		[self addChild:starMenu14 z:44];
		
		CCMenuItem *starMenuItem141 = [CCMenuItemImage 
									  itemFromNormalImage:@"playUp.png" selectedImage:@"playDown.png" 
									  target:self selector:@selector(start)];
		starMenuItem141.position = ccp(232, 90);
		
	    starMenu141 = [CCMenu menuWithItems:starMenuItem141, nil];
		starMenu141.position = CGPointZero;
		
		[self addChild:starMenu141 z:44];
		
		
    }
    return self;
}

-(void)pauseCase
{
	pauseButton1.visible=NO;
	[[CCDirector sharedDirector] pause] ;
	backGroundForPause = [CCSprite spriteWithFile:@"black_transparent_scr.png"];
	backGroundForPause.position = ccp(240, 160); 
	backGroundForPause.opacity=80;
	[backGroundForPause setColor:ccc3(120,200,42)];
	[self addChild:backGroundForPause  z:600];
	[[SimpleAudioEngine sharedEngine] setMute:1];
	/*CCSprite * afterPause = [CCSprite spriteWithFile:@"page.png"];
	 afterPause.position = ccp(240, 160); 
	 [backGroundForPause addChild:afterPause  z:600];*/
	
	CCMenuItem *restart = [CCMenuItemImage 
						   itemFromNormalImage:@"restart_button.png" selectedImage:@"restart_button.png" 
						   target:self selector:@selector(restart)];
	restart.position = ccp(140, 210);
	
	CCMenu *restart1 = [CCMenu menuWithItems:restart, nil];
	restart1.position = CGPointZero;
	[backGroundForPause addChild:restart1 z:600];
	
	CCMenuItem *resume = [CCMenuItemImage 
						  itemFromNormalImage:@"resume_button.png" selectedImage:@"resume_button.png" 
						  target:self selector:@selector(resumeCase)];
	resume.position = ccp(140, 140);
	
	CCMenu *resume1 = [CCMenu menuWithItems:resume, nil];
	resume1.position = CGPointZero;
	[backGroundForPause addChild:resume1 z:600];
	
	CCMenuItem *mainMenu = [CCMenuItemImage 
							itemFromNormalImage:@"menu_button.png" selectedImage:@"menu_button.png" 
							target:self selector:@selector(mainMenuGo)];
	mainMenu.position = ccp(140, 70);
	
	CCMenu *mainMenu1 = [CCMenu menuWithItems:mainMenu, nil];
	mainMenu1.position = CGPointZero;
	[backGroundForPause addChild:mainMenu1 z:600];
	
	
}




-(void)restart
{
	[[SimpleAudioEngine sharedEngine] unloadEffect:@"jump.mp3"];
	
	[[SimpleAudioEngine sharedEngine] unloadEffect:@"slide1.mp3"];
	[[SimpleAudioEngine sharedEngine] unloadEffect:@"Capture-1.mp3"];
	[[SimpleAudioEngine sharedEngine] unloadEffect:@"running.mp3"];
	[self checking];
	[[CCDirector sharedDirector] pause] ;
	[self removeCase2];
	[[CCDirector sharedDirector] replaceScene:[HelloWorld scene]];
	
}



-(void)mainMenuGo
{
	
	[[SimpleAudioEngine sharedEngine] unloadEffect:@"jump.mp3"];
	
	[[SimpleAudioEngine sharedEngine] unloadEffect:@"slide1.mp3"];
	[[SimpleAudioEngine sharedEngine] unloadEffect:@"Capture-1.mp3"];
	[[SimpleAudioEngine sharedEngine] unloadEffect:@"running.mp3"];
	[self checking];
	[self removeCase2];
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[menuPage scene]];
	
}



-(void)resumeCase
{
	[self checking];
	pauseButton1.visible=YES;
	[self removeChild:backGroundForPause cleanup:YES];
	backGroundForPause=nil;
	[[CCDirector sharedDirector] resume] ;
	
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




-(void)anotherStart
{
	
	myIndicator = [[UIActivityIndicatorView alloc] 
										initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	myIndicator.center = CGPointMake(240, 275);
	myIndicator.hidesWhenStopped = NO;
	[myIndicator startAnimating];
	[[[CCDirector sharedDirector]openGLView] addSubview:myIndicator];
	
	[self removeChild:starMenu14 cleanup:YES];
	
	starMenu14=nil;
	
	[self removeChild:starMenu141 cleanup:YES];
	
	starMenu141=nil;
	[NSThread detachNewThreadSelector:@selector(fetch_topCompany1) toTarget:self withObject:nil];  
	
	[self fetch_topCompany];
	start=1;
	
	
	self.isTouchEnabled = YES;
	
	touchCheckForJump=0;
	fade=1;
	lessOpacity=1;
	extraLife=0;
	arrImageNo=0;
	highScoreCheck=0;
	
	
	enemyArray=[[NSMutableArray alloc] init];
	goodArray=[[NSMutableArray alloc] init];
	dummyArray=[[NSMutableArray alloc] init];
	
	
	loading1 = [CCSprite spriteWithFile:@"3ak.png"];
	loading1.position = ccp(240, 160);
	
	[self addChild:loading1  z:994];
	[self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:3],
					 [CCCallFuncN actionWithTarget:self selector:@selector(anotherLoad)],
					 nil]];
	if(arrPageurl)
	  {
		[arrPageurl release];
		arrPageurl=nil;
	  }
	
	arrPageurl = [[NSMutableArray alloc] init];
}

-(void)start
{
	[myIndicator stopAnimating];
	if(myIndicator)
	{
		[myIndicator removeFromSuperview];
		myIndicator=nil;
	}
	[self removeChild:starMenu14 cleanup:YES];
	
	starMenu14=nil;
	
	[self removeChild:starMenu141 cleanup:YES];
	
	starMenu141=nil;
	start=1;
	self.isTouchEnabled = YES;
	
	touchCheckForJump=0;
	fade=1;
	lessOpacity=1;
	extraLife=0;
	arrImageNo=0;
	highScoreCheck=0;
	
	
	
	
	 
	
	[self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0],
					 [CCCallFuncN actionWithTarget:self selector:@selector(anotherLoad)],
					 nil]];
	
}

-(void)anotherLoad
{
	if(myIndicator)
	{
		[myIndicator removeFromSuperview];
		myIndicator=nil;
	}
	[[SimpleAudioEngine sharedEngine] preloadEffect:@"jump.mp3"];
	[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"music.mp3"];
	[[SimpleAudioEngine sharedEngine] preloadEffect:@"running.mp3"];
	
	[self removeChild:loading1 cleanup:YES];
	
	loading1=nil;
	
	loading2 = [CCSprite spriteWithFile:@"2ak.png"];
	loading2.position = ccp(240, 160);
	
	[self addChild:loading2  z:994];
	
	[self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:6],
					 [CCCallFuncN actionWithTarget:self selector:@selector(anotherLoad2)],
					 nil]];
	
}

-(void)anotherLoad2
{
	if(myIndicator)
	{
		[myIndicator removeFromSuperview];
		myIndicator=nil;
	}
	[[SimpleAudioEngine sharedEngine] preloadEffect:@"Capture-1.mp3"];
	[[SimpleAudioEngine sharedEngine] preloadEffect:@"slide1.mp3"];
	
	[self removeChild:loading2 cleanup:YES];
	
	loading2=nil;
	
	loading3 = [CCSprite spriteWithFile:@"1ak.png"];
	loading3.position = ccp(240, 160);
	
	[self addChild:loading3 z:994];
	
	[self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:2],
					 [CCCallFuncN actionWithTarget:self selector:@selector(startOfGame)],
					 nil]];
	
}


// on "init" you need to initialize your instance
-(void) startOfGame
{	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	
	if(myIndicator)
	{
		[myIndicator removeFromSuperview];
		myIndicator=nil;
	}
	
	[self removeChild:loading3 cleanup:YES];
	
	loading3=nil;
	start=2;	
		[self schedule:@selector(moveBackGroundLeft)];
		
		
		
	    backGroundSpeed=5;
	    
	hero = [CCSprite spriteWithFile:@"run1.png"];
	hero.position = ccp(80, 60); 
	//hero.scale=.9;
	[self addChild:hero  z:26];
	
	    [self heroAinmation];
	bizDays = [CCLabelTTF labelWithString:@""  
							  dimensions: CGSizeMake(50.0, 20.0) 
							   alignment: UITextAlignmentRight
								fontName:@"Helvetica" 
								fontSize:16];
	bizDays.position = ccp(106,290);
	[bizDays setColor:ccRED];
	[self addChild:bizDays z:699];
	bizDaysScore=0;
	
	NSString *str=[NSString stringWithFormat:@"%d",bizDaysScore];
	[bizDays setString:[NSString stringWithString:str]];

	research=[CCLabelTTF labelWithString:@""  
							 dimensions: CGSizeMake(50.0, 20.0) 
							  alignment: UITextAlignmentRight
							   fontName:@"Helvetica" 
							   fontSize:16];
	research.position = ccp(162,290);
	[research setColor:ccRED];
	[self addChild:research z:699];
	researchScore=0;
	
	NSString *str12=[NSString stringWithFormat:@"%d",researchScore];
	[research setString:[NSString stringWithString:str12]];
	
	
	usersVal = [CCLabelTTF labelWithString:@""  
							  dimensions: CGSizeMake(50.0, 20.0) 
							   alignment: UITextAlignmentRight
								fontName:@"Helvetica" 
								fontSize:16];
	usersVal.position = ccp(222,290);
	[usersVal setColor:ccRED];
	[self addChild:usersVal z:699];
	usersValScore=0;
	slideCaseSound=0;
	NSString *str1=[NSString stringWithFormat:@"%d",usersValScore];
	[usersVal setString:[NSString stringWithString:str1]];
	
	[self schedule:@selector(enemyCreation) interval:1.5];
	
	
	press = [CCLabelTTF labelWithString:@""  
							  dimensions: CGSizeMake(50.0, 20.0) 
							   alignment: UITextAlignmentRight
								fontName:@"Helvetica" 
								fontSize:16];
	press.position = ccp(290,290);
	[press setColor:ccRED];
	[self addChild:press z:699];
	pressScore=0;
	
	NSString *str2=[NSString stringWithFormat:@"%d",pressScore];
	[press setString:[NSString stringWithString:str2]];
	
	
	dolar = [CCLabelTTF labelWithString:@""  
							  dimensions: CGSizeMake(50.0, 20.0) 
							   alignment: UITextAlignmentRight
								fontName:@"Helvetica" 
								fontSize:16];
	dolar.position = ccp(366,290);
	[dolar setColor:ccRED];
	[self addChild:dolar z:699];
	dolarScore=0;
	
	NSString *str3=[NSString stringWithFormat:@"%d",dolarScore];
	[dolar setString:[NSString stringWithString:str3]];

	
	lifeVal = [CCLabelTTF labelWithString:@""  
									dimensions: CGSizeMake(50.0, 20.0) 
									 alignment: UITextAlignmentRight
									  fontName:@"Helvetica" 
									  fontSize:16];
	lifeVal.position = ccp(438,290);
	[lifeVal setColor:ccRED];
	[self addChild:lifeVal z:699];
	
	
	NSString *str8=[NSString stringWithFormat:@"%d",extraLife];
	[lifeVal setString:[NSString stringWithString:str8]];
	
	
	[self schedule:@selector(scoreChecking) interval:5];
	[self schedule:@selector(checkCollision)];
	//[self schedule:@selector(go) interval:1.7];
	
	backgroundValue=1;
	//[self startTime];
	
	
	
	
	//[[SimpleAudioEngine sharedEngine] playEffect:@"music.mp3" pitch:0.2 pan:0.2 gain:0.2];
	int yy = [[NSUserDefaults standardUserDefaults] integerForKey:@"music"];
	if(yy==1)
	{
		[[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
		
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"music.mp3"];
		
	//[[SimpleAudioEngine sharedEngine] playEffect:@"music.mp3"];
		//printf("%d",yy);
	//[self schedule:@selector(musicPlay) interval:8];
		
		
	}
	touchCheckForJump=0;
}

-(void)musicPlay
{
	//[[SimpleAudioEngine sharedEngine] playEffect:@"music.mp3" pitch:0.2 pan:0.2 gain:0.2];
[[SimpleAudioEngine sharedEngine] playEffect:@"music.mp3"];
}

-(void)removeAllCreation
{
	for (CCSprite *target in goodArray)
		
	{
		[self removeChild:target cleanup:YES];
		
		target=nil;
	}
	[goodArray removeAllObjects];
	for (CCSprite *target in enemyArray)
		
	{
		[self removeChild:target cleanup:YES];
		
		target=nil;
	}
	[enemyArray removeAllObjects];
}


-(void)startTime
{ 
	
	[self removeAllCreation];
	[self unschedule:@selector(enemyCreation)];
	if(startBackground)
	{
		[self removeChild:startBackground cleanup:YES];
		
		startBackground=nil;
	}
	
	NSArray *starsArray = [NSArray arrayWithObjects:@"stage2.png",@"stage3.png",@"stage4.png",@"stage5.png",nil];
	startBackground = [CCSprite spriteWithFile:[starsArray objectAtIndex:backgroundValue-1]];
	startBackground.position=ccp(240,160);
	startBackground.opacity=0;
	startBackground.scale=2;
	[self addChild:startBackground  z:20];
	
	[startBackground runAction:[CCSequence actions:
					[CCFadeTo actionWithDuration:1.4 opacity:200],
					[CCDelayTime actionWithDuration:1],
					[CCFadeTo actionWithDuration:1.4 opacity:0],
					[CCCallFuncN actionWithTarget:self selector:@selector(deleteStage)],
					 nil]];
	[self onEnterTransitionDidFinish:1];
}

-(void)deleteStage
{
	
	if(startBackground)
	{
		[self removeChild:startBackground cleanup:YES];
		startBackground=nil;
	}
	[self enemyCreation];
	[self goodCreation];
}

-(void)scoreChecking
{
	bizDaysScore=bizDaysScore+1;	  
  NSString *str=[NSString stringWithFormat:@"%d",bizDaysScore];
  [bizDays setString:[NSString stringWithString:str]];
	  
}

-(void)heroAinmation
{
	if(hero)
	{
		[self removeChild:hero cleanup:YES];
		hero=nil;
	}
	hero = [CCSprite spriteWithFile:@"run1.png"];
	hero.position = ccp(80, 60); 
	//hero.scale=.9;
	[self addChild:hero  z:26];
	if(lessOpacity==2)
		hero.opacity=40;
	selection=1;	
	
	if(start==2)
	{
		
		soundEffectID=[[SimpleAudioEngine sharedEngine] playEffect:@"running.mp3"];
		NSArray *starsArray = [NSArray arrayWithObjects:@"run.plist",@"bobAttack.plist",@"afterEffect.plist",@"bobEffect.plist",@"mos5.plist", nil];
		NSArray *starsArray1 =[NSArray arrayWithObjects:@"run%d.png",@"Bob%d.png",@"The BOB%d.png",@"The BOB%d.png",@"5mos%d.png", nil];
		NSArray *starsArray2 =[NSArray arrayWithObjects:@"6",@"12",@"3",@"3",@"2", nil];
		NSArray *starsArray3 =[NSArray arrayWithObjects:@".05",@".09",@".05",@".05",@".05", nil];
        float l=[[starsArray3 objectAtIndex:selection-1] floatValue];
		[[CCSpriteFrameCache sharedSpriteFrameCache]addSpriteFramesWithFile:[starsArray objectAtIndex:selection-1]];
		NSMutableArray *Frames=[NSMutableArray array];
		for (int i=1;i<=[[starsArray2 objectAtIndex:selection-1]intValue]; ++i)
		{
			[Frames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache]
							   spriteFrameByName:[NSString stringWithFormat:[starsArray1 objectAtIndex:selection-1],i]]];
		}
		
		CCAnimation *Anim=[CCAnimation animationWithName:@"move" delay:[[starsArray3 objectAtIndex:selection-1]floatValue] frames:Frames];
		
		CCAction *action1=[CCRepeatForever    actionWithAction:[CCAnimate actionWithAnimation:Anim restoreOriginalFrame:NO]];
		
		[hero runAction:action1];		
	}
	
}


-(void)goodCreation
{
	if(!startBackground)
	{
	if(myIndicator)
	{
		[myIndicator removeFromSuperview];
		myIndicator=nil;
	}
	CCSprite * good;
	NSArray *starsArray1 = [NSArray arrayWithObjects:@"1",@"3",@"3",@"3",@"3",nil];
	int p;
	if(backgroundValue<3) 
		p=[[starsArray1 objectAtIndex:backgroundValue-1] intValue];
	else 
	{
		
		int h112=(arc4random() % 4);
	if(h112==2)
		
	   p=[[starsArray1 objectAtIndex:backgroundValue-1] intValue];
	
	else
		
	   p=5;
	}
	int k=(arc4random() % p)+1;
	NSArray *starsArray;
	if(backgroundValue==1)
		starsArray = [NSArray arrayWithObjects:@"research.png",nil];
	
	else if(backgroundValue==5)
		starsArray = [NSArray arrayWithObjects:@"users.png",@"goodPress.png",@"money.png",@"bonus.png",@"IPO.png",nil];
	
    else
	    starsArray = [NSArray arrayWithObjects:@"users.png",@"goodPress.png",@"money.png",@"bonus.png",@"VC.png",nil];

	good = [CCSprite spriteWithFile:[starsArray objectAtIndex:k-1]];
	if(backgroundValue!=1)
	good.tag=k;
	else
	    good.tag=108;
	int h11=(arc4random() % 230)+50;
	good.position=ccp(800,h11);
	
	[self addChild:good  z:20];
	[goodArray addObject:good];
	[goodArray retain];
	[self anotherGoodCreation];
	}
}

-(void)anotherGoodCreation
{
	if(!startBackground)
	{
	int kv=924;
	int p =2;
	if(backgroundValue>=2)
		p=5;
	
		for(int i=0;i<4;i++)
		{
			
	    CCSprite * good;
	    NSArray *starsArray1 = [NSArray arrayWithObjects:@"1",@"3",@"3",@"3",@"3",nil];
	    int p=[[starsArray1 objectAtIndex:backgroundValue-1] intValue];
	    int k=(arc4random() % p)+1;
		NSArray *starsArray;
		
		
		if(backgroundValue==1)
	        
				starsArray = [NSArray arrayWithObjects:@"research.png",nil];
			
				
		else if(backgroundValue==5)
			
				starsArray = [NSArray arrayWithObjects:@"users.png",@"goodPress.png",@"money.png",@"bonus.png",@"IPO.png",nil];
			
		else
				starsArray = [NSArray arrayWithObjects:@"users.png",@"goodPress.png",@"money.png",@"bonus.png",@"VC.png",nil];
			
			
	    good = [CCSprite spriteWithFile:[starsArray objectAtIndex:k-1]];
		if(backgroundValue!=1)
	    good.tag=k;
			else
	    good.tag=108;
	     int h11=(arc4random() % 230)+40;
	    good.position=ccp(kv,h11);
		
	    [self addChild:good  z:20];
	    [goodArray addObject:good];
			kv=kv+300;
	    }
    
	}
	
}


-(void)startEnemyCreation
{
	
	if(backgroundValue==2)
	     [self schedule:@selector(enemyCreation) interval:1.2];
	else if(backgroundValue==3)
		[self schedule:@selector(enemyCreation) interval:1.5];
	else if(backgroundValue==4)
		[self schedule:@selector(enemyCreation) interval:.9];
	else if(backgroundValue==5)
		[self schedule:@selector(enemyCreation) interval:.7];

}


- (void)onEnterTransitionDidFinish:(int) p {
	if(p==1)
	{
	//[ModalAlert Tell:@"Good Job" onLayer:self okBlock:nil];
	[self unschedule:@selector(enemyCreation)];
		[self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:2],
						 [CCCallFuncN actionWithTarget:self selector:@selector(startEnemyCreation)],
						 nil]];
	
		dolarValue=dolarScore;
	}
	else
	{
	//[ModalAlert Tell:@"Looser" onLayer:self okBlock:nil];
		[self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:2],
						 [CCCallFuncN actionWithTarget:self selector:@selector(gameOverCase)],
						 nil]];
	}
	
}

-(void)dolarValueCheck
{
	
	/*if(backgroundValue==3)
	      {
			dolarValue=dolarValue+10;
	      if(dolarScore<dolarValue)
	        [self onEnterTransitionDidFinish:2];
	     else	
	        {
		    dolarValue=dolarScore;
		    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:64],
						 [CCCallFuncN actionWithTarget:self selector:@selector(dolarValueCheck)],
						 nil]];
	         }
	       }
	else if(backgroundValue==4)
	     {
			 dolarValue=dolarValue+20;
		  if(dolarScore<dolarValue)
	        [self onEnterTransitionDidFinish:2];
		  else	
		    {
		    dolarValue=dolarScore;
		    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:64],
							 [CCCallFuncN actionWithTarget:self selector:@selector(dolarValueCheck)],
		    					 nil]];
		    }
	     }
	else if(backgroundValue==5)
	{
		dolarValue=dolarValue+40;
		if(dolarScore<dolarValue)
	        [self onEnterTransitionDidFinish:2];
		else	
		{
		    dolarValue=dolarScore;
		    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:64],
							 [CCCallFuncN actionWithTarget:self selector:@selector(dolarValueCheck)],
							 nil]];
		}
	}*/
}
- (void)fetch_topCompany1 {  
	
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];  
    // wait for 3 seconds before starting the thread, you don't have to do that. This is just an example how to stop the NSThread for some time  
    [NSThread sleepForTimeInterval:.1];  
   [self fetch_topCompany];	
	[self schedule:@selector(bannerAdd) interval:2];
    [pool release];  
	
} 
-(void)fetch_topCompany
{
	strWhichApiCalled=@"Fetch Top Ten";
	
	 // http://addoncon.com/twitterapp/index.php?action=toptencheckedscore
    
    NSString *post =[NSString stringWithFormat:@"action=%@",@"toptencheckedscore"];
	NSLog(@"PostString=%@",post);
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	[request setURL:[NSURL URLWithString:URL1]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:postData];
	
	
	NSURLConnection *conn=[[[NSURLConnection alloc] initWithRequest:request delegate:self] autorelease];
	if(conn)
	{
		NSLog(@"Connected");
		
	}
	else
		
		NSLog(@"Not Connected");
	
	[request release],request=nil;
}

-(void)fetchHighScore
{
	strWhichApiCalled=@"Fetch Server";
    
   // http://addoncon.com/twitterapp/index.php?action=gethighscore
    
    NSString *post =[NSString stringWithFormat:@"action=%@",@"gethighscore"];
	NSLog(@"PostString=%@",post);
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	[request setURL:[NSURL URLWithString:URL1]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:postData];
	
	
	NSURLConnection *conn=[[[NSURLConnection alloc] initWithRequest:request delegate:self] autorelease];
	if(conn)
	{
		NSLog(@"Connected");
		
	}
	else
		
		NSLog(@"Not Connected");
	
	[request release],request=nil;
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	NSLog(@"HERE RESPONSE: %d",[(NSHTTPURLResponse*) response statusCode]);
	NSLog(@"response: %@",[response description]);
	responceData=[[NSMutableData alloc] init];
	
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	NSLog(@"ERROR..........%@",[error localizedDescription]);
	//UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"SORRY" message:[error localizedDescription]
												//delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	//[alert1 show];    
	//[alert1 release];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[responceData appendData:data];
}


-(void)bannerAdd
{
	if(backgroundValue>=3 && [arrPageurl count]>0)
	{
		[self unschedule:@selector(bannerAdd)];
		[self schedule:@selector(bannerAdd1) interval:2.2];
	}
}



-(void)bannerAdd1
{
	
	if( [arrPageurl count]>0)
	{
		CCSprite * 	abackGround2;
		if(abackGround2)
		{
			[self removeChild:abackGround2 cleanup:YES];
			
			abackGround2=nil;
		}
		
	abackGround2= [CCSprite spriteWithFile:@"featuredstartupframeak.png"];
	abackGround2.position = ccp(40, 240);
	[self addChild:abackGround2 z:10];
		
	
				
		if(arrImageNo==0)
		{
		buttonForFood9.hidden = YES;
		buttonForFood10.hidden = YES;
		buttonForFood1.hidden = NO;
		
			lblName9.hidden=YES;
			lblName10.hidden=YES;
			lblName1.hidden=NO;
			
		   }
		else if(arrImageNo==1)
		{
			buttonForFood1.hidden = YES;
			buttonForFood2.hidden = NO;
			
			lblName1.hidden=YES;
			lblName2.hidden=NO;
		}
		else if(arrImageNo==2)
		{
			buttonForFood2.hidden = YES;
			buttonForFood3.hidden = NO;
			lblName2.hidden=YES;
			lblName3.hidden=NO;
		}
		else if(arrImageNo==3)
		{
			buttonForFood3.hidden = YES;
			buttonForFood4.hidden = NO;
			
			lblName3.hidden=YES;
			lblName4.hidden=NO;
		}
		else if(arrImageNo==4)
		{
			buttonForFood4.hidden = YES;
			buttonForFood5.hidden = NO;
			
			lblName4.hidden=YES;
			lblName5.hidden=NO;
		}
		
		else if(arrImageNo==5)
		{
			buttonForFood5.hidden = YES;
			buttonForFood6.hidden = NO;
			
			lblName5.hidden=YES;
			lblName6.hidden=NO;
		}
		else if(arrImageNo==6)
		{
			buttonForFood6.hidden = YES;
			buttonForFood7.hidden = NO;
			
			lblName6.hidden=YES;
			lblName7.hidden=NO;
		}
		else if(arrImageNo==7)
		{
			buttonForFood7.hidden = YES;
			buttonForFood8.hidden = NO;
			
			lblName7.hidden=YES;
			lblName8.hidden=NO;
		}
		else if(arrImageNo==8)
		{
			buttonForFood8.hidden = YES;
			buttonForFood9.hidden = NO;
			
			lblName8.hidden=YES;
			lblName9.hidden=NO;
		}
		else if(arrImageNo==9)
		{
			buttonForFood9.hidden = YES;
			buttonForFood10.hidden = NO;
			
			lblName9.hidden=YES;
			lblName10.hidden=NO;
		}
	/*lblName=[[UILabel alloc]init];
	lblName.frame=CGRectMake(18,102,45,12);
	lblName.backgroundColor=[UIColor clearColor];
	lblName.text=[arrName objectAtIndex:arrImageNo];
	lblName.font =[UIFont fontWithName:@"Arial" size:10];
	lblName.textColor=[UIColor blackColor];
	lblName.textAlignment=UITextAlignmentCenter;
		[[[CCDirector sharedDirector]openGLView] addSubview:lblName];*/
	arrImageNo=arrImageNo+1;
	
	if(arrImageNo>=[arrPageurl count])
	{
		arrImageNo=0;
	}
			
		}
	
		
}
-(void)ClickImage:(id) sender
{
	UIButton *butt=(UIButton*)sender;
	//int i=butt.tag;
	int arrImageNo1=arrImageNo-1;
	printf("\n%d",arrImageNo1);
	//NSLog(@"\n%@",arrPageurl);
	[[UIApplication sharedApplication] openURL:[arrPageurl objectAtIndex:arrImageNo1]];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	//[tools stopLoading:loadingView];
	NSString *responseString=[[NSString alloc] initWithData:responceData encoding:NSUTF8StringEncoding]; 
    
   
    
	if([strWhichApiCalled isEqualToString:@"Fetch Server"])
	{
		id dict = [responseString  JSONValue];
		
		if([[NSString stringWithFormat:@"%@",[dict objectForKey:@"status"]] isEqualToString:@"1"])
		{
			NSString *strHighScore=[dict objectForKey:@"highscore"];
			
			//HighScore=[strHighScore intValue];
			//printf("\nnhhv %d",HighScore);
		}
	}
	else if([strWhichApiCalled isEqualToString:@"Fetch Top Ten"])
	{
		id dict = [responseString  JSONValue];
		
		if([[NSString stringWithFormat:@"%@",[dict objectForKey:@"status"]] isEqualToString:@"1"])
		{
			//arrName = [[NSMutableArray alloc] init];
			//arrImage = [[NSMutableArray alloc] init];
			
			
			NSMutableArray *arr=[[NSMutableArray alloc]init];
			
			arr = [dict objectForKey:@"topten"];
			int i;
			for(i=0;i<[arr count];i++)
			{
				NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",[[arr objectAtIndex:i] objectForKey:@"company_url"]]];
				[arrPageurl addObject:url];
				
				NSURL *url1 = [NSURL URLWithString:[NSString stringWithFormat:@"%@",[[arr objectAtIndex:i] objectForKey:@"profile_img"]]];
				NSData *data=[NSData dataWithContentsOfURL:url1];
				UIImage * image=[UIImage imageWithData:data];
				NSString *str = [[arr objectAtIndex:i] objectForKey:@"company_name"];
				
				
				if(i==0)
				{
					buttonForFood1=[UIButton buttonWithType:UIButtonTypeCustom];
				
					[buttonForFood1 setImage:image forState: UIControlStateNormal];
					buttonForFood1.tag=i;
					[buttonForFood1 addTarget:self action:@selector(ClickImage:) forControlEvents:UIControlEventTouchUpInside];
					buttonForFood1.frame = CGRectMake(22, 70, 34, 32);
					buttonForFood1.hidden=YES;
					[[[CCDirector sharedDirector]openGLView] addSubview:buttonForFood1];
					
					lblName1=[[UILabel alloc]init];
					lblName1.frame=CGRectMake(18,102,45,12);
					lblName1.backgroundColor=[UIColor clearColor];
					lblName1.text=str;
					lblName1.hidden=YES;
					lblName1.font =[UIFont fontWithName:@"Arial" size:10];
					lblName1.textColor=[UIColor blackColor];
					lblName1.textAlignment=UITextAlignmentCenter;
					[[[CCDirector sharedDirector]openGLView] addSubview:lblName1];
				}
				else if(i==1)
				{
					buttonForFood2=[UIButton buttonWithType:UIButtonTypeCustom];
					
					[buttonForFood2 setImage:image forState: UIControlStateNormal];
					buttonForFood2.tag=i;
					[buttonForFood2 addTarget:self action:@selector(ClickImage:) forControlEvents:UIControlEventTouchUpInside];
					buttonForFood2.frame = CGRectMake(22, 70, 34, 32);
					buttonForFood2.hidden=YES;
					[[[CCDirector sharedDirector]openGLView] addSubview:buttonForFood2];
					
					lblName2=[[UILabel alloc]init];
					lblName2.frame=CGRectMake(18,102,45,12);
					lblName2.backgroundColor=[UIColor clearColor];
					lblName2.text=str;
					lblName2.hidden=YES;
					lblName2.font =[UIFont fontWithName:@"Arial" size:10];
					lblName2.textColor=[UIColor blackColor];
					lblName2.textAlignment=UITextAlignmentCenter;
					[[[CCDirector sharedDirector]openGLView] addSubview:lblName2];
				}
				else if(i==2)
				{
					buttonForFood3=[UIButton buttonWithType:UIButtonTypeCustom];
					
					[buttonForFood3 setImage:image forState: UIControlStateNormal];
					buttonForFood3.tag=i;
					[buttonForFood3 addTarget:self action:@selector(ClickImage:) forControlEvents:UIControlEventTouchUpInside];
					buttonForFood3.frame = CGRectMake(22, 70, 34, 32);
					buttonForFood3.hidden=YES;
					[[[CCDirector sharedDirector]openGLView] addSubview:buttonForFood3];
					
					lblName3=[[UILabel alloc]init];
					lblName3.frame=CGRectMake(18,102,45,12);
					lblName3.backgroundColor=[UIColor clearColor];
					lblName3.text=str;
					lblName3.hidden=YES;
					lblName3.font =[UIFont fontWithName:@"Arial" size:10];
					lblName3.textColor=[UIColor blackColor];
					lblName3.textAlignment=UITextAlignmentCenter;
					[[[CCDirector sharedDirector]openGLView] addSubview:lblName3];
				}
				else if(i==3)
				{
					buttonForFood4=[UIButton buttonWithType:UIButtonTypeCustom];
					
					[buttonForFood4 setImage:image forState: UIControlStateNormal];
					buttonForFood4.tag=i;
					[buttonForFood4 addTarget:self action:@selector(ClickImage:) forControlEvents:UIControlEventTouchUpInside];
					buttonForFood4.frame = CGRectMake(22, 70, 34, 32);
					buttonForFood4.hidden=YES;
					[[[CCDirector sharedDirector]openGLView] addSubview:buttonForFood4];
					
					lblName4=[[UILabel alloc]init];
					lblName4.frame=CGRectMake(18,102,45,12);
					lblName4.backgroundColor=[UIColor clearColor];
					lblName4.text=str;
					lblName4.hidden=YES;
					lblName4.font =[UIFont fontWithName:@"Arial" size:10];
					lblName4.textColor=[UIColor blackColor];
					lblName4.textAlignment=UITextAlignmentCenter;
					[[[CCDirector sharedDirector]openGLView] addSubview:lblName4];
				}
				else if(i==4)
				{
					buttonForFood5=[UIButton buttonWithType:UIButtonTypeCustom];
					
					[buttonForFood5 setImage:image forState: UIControlStateNormal];
					buttonForFood5.tag=i;
					[buttonForFood5 addTarget:self action:@selector(ClickImage:) forControlEvents:UIControlEventTouchUpInside];
					buttonForFood5.frame = CGRectMake(22, 70, 34, 32);
					buttonForFood5.hidden=YES;
					[[[CCDirector sharedDirector]openGLView] addSubview:buttonForFood5];
					
					lblName5=[[UILabel alloc]init];
					lblName5.frame=CGRectMake(18,102,45,12);
					lblName5.backgroundColor=[UIColor clearColor];
					lblName5.text=str;
					lblName5.hidden=YES;
					lblName5.font =[UIFont fontWithName:@"Arial" size:10];
					lblName5.textColor=[UIColor blackColor];
					lblName5.textAlignment=UITextAlignmentCenter;
					[[[CCDirector sharedDirector]openGLView] addSubview:lblName5];
				}
				else if(i==5)
				{
					buttonForFood6=[UIButton buttonWithType:UIButtonTypeCustom];
					
					[buttonForFood6 setImage:image forState: UIControlStateNormal];
					buttonForFood6.tag=i;
					[buttonForFood6 addTarget:self action:@selector(ClickImage:) forControlEvents:UIControlEventTouchUpInside];
					buttonForFood6.frame = CGRectMake(22, 70, 34, 32);
					buttonForFood6.hidden=YES;
					[[[CCDirector sharedDirector]openGLView] addSubview:buttonForFood6];
					
					lblName6=[[UILabel alloc]init];
					lblName6.frame=CGRectMake(18,102,45,12);
					lblName6.backgroundColor=[UIColor clearColor];
					lblName6.text=str;
					lblName6.hidden=YES;
					lblName6.font =[UIFont fontWithName:@"Arial" size:10];
					lblName6.textColor=[UIColor blackColor];
					lblName6.textAlignment=UITextAlignmentCenter;
					[[[CCDirector sharedDirector]openGLView] addSubview:lblName6];
				}
				else if(i==6)
				{
					buttonForFood7=[UIButton buttonWithType:UIButtonTypeCustom];
					
					[buttonForFood7 setImage:image forState: UIControlStateNormal];
					buttonForFood7.tag=i;
					[buttonForFood7 addTarget:self action:@selector(ClickImage:) forControlEvents:UIControlEventTouchUpInside];
					buttonForFood7.frame = CGRectMake(22, 70, 34, 32);
					buttonForFood7.hidden=YES;
					[[[CCDirector sharedDirector]openGLView] addSubview:buttonForFood7];
					
					lblName7=[[UILabel alloc]init];
					lblName7.frame=CGRectMake(18,102,45,12);
					lblName7.backgroundColor=[UIColor clearColor];
					lblName7.text=str;
					lblName7.hidden=YES;
					lblName7.font =[UIFont fontWithName:@"Arial" size:10];
					lblName7.textColor=[UIColor blackColor];
					lblName7.textAlignment=UITextAlignmentCenter;
					[[[CCDirector sharedDirector]openGLView] addSubview:lblName7];
				}
				else if(i==7)
				{
					buttonForFood8=[UIButton buttonWithType:UIButtonTypeCustom];
					
					[buttonForFood8 setImage:image forState: UIControlStateNormal];
					buttonForFood8.tag=i;
					[buttonForFood8 addTarget:self action:@selector(ClickImage:) forControlEvents:UIControlEventTouchUpInside];
					buttonForFood8.frame = CGRectMake(22, 70, 34, 32);
					buttonForFood8.hidden=YES;
					[[[CCDirector sharedDirector]openGLView] addSubview:buttonForFood8];
					
					lblName8=[[UILabel alloc]init];
					lblName8.frame=CGRectMake(18,102,45,12);
					lblName8.backgroundColor=[UIColor clearColor];
					lblName8.text=str;
					lblName8.hidden=YES;
					lblName8.font =[UIFont fontWithName:@"Arial" size:10];
					lblName8.textColor=[UIColor blackColor];
					lblName8.textAlignment=UITextAlignmentCenter;
					[[[CCDirector sharedDirector]openGLView] addSubview:lblName8];
				}
				else if(i==8)
				{
					buttonForFood9=[UIButton buttonWithType:UIButtonTypeCustom];
					
					[buttonForFood9 setImage:image forState: UIControlStateNormal];
					buttonForFood9.tag=i;
					[buttonForFood9 addTarget:self action:@selector(ClickImage:) forControlEvents:UIControlEventTouchUpInside];
					buttonForFood9.frame = CGRectMake(22, 70, 34, 32);
					buttonForFood9.hidden=YES;
					[[[CCDirector sharedDirector]openGLView] addSubview:buttonForFood9];
					
					lblName9=[[UILabel alloc]init];
					lblName9.frame=CGRectMake(18,102,45,12);
					lblName9.backgroundColor=[UIColor clearColor];
					lblName9.text=str;
					lblName9.hidden=YES;
					lblName9.font =[UIFont fontWithName:@"Arial" size:10];
					lblName9.textColor=[UIColor blackColor];
					lblName9.textAlignment=UITextAlignmentCenter;
					[[[CCDirector sharedDirector]openGLView] addSubview:lblName9];
				}
				else if(i==9)
				{
					buttonForFood10=[UIButton buttonWithType:UIButtonTypeCustom];
					
					[buttonForFood10 setImage:image forState: UIControlStateNormal];
					buttonForFood10.tag=i;
					[buttonForFood10 addTarget:self action:@selector(ClickImage:) forControlEvents:UIControlEventTouchUpInside];
					buttonForFood10.frame = CGRectMake(22, 70, 34, 32);
					buttonForFood10.hidden=YES;
					[[[CCDirector sharedDirector]openGLView] addSubview:buttonForFood10];
					
					lblName10=[[UILabel alloc]init];
					lblName10.frame=CGRectMake(18,102,45,12);
					lblName10.backgroundColor=[UIColor clearColor];
					lblName10.text=str;
					lblName10.hidden=YES;
					lblName10.font =[UIFont fontWithName:@"Arial" size:10];
					lblName10.textColor=[UIColor blackColor];
					lblName10.textAlignment=UITextAlignmentCenter;
					[[[CCDirector sharedDirector]openGLView] addSubview:lblName10];
				}
				
			}
			//[arrName retain];
			//[arrImage retain];
			//[arrPageurl retain];
		}
		
		//[self fetchHighScore];
	}
}


	
-(void)checkCollision
{
	
	
	//HighScore=bizDaysScore+researchScore+usersValScore+pressScore+dolarScore+extraLife;
	
	if(HighScore>xt && highScoreCheck==0 && yt==10)
	{
		
		highPhoto= [CCSprite spriteWithFile:@"highscore1.png"];
		highPhoto.position = ccp(240, 160);
		
		[self addChild:highPhoto  z:4];
		//[highPhoto runAction:[CCBlink actionWithDuration:.4 blinks:2];
		[self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:4],
						 [CCCallFuncN actionWithTarget:self selector:@selector(removeCase)],
						 nil]];
		
		
		
		highScoreCheck=1;
	}

	if(researchScore==5 && backgroundValue==1)
	{
		//[self unschedule:@selector(checkCollision)];
		//[self unschedule:@selector(moveBackGroundLeft)];
		[self startTime];
		backgroundValue=2;
		
		//[self onEnterTransitionDidFinish:1];
		backGroundSpeed=7;
	}
	
	if(usersValScore>=20 &&  pressScore>=5 && backgroundValue==2)
	{
		
		//[self onEnterTransitionDidFinish:1];
		[self startTime];
		backGroundSpeed=9;
		backgroundValue=3;
		[self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:64],
						 [CCCallFuncN actionWithTarget:self selector:@selector(dolarValueCheck)],
						 nil]];
		
	}
	
	
	if(usersValScore>=40 &&  pressScore>=10 &&  dolarScore>=20 && backgroundValue==3)
	{
		
		//[self onEnterTransitionDidFinish:1];
		[self startTime];
		backGroundSpeed=10;
		backgroundValue=4;
		[self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:64],
						 [CCCallFuncN actionWithTarget:self selector:@selector(dolarValueCheck)],
						 nil]];
		
	}
	
	if(usersValScore>=80 &&  pressScore>=30 &&  dolarScore>=40 && backgroundValue==4)
	{
		
		//[self onEnterTransitionDidFinish:1];
		[self startTime];
		backGroundSpeed=12;
		backgroundValue=5;
		[self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:64],
						 [CCCallFuncN actionWithTarget:self selector:@selector(dolarValueCheck)],
						 nil]];
		
	}
	
	
	
	for (CCSprite *target in goodArray)
		
	{
		
		
		if ((CGRectIntersectsRect([target boundingBox], [hero boundingBox])) && target.tag!=100)
		{
			[[SimpleAudioEngine sharedEngine] playEffect:@"capture-1.mp3"];
			if(target.tag==108)
			{
				HighScore=HighScore+1;
			researchScore=researchScore+1;
			NSString *str=[NSString stringWithFormat:@"%d",researchScore];
			[research setString:[NSString stringWithString:str]];
				
			}
			
			else if(target.tag==1)
			{
				HighScore=HighScore+2;
				usersValScore=usersValScore+1;
				NSString *str=[NSString stringWithFormat:@"%d",usersValScore];
				[usersVal setString:[NSString stringWithString:str]];
				
			}
			
			else if(target.tag==2)
			{
				HighScore=HighScore+1;
				pressScore=pressScore+1;
				NSString *str=[NSString stringWithFormat:@"%d",pressScore];
				[press setString:[NSString stringWithString:str]];
			}	
			else if(target.tag==3)
			{
				HighScore=HighScore+6;
				dolarScore=dolarScore+1;
				NSString *str=[NSString stringWithFormat:@"%d",dolarScore];
				[dolar setString:[NSString stringWithString:str]];
			}	
			else if(target.tag==4)
			{
				if(lessOpacity==1)
				{
				lessOpacity=2;
				[self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:10],
								 [CCCallFuncN actionWithTarget:self selector:@selector(lessOpacityEffect)],
								 nil]];
				hero.opacity=40;
				}
				
			}	
			else if(target.tag==5)
			{
				if(backgroundValue==4 || backgroundValue==3)
			    	{ 
					HighScore=HighScore+100;
				    dolarScore=dolarScore+5;
				    extraLife=extraLife+1;
					}
				else if(backgroundValue==5)
				   {  
				   
				    extraLife=extraLife+2;
					HighScore=HighScore+1000;
					dolarScore=dolarScore+5;
					
				   }
				

				NSString *str=[NSString stringWithFormat:@"%d",dolarScore];
				[dolar setString:[NSString stringWithString:str]];
				NSString *str8=[NSString stringWithFormat:@"%d",extraLife];
				[lifeVal setString:[NSString stringWithString:str8]];

			}	
			
			[self removeChild:target cleanup:YES];
			[goodArray removeObject:target];
			target=nil;
			//target.tag=100;
            //target.visible=NO;			
			break;
		}
		
		
	}
	
	
	if(!startBackground)
	{
	for (CCSprite *target in enemyArray)
		
	{
		CGRect targetRectl = CGRectMake(
										target.position.x - ((target.contentSize.width-10) /2), 
										target.position.y - ((target.contentSize.height-10)/2), 
										target.contentSize.width/2, 
										target.contentSize.height/2);
		if ((CGRectIntersectsRect(targetRectl, [hero boundingBox])) && lessOpacity==1)	
		{
			if(extraLife==0 && !highPhoto)
			{
			[self unschedule:@selector(checkCollision)];
			[self unschedule:@selector(moveBackGroundLeft)];
			
		    [self onEnterTransitionDidFinish:2];
			int p =target.tag;
			
				
			}
			else if(extraLife>0)
			{
			[enemyArray removeObject:target];
			[dummyArray addObject:target];
				
			extraLife=extraLife-1;
				

			}
			NSString *str8=[NSString stringWithFormat:@"%d",extraLife];
			[lifeVal setString:[NSString stringWithString:str8]];
			break;
		}
		
		
	}
	}
	
	
	
}


-(void)removeCase
{
	[self removeChild:highPhoto cleanup:YES];
	
	highPhoto=nil;
}

-(void)lessOpacityEffect
{
	lessOpacity=1;
	hero.opacity=200;
}


-(void)gameOverCase
{
	
	int x=HighScore;
	
	[[NSUserDefaults standardUserDefaults] setInteger:x forKey:@"totalScore"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	[[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
	
	[[SimpleAudioEngine sharedEngine] unloadEffect:@"jump.mp3"];
	
	[[SimpleAudioEngine sharedEngine] unloadEffect:@"slide1.mp3"];
	[[SimpleAudioEngine sharedEngine] unloadEffect:@"Capture-1.mp3"];
	[[SimpleAudioEngine sharedEngine] unloadEffect:@"running.mp3"];
	[[CCDirector sharedDirector] pause] ;
	int x1 =  [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreValue"];
	
	if(HighScore>x1)
	{
		[[NSUserDefaults standardUserDefaults] setInteger:HighScore forKey:@"HighScoreValue"];
		[[NSUserDefaults standardUserDefaults] synchronize];
	}
	
	[[NSUserDefaults standardUserDefaults] setInteger:bizDaysScore forKey:@"bizDaysScore"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	
	[[NSUserDefaults standardUserDefaults] setInteger:researchScore forKey:@"researchScore"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	
	[[NSUserDefaults standardUserDefaults] setInteger:usersValScore forKey:@"usersValScore"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	
	[[NSUserDefaults standardUserDefaults] setInteger:pressScore forKey:@"pressScore"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	
	[[NSUserDefaults standardUserDefaults] setInteger:dolarScore forKey:@"dolarScore"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	
	[[NSUserDefaults standardUserDefaults] setInteger:extraLife forKey:@"extraLife"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	if(buttonForFood1)
	{
		[buttonForFood1 removeFromSuperview];
		buttonForFood1=nil;
	}
	[self removeCase2];
	[[CCDirector sharedDirector] replaceScene:[stage2 scene]];
	
}





-(void)moveBackGroundLeft
{   
	
	//if(buttonForFood)
		//buttonForFood.frame=CGRectMake(buttonForFood.frame.origin.x-(backGroundSpeed), buttonForFood.frame.origin.y,buttonForFood.frame.size.width,buttonForFood.frame.size.height);
	
	if([backGroundArray count]>0)
	{
	for (CCSprite *target in backGroundArray)
		
	{
		CCSprite * sprite22=[backGroundArray objectAtIndex:[backGroundArray count]-1];
		if(sprite22.position.x<=240 && [backGroundArray count]<=3)
			[self checkBackGround];
		[target setPosition:ccp(target.position.x - backGroundSpeed,target.position.y)];
		
		if(target.position.x<-240)
		{
			[self removeChild:target cleanup:YES];
			[backGroundArray removeObject:target];
			target=nil;
		}
		
	}
	
	}
	
	
	
	if([goodArray count]>0)
	{
	for (CCSprite *target in goodArray)
		
	{
		
		
		[target setPosition:ccp(target.position.x - (backGroundSpeed+.4),target.position.y)];
		
		if(target.position.x<-40)
		{
			[self removeChild:target cleanup:YES];
			[goodArray removeObject:target];
			target=nil;
		}
		
	}
	}
	
	
	if([enemyArray count]>0)
	{
	for (CCSprite *target in enemyArray)
		
	{
		
		[target setPosition:ccp(target.position.x - (backGroundSpeed+.4),target.position.y)];
		
		if(target.position.x<-40)
		{
			[self removeChild:target cleanup:YES];
			[enemyArray removeObject:target];
			target=nil;
			//[positionChangeArray removeObject:target];
		}
		
	}
	}
	
	if([dummyArray count]>0)
	{
	for (CCSprite *target in dummyArray)
		
	{
		
		[target setPosition:ccp(target.position.x - (backGroundSpeed+.4),target.position.y)];
		
		if(target.position.x<-40)
		{
			[self removeChild:target cleanup:YES];
			[dummyArray removeObject:target];
			target=nil;
			//[positionChangeArray removeObject:target];
		}
		
	}
	}
	
		
}	

-(void)enemyCreation
{
	if(backgroundValue==1  || backgroundValue==2)
	{
		int k9=(arc4random() % 2);
		if(k9==1)
			[self enemyCreationReal];
		else 
			[self goodCreation];
	}
    else if(backgroundValue>=3)
	
		[self enemyCreationReal];
			
	
}

-(void)enemyCreationReal
{
	if(!startBackground)
	{
	CCSprite * enemy;
	
	NSArray *starsArray2;
	if(backgroundValue==1)
	     starsArray2 = [NSArray arrayWithObjects:@"noTraction.png", nil];
	else if(backgroundValue==2)
		 starsArray2 = [NSArray arrayWithObjects:@"bugs.png",@"gatekeeper.png", nil];
	else if(backgroundValue==3)
		 starsArray2 = [NSArray arrayWithObjects:@"bugs.png",@"badPress.png", nil];
	else if(backgroundValue==4)
		starsArray2 = [NSArray arrayWithObjects:@"bugs.png",@"badPress.png",@"HR.png", nil];
	else if(backgroundValue==5)
		starsArray2 = [NSArray arrayWithObjects:@"bugs.png",@"badPress.png",@"HR.png",@"competition.png", nil];
	
	NSArray *starsArray = [NSArray arrayWithObjects:@"1",@"2",@"2",@"3",@"4",nil];
	int p=[[starsArray objectAtIndex:backgroundValue-1] intValue];
	int k=(arc4random() % p)+1;
		
	enemy = [CCSprite spriteWithFile:[starsArray2 objectAtIndex:k-1]];
		//enemy.scale=.8;
	enemy.tag=k;
	int k9=(arc4random() % 3)+1;
		int h11;
	if(k9==2)
	//int h11=(arc4random() % 200)+20;
		h11=80;
	//else if(k9==3)
		//h11=160;
	//else 
		//h11=160;
	NSArray *starsArray4 = [NSArray arrayWithObjects:@"130",@"50",@"220",@"50", nil];	
		int h112=(arc4random() % 3);
		//if(h112==2)
	int pv=[[starsArray4 objectAtIndex:h112] intValue];
	enemy.position=ccp(610,pv);
	
	[self addChild:enemy  z:20];
		
	[enemyArray addObject:enemy];
	[enemyArray retain];	
	[self goodCreation];
	}
	
}





-(void)checkBackGround

    {
	CCSprite * backGround;
	NSArray *starsArray = [NSArray arrayWithObjects:@"bkgrnd1.png",@"bkgrnd2.png",@"bkgrnd3.png",@"bkgrnd4.png",@"bkgrnd5.png",nil];
	backGround = [CCSprite spriteWithFile:[starsArray objectAtIndex:backgroundValue-1]];	
    if(backgroundValue==1)
	{
		backGround.scale=2.08;
		  backGround.position = ccp(714, 160);
	}
	else
	{
	      backGround.position = ccp(714, 160);
		backGround.scale=2.08;
	}
		
	[self addChild:backGround  z:3];
	[backGroundArray addObject:backGround];
		
		
	}


- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint point1 = [touch previousLocationInView: [touch view]];
    CGPoint point = [touch locationInView: [touch view]];
	CGPoint translation = ccpSub(point1, point);   
	
      
	if(point1.y>point.y && touchCheckForJump==0)
	  {
		  [[SimpleAudioEngine sharedEngine] stopEffect:soundEffectID];
		 // [[SimpleAudioEngine sharedEngine] stopEffect:[NSString stringWithFormat:@"%@.wav",sound]];
		  touchCheckForJump=2;
		  [hero stopAllActions];
		 // self.isTouchEnabled = NO;
		  [self caseForTouchUp];
		  [self jumpSound];
	  }
	
	else if	(point.y>point1.y && hero.position.y>30)
	  {
		touchCheck=1;
		 // [[SimpleAudioEngine sharedEngine] stopEffect:[NSString stringWithFormat:@"%@.wav",sound]];
		 [[SimpleAudioEngine sharedEngine] stopEffect:soundEffectID];
		  if(hero.position.y>60)
		  {
			  [hero stopAllActions];
			 [hero runAction:[CCMoveTo actionWithDuration:.02 position:ccp(hero.position.x,30)]];
		  }
		 // self.isTouchEnabled = NO;
		  [self caseForTouchDown];
		  [self soundSlide];
	  }
	
	
}

-(void)jumpSound
{
	[[SimpleAudioEngine sharedEngine] playEffect:@"jump.mp3"];
}

-(void)soundSlide
{
	if(slideCaseSound==0)
	{
	[[SimpleAudioEngine sharedEngine] playEffect:@"slide1.mp3"];
		//slideCaseSound=1;
		[self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:1],
						 [CCCallFuncN actionWithTarget:self selector:@selector(changeValue)],
						 nil]];
	}
}

-(void)changeValue
{
	//slideCaseSound=0;
}


-(void)touchCheckForJumpChange
{

	touchCheckForJump=0;
	
}

-(void)caseForTouchUp
{
	[self jumpAndSlide:1];  
	int pos=220-hero.position.y;
	[hero runAction:[CCSequence actions:[CCJumpTo actionWithDuration:.9 position:ccp(hero.position.x,hero.position.y) height:pos jumps:1],
					 [CCMoveTo actionWithDuration:.01 position:ccp(hero.position.x,60)],
					 [CCCallFuncN actionWithTarget:self selector:@selector(touchCase)],
					 nil]];
	[hero runAction:[CCSequence actions:[CCDelayTime actionWithDuration:.7],
					 [CCCallFuncN actionWithTarget:self selector:@selector(touchCheckForJumpChange)],
					 nil]];
	/*[hero runAction:[CCSequence actions:[CCMoveTo actionWithDuration:.1 position:ccp(hero.position.x,hero.position.y+150)],
					 [CCDelayTime actionWithDuration:.2],
					 [CCMoveTo actionWithDuration:.1 position:ccp(80,60)],
					 [CCCallFuncN actionWithTarget:self selector:@selector(touchCase)],
					 nil]];*/
	
}



-(void)caseForTouchDown
{
	touchCheckForJump=0;
	[hero setPosition:ccp(hero.position.x,30)];
	[self jumpAndSlide:2];  
	[hero runAction:[CCSequence actions:[CCDelayTime actionWithDuration:.6],
					 [CCCallFuncN actionWithTarget:self selector:@selector(touchCase)],
					 nil]];
	}


-(void)jumpAndSlide:(int)p
{
	selection=p;
	NSArray *starsArray = [NSArray arrayWithObjects:@"jump.plist",@"slide.plist",@"afterEffect.plist",@"bobEffect.plist",@"mos5.plist", nil];
	NSArray *starsArray1 =[NSArray arrayWithObjects:@"jump%d.png",@"slide%d.png",@"The BOB%d.png",@"The BOB%d.png",@"5mos%d.png", nil];
	NSArray *starsArray2 =[NSArray arrayWithObjects:@"3",@"1",@"3",@"3",@"2", nil];
	NSArray *starsArray3 =[NSArray arrayWithObjects:@".3",@".6",@".05",@".05",@".05", nil];
	float l=[[starsArray3 objectAtIndex:selection-1] floatValue];
	[[CCSpriteFrameCache sharedSpriteFrameCache]addSpriteFramesWithFile:[starsArray objectAtIndex:selection-1]];
	NSMutableArray *Frames=[NSMutableArray array];
	for (int i=1;i<=[[starsArray2 objectAtIndex:selection-1]intValue]; ++i)
	{
		[Frames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache]
						   spriteFrameByName:[NSString stringWithFormat:[starsArray1 objectAtIndex:selection-1],i]]];
	}
	
	CCAnimation *Anim=[CCAnimation animationWithName:@"move" delay:[[starsArray3 objectAtIndex:selection-1]floatValue] frames:Frames];
	
	CCAction *action1=[CCAnimate actionWithAnimation:Anim restoreOriginalFrame:NO];
	
	[hero runAction:action1];
	
	
	
}


- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView: [touch view]];
	
	CGPoint point1 =  [[CCDirector sharedDirector] convertToGL: point];
	
	
	
	
}







-(void)touchCase
{
	[hero setPosition:ccp(80, 60)];
	self.isTouchEnabled =YES;
	touchCheck=0;
	touchCheckForJump=0;
	[self heroAinmation];
}
 



-(void)removeCase2
{
	if(myIndicator)
	{
		[myIndicator removeFromSuperview];
		myIndicator=nil;
	}
	
	
	
	[backGroundArray release];
	backGroundArray=nil;
	[enemyArray release];
	enemyArray=nil;
	
	[goodArray release];
	goodArray=nil;
	[dummyArray release];
	dummyArray=nil;
	[doveArray release];
	doveArray=nil;
	
	if(lblName1)
	{
		[lblName1 removeFromSuperview];
		lblName1=nil;
    }
	if(lblName2)
	{
		[lblName2 removeFromSuperview];
		lblName2=nil;
    }
	if(lblName3)
	{
		[lblName3 removeFromSuperview];
		lblName3=nil;
    }
	
	if(lblName4)
	{
		[lblName4 removeFromSuperview];
		lblName4=nil;
    }
	if(lblName5)
	{
		[lblName5 removeFromSuperview];
		lblName5=nil;
    }
	if(lblName6)
	{
		[lblName6 removeFromSuperview];
		lblName6=nil;
    }
	if(lblName7)
	{
		[lblName7 removeFromSuperview];
		lblName7=nil;
    }
	if(lblName8)
	{
		[lblName8 removeFromSuperview];
		lblName8=nil;
    }
	if(lblName9)
	{
		[lblName9 removeFromSuperview];
		lblName9=nil;
    }
	if(lblName10)
	{
		[lblName10 removeFromSuperview];
		lblName10=nil;
    }
	
	
	if(buttonForFood1)
	{
		[buttonForFood1 removeFromSuperview];
		buttonForFood1=nil;
	}
	
	if(buttonForFood2)
	{
		[buttonForFood2 removeFromSuperview];
		buttonForFood2=nil;
	}
	if(buttonForFood3)
	{
		[buttonForFood3 removeFromSuperview];
		buttonForFood3=nil;
	}
	if(buttonForFood4)
	{
		[buttonForFood4 removeFromSuperview];
		buttonForFood4=nil;
	}
	if(buttonForFood5)
	{
		[buttonForFood5 removeFromSuperview];
		buttonForFood5=nil;
	}
	if(buttonForFood6)
	{
		[buttonForFood6 removeFromSuperview];
		buttonForFood6=nil;
	}
	if(buttonForFood7)
	{
		[buttonForFood7 removeFromSuperview];
		buttonForFood7=nil;
	}
	if(buttonForFood8)
	{
		[buttonForFood8 removeFromSuperview];
		buttonForFood8=nil;
	}
	if(buttonForFood9)
	{
		[buttonForFood9 removeFromSuperview];
		buttonForFood9=nil;
	}
	if(buttonForFood10)
	{
		[buttonForFood10 removeFromSuperview];
		buttonForFood10=nil;
	}
	[myIndicator stopAnimating];
	[myIndicator removeFromSuperview];
	myIndicator=nil;
	[responceData release];
	responceData=nil;
	[strWhichApiCalled release];
	strWhichApiCalled=nil;
	
	[[CCDirector sharedDirector] purgeCachedData];
	[self unscheduleAllSelectors];
	[[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
	[[CCTextureCache sharedTextureCache] removeAllTextures];
	if(hero)
	{
	[self removeChild:hero cleanup:YES];
	
	hero=nil;
	}
	if(loading1)
	{
	[self removeChild:loading1 cleanup:YES];
	
	loading1=nil;
     }
    if(loading2)
    {
	[self removeChild:loading2 cleanup:YES];
	
	loading2=nil;
    }
	
	if(loading3)
    {
	[self removeChild:loading3 cleanup:YES];
	
	loading3=nil;
    }
	if(bizDays)
    {
	[self removeChild:bizDays cleanup:YES];
	
	bizDays=nil;
    }
 	if(research)
    {
	[self removeChild:research cleanup:YES];
	
	research=nil;
    }
	if(usersVal)
    {
	[self removeChild:usersVal cleanup:YES];
	
	usersVal=nil;
    }
	if(press)
    {
	[self removeChild:press cleanup:YES];
	
	press=nil;
    }
	if(dolar)
    {
	[self removeChild:dolar cleanup:YES];
	
	dolar=nil;
    }
	
	if(starMenu14)
    {
	[self removeChild:starMenu14 cleanup:YES];
	
	starMenu14=nil;
    }

	if(starMenu141)
    {
	[self removeChild:starMenu141 cleanup:YES];
	
	starMenu141=nil;
    }
	
	if(startBackground)
	{
	[self removeChild:startBackground cleanup:YES];
	
	startBackground=nil;
	}
	if(highPhoto)
	{
	[self removeChild:highPhoto cleanup:YES];
	
	highPhoto=nil;
	}
	if(loadingPage)
	{
	[self removeChild:loadingPage cleanup:YES];
	
	loadingPage=nil;
	}
	if(pauseButton1)
	{
	[self removeChild:pauseButton1 cleanup:YES];
	
	pauseButton1=nil;
	}
	if(backGroundForPause)
	{
	[self removeChild:backGroundForPause cleanup:YES];
	
	backGroundForPause=nil;
	}
		
	/*[touchY release];
	[backGroundSpeed release];
	[enemyCreationSpeed release];
	[bizDaysScore release];
	[researchScore release];
	[usersValScore release];
	[pressScore release];
	[dolarScore release];
	[extraLife release];
	[selection release];
	[touchCheck release];
	[touchCheckForJump release];
	
	[backgroundValue release];
	[fade release];
	[slideCaseSound release];
	[start release];
	[HighScore release];
	[highScoreCheck release];
	[arrImageNo release];
	[lessOpacity release];
	
	[dolarValue release];
	[xt release];
	[yt release];
	
	touchY=nil;
	backGroundSpeed=nil;
	enemyCreationSpeed=nil;
	bizDaysScore=nil;
	researchScore=nil;
	usersValScore=nil;
	pressScore=nil;
	dolarScore=nil;
	extraLife=nil;
	selection=nil;
	touchCheck=nil;
	touchCheckForJump=nil;
	backgroundValue=nil;
	fade=nil;
	slideCaseSound=nil;
	start=nil;
	HighScore=nil;
	highScoreCheck=nil;
	arrImageNo=nil;
	lessOpacity=nil;
	
	dolarValue=nil;
	xt=nil;
	yt=nil;*/
}



// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	if(myIndicator)
	{
		[myIndicator removeFromSuperview];
		myIndicator=nil;
	}
	
	
		
	[backGroundArray release];
	backGroundArray=nil;
	[enemyArray release];
	enemyArray=nil;
	
	[goodArray release];
	goodArray=nil;
	[dummyArray release];
	dummyArray=nil;
	[doveArray release];
	doveArray=nil;
	
	if(lblName1)
	{
		[lblName1 removeFromSuperview];
	lblName1=nil;
    }
	if(lblName2)
	{
		[lblName2 removeFromSuperview];
		lblName2=nil;
    }
	if(lblName3)
	{
		[lblName3 removeFromSuperview];
		lblName3=nil;
    }
	
	if(lblName4)
	{
		[lblName4 removeFromSuperview];
		lblName4=nil;
    }
	if(lblName5)
	{
		[lblName5 removeFromSuperview];
		lblName5=nil;
    }
	if(lblName6)
	{
		[lblName6 removeFromSuperview];
		lblName6=nil;
    }
	if(lblName7)
	{
		[lblName7 removeFromSuperview];
		lblName7=nil;
    }
	if(lblName8)
	{
		[lblName8 removeFromSuperview];
		lblName8=nil;
    }
	if(lblName9)
	{
		[lblName9 removeFromSuperview];
		lblName9=nil;
    }
	if(lblName10)
	{
		[lblName10 removeFromSuperview];
		lblName10=nil;
    }
	
	
	if(buttonForFood1)
	{
		[buttonForFood1 removeFromSuperview];
		buttonForFood1=nil;
	}
	
	if(buttonForFood2)
	{
		[buttonForFood2 removeFromSuperview];
		buttonForFood2=nil;
	}
	if(buttonForFood3)
	{
		[buttonForFood3 removeFromSuperview];
		buttonForFood3=nil;
	}
	if(buttonForFood4)
	{
		[buttonForFood4 removeFromSuperview];
		buttonForFood4=nil;
	}
	if(buttonForFood5)
	{
		[buttonForFood5 removeFromSuperview];
		buttonForFood5=nil;
	}
	if(buttonForFood6)
	{
		[buttonForFood6 removeFromSuperview];
		buttonForFood6=nil;
	}
	if(buttonForFood7)
	{
		[buttonForFood7 removeFromSuperview];
		buttonForFood7=nil;
	}
	if(buttonForFood8)
	{
		[buttonForFood8 removeFromSuperview];
		buttonForFood8=nil;
	}
	if(buttonForFood9)
	{
		[buttonForFood9 removeFromSuperview];
		buttonForFood9=nil;
	}
	if(buttonForFood10)
	{
		[buttonForFood10 removeFromSuperview];
		buttonForFood10=nil;
	}
	[myIndicator stopAnimating];
		[responceData release];
	responceData=nil;
	[strWhichApiCalled release];
	strWhichApiCalled=nil;
	
	[[CCDirector sharedDirector] purgeCachedData];
	[self unscheduleAllSelectors];
	[[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
	[[CCTextureCache sharedTextureCache] removeAllTextures];
	[super dealloc];
}
@end
