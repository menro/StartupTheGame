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
//#import "gameEnd.h"
#import "labelSelection.h"
#import "menuPage.h"

// HelloWorld Layer
@interface postScore : CCLayer
{
	
	UITextField *name;
}
-(void) startOfGame;
-(void)goToMainMenu;
// returns a Scene that contains the HelloWorld as the only child
+(id) scene;

@end
