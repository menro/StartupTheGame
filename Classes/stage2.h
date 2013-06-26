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
#import "donate.h"
#import "openspaceAppDelegate.h"
#import "donatePage.h"
#import "ASYImage.h"

// HelloWorld Layer
@interface stage2 : CCLayer
{
	int p;
	CCSprite *backGround;
	UIScrollView *scrollView1;
	UIScrollView *scrollView2;
	
	NSMutableData *responceData;
	NSString *strWhichApiCalled;
	NSMutableArray *arrPic,* arrLabel,*arrPic1,* arrLabel1;
	/*MyTools *tools;
	UIView *loadingView;
	UIActivityIndicatorView *spinner1;*/
	int k;
	
	ASYImage *asyncImage;
	UIActivityIndicatorView *spinner1;
	
	NSMutableArray *arrImage;
	NSMutableArray *arrName;
	NSURLConnection *conn;
	NSURLConnection *conn1;
}
-(void) startOfGame;
-(void)ClickImage:(id)sender;
-(void)donateCase;
-(void)donate;
-(void)fetchTopTwentyfive;
-(void)submitScore;
-(void)allCompany;
- (void)layoutScrollImages;
-(void)foodCRE01Video;
-(void)playAgain;
-(void)addNew;
-(void)goToMainMenu;
-(void)goToMain;
// returns a Scene that contains the HelloWorld as the only child
+(id) scene;

@end
