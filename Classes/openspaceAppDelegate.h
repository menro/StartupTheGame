//
//  openspaceAppDelegate.h
//  openspace
//
//  Created by MADAN MOHAN PANDIT on 07/04/12.
//  Copyright HOME 2012. All rights reserved.
//
#import "AppSpecificValues.h"
#import <GameKit/GameKit.h>

#import "GameCenterManager.h"


#import <UIKit/UIKit.h>
#import "donate.h"
@class GameCenterManager;
#import <UIKit/UIKit.h>
@class RootViewController;

@interface openspaceAppDelegate : NSObject <UIApplicationDelegate,GKLeaderboardViewControllerDelegate, GKAchievementViewControllerDelegate, GameCenterManagerDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
	
	GameCenterManager *gameCenterManager;
	
	int64_t  currentScore;
	
	NSString* currentLeaderBoard;
	
}

- (void) submitScore: (int) nScore;
@property (nonatomic, retain) GameCenterManager *gameCenterManager;
@property (nonatomic, assign) int64_t currentScore;
@property (nonatomic, retain) NSString* currentLeaderBoard;
@property (nonatomic, retain) UILabel *currentScoreLabel;
@property (nonatomic, retain) UIWindow *window;

@end
