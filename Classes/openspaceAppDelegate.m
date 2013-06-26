//
//  openspaceAppDelegate.m
//  openspace
//
//  Created by MADAN MOHAN PANDIT on 07/04/12.
//  Copyright HOME 2012. All rights reserved.
//

#import "cocos2d.h"

#import "openspaceAppDelegate.h"
#import "GameConfig.h"
#import "HelloWorldScene.h"
#import "RootViewController.h"
#import "menuPage.h"
#import "stage2.h"
#import "labelSelection2.h"
#import "insPage.h"
@implementation openspaceAppDelegate

@synthesize gameCenterManager;
@synthesize currentScore;
@synthesize currentLeaderBoard;


@synthesize window;

- (void) removeStartupFlicker
{
	//
	// THIS CODE REMOVES THE STARTUP FLICKER
	//
	// Uncomment the following code if you Application only supports landscape mode
	//
#if GAME_AUTOROTATION == kGameAutorotationUIViewController

//	CC_ENABLE_DEFAULT_GL_STATES();
//	CCDirector *director = [CCDirector sharedDirector];
//	CGSize size = [director winSize];
//	CCSprite *sprite = [CCSprite spriteWithFile:@"Default.png"];
//	sprite.position = ccp(size.width/2, size.height/2);
//	sprite.rotation = -90;
//	[sprite visit];
//	[[director openGLView] swapBuffers];
//	CC_ENABLE_DEFAULT_GL_STATES();
	
#endif // GAME_AUTOROTATION == kGameAutorotationUIViewController	
}
- (void) applicationDidFinishLaunching:(UIApplication*)application
{
	// Init the window
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	// Try to use CADisplayLink director
	// if it fails (SDK < 3.1) use the default director
	if( ! [CCDirector setDirectorType:kCCDirectorTypeDisplayLink] )
		[CCDirector setDirectorType:kCCDirectorTypeDefault];
	
	
	CCDirector *director = [CCDirector sharedDirector];
	
	// Init the View Controller
	viewController = [[RootViewController alloc] initWithNibName:nil bundle:nil];
	viewController.wantsFullScreenLayout = YES;
	
	//
	// Create the EAGLView manually
	//  1. Create a RGB565 format. Alternative: RGBA8
	//	2. depth format of 0 bit. Use 16 or 24 bit for 3d effects, like CCPageTurnTransition
	//
	//
	EAGLView *glView = [EAGLView viewWithFrame:[window bounds]
								   pixelFormat:kEAGLColorFormatRGB565	// kEAGLColorFormatRGBA8
								   depthFormat:0						// GL_DEPTH_COMPONENT16_OES
						];
	
	// attach the openglView to the director
	[director setOpenGLView:glView];
	//sleep(3);
//	// Enables High Res mode (Retina Display) on iPhone 4 and maintains low res on all other devices
if( ! [director enableRetinaDisplay:YES] )
	CCLOG(@"Retina Display Not supported");
	
	[[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"music"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	//
	// VERY IMPORTANT:
	// If the rotation is going to be controlled by a UIViewController
	// then the device orientation should be "Portrait".
	//
	// IMPORTANT:
	// By default, this template only supports Landscape orientations.
	// Edit the RootViewController.m file to edit the supported orientations.
	//
#if GAME_AUTOROTATION == kGameAutorotationUIViewController
	[director setDeviceOrientation:kCCDeviceOrientationPortrait];
#else
	[director setDeviceOrientation:kCCDeviceOrientationLandscapeLeft];
#endif
	
	[director setAnimationInterval:1.0/60];
	[director setDisplayFPS:NO];
	[glView setMultipleTouchEnabled:YES];
	
	// make the OpenGLView a child of the view controller
	[viewController setView:glView];
	
	// make the View Controller a child of the main window
	[window addSubview: viewController.view];
	
	[window makeKeyAndVisible];
	sleep(3);
	// Default texture format for PNG/BMP/TIFF/JPEG/GIF images
	// It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
	// You can change anytime.
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];

	
	// Removes the startup flicker
	[self removeStartupFlicker];
	
	// Run the intro Scene
	[[CCDirector sharedDirector] runWithScene: [labelSelection2 scene]];	//labelSelection2
	
	if ([GameCenterManager isGameCenterAvailable]) {
		if(!gameCenterManager)
		{
			
			self.gameCenterManager = [[[GameCenterManager alloc] init] autorelease];
			[self.gameCenterManager setDelegate:self];
			[self.gameCenterManager authenticateLocalUser];
			
		}
	} else {
		
		// The current device does not support Game Center.
		
	}
	//[s
}



- (void) showLeaderboard
{
	
	GKLeaderboardViewController *leaderboardController = [[GKLeaderboardViewController alloc] init];
	if (leaderboardController != NULL) 
	{
		leaderboardController.category = self.currentLeaderBoard;
		leaderboardController.timeScope = GKLeaderboardTimeScopeWeek;
		leaderboardController.leaderboardDelegate = self; 
		//[self presentModalViewController: leaderboardController animated: YES];
		[viewController presentModalViewController: leaderboardController animated: YES];
		[leaderboardController release];
	}
}

- (void) submitScore: (int) nScore 
{
	
	GKScore *scoreReporter = [[[GKScore alloc] initWithCategory:@"111"] autorelease];
	//in his tuturial value = scoreInt, not a label.
	
	//try either i_StartPt or finalStarPt
	if(scoreReporter!=NULL)
	{
	scoreReporter.value =  nScore;
	
	[scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
		if (error != nil)
		{
			NSLog(@"failed!!!");
			
		}
	}];
	}
}

- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *) gkViewController{
	[gkViewController dismissModalViewControllerAnimated: YES];
}


- (void)applicationWillResignActive:(UIApplication *)application {
	[[CCDirector sharedDirector] pause];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	[[CCDirector sharedDirector] resume];
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
	[[CCDirector sharedDirector] purgeCachedData];
}

-(void) applicationDidEnterBackground:(UIApplication*)application {
	[[CCDirector sharedDirector] stopAnimation];
}

-(void) applicationWillEnterForeground:(UIApplication*)application {
	[[CCDirector sharedDirector] startAnimation];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	CCDirector *director = [CCDirector sharedDirector];
	
	[[director openGLView] removeFromSuperview];
	
	[viewController release];
	
	[window release];
	
	[director end];	
}

- (void)applicationSignificantTimeChange:(UIApplication *)application {
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

- (void)dealloc {
	[[CCDirector sharedDirector] release];
	[window release];
	[super dealloc];
}

@end
