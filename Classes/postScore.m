//
//  HelloWorldLayer.m
//  submarine
//
//  Created by MADAN MOHAN PANDIT on 28/02/12.
//  Copyright HOME 2012. All rights reserved.
//

// Import the interfaces
#import "postScore.h"

// HelloWorld implementation
@implementation postScore

+(id) scene
{
	CCScene *scene = [CCScene node];
    
    HUDsound *hud = [HUDsound node];
    [scene addChild:hud z:1];
    
    postScore *layer = [[[postScore alloc] initWithHUD:hud] autorelease];
    [scene addChild:layer];
    
    return scene;
}



- (id)initWithHUD:(HUDLayer *)hud
{
    if ((self = [super init])) 
	{
         [self startOfGame];
    }
    return self;
}



// on "init" you need to initialize your instance
-(void) startOfGame
{	
	[[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
	CCSprite * backGroundBlack = [CCSprite spriteWithFile:@"blackBig.png"];
	backGroundBlack.position = ccp(240, 160); 
	
	[self addChild:backGroundBlack]; 
	CCMenuItem *starMenuItem14 = [CCMenuItemImage 
								  itemFromNormalImage:@"MainMenuUp.png" selectedImage:@"MainMenuDown.png" 
								  target:self selector:@selector(goToMainMenu)];
	starMenuItem14.position = ccp(375, 80);
	
	CCMenu *starMenu14 = [CCMenu menuWithItems:starMenuItem14, nil];
	starMenu14.position = CGPointZero;
	starMenu14.scale=1.2;
	[self addChild:starMenu14 z:644];
	name=[[UITextField alloc]initWithFrame:CGRectMake(60, 40,170,40)];
	name.borderStyle=UITextBorderStyleNone;
	name.placeholder=@"put company name";
	name.keyboardType=UIKeyboardTypeAlphabet;
	name.textColor=[UIColor whiteColor];
	//name.keyboardAppearance=UIKeyboardAppearanceAlert;
	name.delegate=self;
	name.returnKeyType=UIReturnKeyDone;
	[[[CCDirector sharedDirector]openGLView] addSubview:name];
}


-(BOOL)textFieldShouldReturn:(UITextField *)theTextField 
{
	[name  resignFirstResponder];
	return YES;
}


-(void)goToMainMenu
{
	[name   removeFromSuperview];
	name=nil;
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[menuPage scene]];
	
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	[[CCDirector sharedDirector] purgeCachedData];
	[self unscheduleAllSelectors];
	[[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
	[[CCTextureCache sharedTextureCache] removeAllTextures];
	[super dealloc];
}
@end
