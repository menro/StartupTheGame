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
#import "HelloWorldScene.h"
//#import "instrPage.h"
/*#import "HelloWorldScene.h"
#import "menuPage.h"
#import "HelloWorldScene.h"
#import "label2.h"
#import "gameLoading.h"
#import "gameLoading1.h"
#import "gameLoading2.h"
#import "SimpleAudioEngine.h"*/

@interface tutorial : CCLayer 
{
	UIScrollView *scrollView1;
  
}
+(id) scene;
-(void) startOfGame;
-(void)goToMain;
@end
