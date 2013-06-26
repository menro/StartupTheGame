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
//#import "SimpleAudioEngine.h"
@interface otherGames : CCLayer <UIWebViewDelegate>
{
	//CCMenuItem *_plusItem; 
	//CCMenuItem *_minusItem;
	UIScrollView *scrollView1;
	CCMenuItemImage * _plusItem, *	_minusItem;
	CCMenuItemImage * _plusItem1, *	_minusItem1;
	UIWebView *vw_img1;
	//UIButton *btnimgvAlShow;
}
-(void) startOfGame;
- (void)viewWillDisappear;
-(void)otherGamesCase;
-(void)buttonPressed;
-(void)levelSelectionPage;
-(void)needToStart2;
@end
