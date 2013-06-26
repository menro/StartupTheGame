//
//  HUDLayer.h
//  Raycast
//
//  Created by Ray Wenderlich on 8/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "HelloWorldScene.h"
#import "menuPage.h"
#import "SimpleAudioEngine.h"

@interface HUDsound : CCLayer {
    
	CCMenuItemImage * _plusItem, *	_minusItem;
	
}

- (void)showRestartMenu:(BOOL)won;
- (void)setStatusString:(NSString *)string;

@end
