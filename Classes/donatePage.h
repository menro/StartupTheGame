//
//  HelloWorldLayer.h
//  submarine
//
//  Created by MADAN MOHAN PANDIT on 28/02/12.
//  Copyright HOME 2012. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "HUDLayer.h"
#import "HelloWorldScene.h"
#import "labelSelection.h"
#import "menuPage.h"
#import "postScore.h"
#import "ModalAlert.h"
#import "MyTools.h"
#import "SHK.h"
#import "SHKFacebook.h"
#import "SHKTwitter.h"
// HelloWorld Layer
@interface donatePage : CCLayer
{
	CCSprite *backGround;
	UIScrollView *scrollView1;
	UIScrollView *scrollView2;
	int k;
	NSMutableData *responceData;
	NSString *strWhichApiCalled;
	
	MyTools *tools;
	UITextView *loadingView;
	UIActivityIndicatorView *spinner1;
	
	UITextField *name;
}
-(void) startOfGame;
-(void)allButtons;
-(void)donateAndTwit;
-(void)donate;
-(void)addNew;
-(void)goToMainMenu;
-(void)goToMain;

// returns a Scene that contains the HelloWorld as the only child
+(id) scene;

@end
