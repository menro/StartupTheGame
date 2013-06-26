//
//  nextStage1.h
//  Ninjaboy
//
//  Created by Objectsol on 16/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
//#import "gameEnd.h"
#import "labelSelection.h"
#import "menuPage.h"
#import "HelloWorldScene.h"
#import "HUDsound.h"
#import "labelSelection.h"
#import "about.h"
#import "tutorial.h"
#import "insPage.h"
#import "otherGames.h"
#import "GameKitHelper.h"


//#import "SimpleAudioEngine.h"
@interface menuPage : CCLayer <UIWebViewDelegate>
{
	
	CCMenuItemImage * _plusItem, *	_minusItem;
	CCMenuItemImage * _plusItem1, *	_minusItem1;
	UIWebView *vw_img1;
	CCSprite *scroll;
	//UIButton *btnimgvAlShow;
}

-(void) startOfGame;
-(void)soundCase;
- (void)plusMinusButtonTapped:(id)sender; 

-(void)musicCase;
- (void)plusMinusButtonTapped1:(id)sender; 
-(void)otherGamesCase;
-(void)buttonPressed;
-(void)tutorialPage;
-(void)aboutPage;
-(void)levelSelectionPage;
-(void)needToStart2;

@end
