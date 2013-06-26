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
#import "stage2.h"
#import "labelSelection.h"
#import "menuPage.h"

// HelloWorld Layer
@interface HelloWorld : CCLayer
{
	NSMutableArray  * backGroundArray;
	NSMutableArray  * enemyArray,* goodArray,* dummyArray,*doveArray;
	
	CCSprite * hero;
	float touchY;
	float backGroundSpeed;
	float enemyCreationSpeed;
	
	CCSprite *loading1,*loading2,*loading3;
	CCLabelTTF * bizDays;
	CCLabelTTF * research;
	CCLabelTTF * usersVal;
	CCLabelTTF * press;
	CCLabelTTF * dolar;
	CCLabelTTF * lifeVal;
	int bizDaysScore;
	int researchScore;
	int usersValScore;
	int pressScore;
	int dolarScore;
	int extraLife;
	CCMenu *starMenu14;
	CCMenu *starMenu141;
	UIActivityIndicatorView *myIndicator;
	int selection;
	int touchCheck;
	int touchCheckForJump;
	
	int backgroundValue;
	CCSprite *startBackground,*highPhoto,*loadingPage;
	int fade;
	int slideCaseSound;
	int start;
	CCMenu *pauseButton1;
	
	CCSprite *backGroundForPause;
	NSMutableData *responceData;
	NSString *strWhichApiCalled;
	int HighScore;
	ALuint soundEffectID;
	int highScoreCheck;
	int arrImageNo;
	int lessOpacity;
	
	int dolarValue;
	int xt;
	int yt;
	NSMutableArray *arrPageurl;
	
	UIButton *buttonForFood1;
	UIButton *buttonForFood2;
	UIButton *buttonForFood3;
	UIButton *buttonForFood4;
	UIButton *buttonForFood5;
	UIButton *buttonForFood6;
	UIButton *buttonForFood7;
	UIButton *buttonForFood8;
	UIButton *buttonForFood9;
	UIButton *buttonForFood10;
	
	UILabel * lblName1;
	UILabel * lblName2;
	UILabel * lblName3;
	UILabel * lblName4;
	UILabel * lblName5;
	UILabel * lblName6;
	UILabel * lblName7;
	UILabel * lblName8;
	UILabel * lblName9;
	UILabel * lblName10;
}

-(void)pauseCase;
-(void)restart;
-(void)mainMenuGo;
-(void)resumeCase;
-(void)checking;
-(void)anotherStart;
-(void)start;
-(void)anotherLoad;
-(void)anotherLoad2;
-(void) startOfGame;
-(void)musicPlay;
-(void)startTime;
-(void)scoreChecking;
-(void)heroAinmation;
-(void)goodCreation;
-(void)anotherGoodCreation;
-(void)startEnemyCreation;
- (void)onEnterTransitionDidFinish:(int) p;
-(void)dolarValueCheck;
- (void)fetch_topCompany1;
-(void)fetch_topCompany;
-(void)fetchHighScore;
-(void)bannerAdd;
-(void)bannerAdd1;
-(void)ClickImage:(id) sender;
-(void)checkCollision;
-(void)removeCase;
-(void)lessOpacityEffect;
-(void)gameOverCase;
-(void)moveBackGroundLeft;
-(void)enemyCreation;
-(void)enemyCreationReal;
-(void)checkBackGround;
-(void)jumpSound;
-(void)soundSlide;
-(void)changeValue;
-(void)touchCheckForJumpChange;
-(void)caseForTouchUp;
-(void)caseForTouchDown;
-(void)jumpAndSlide:(int)p;
-(void)fadeChecking;
-(void)touchCase;
-(void)removeCase2;


// returns a Scene that contains the HelloWorld as the only child
+(id) scene;

@end
