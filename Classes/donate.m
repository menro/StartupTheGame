// Import the interfaces
#import "donate.h"
#import "JSON.h"
// HelloWorld implementation
@implementation donate
#define URL1 @"http://addoncon.com/twitterapp/index.php?"
const NSUInteger kNumImages1		= 25;
const CGFloat kScrollObjWidth1	= 62.0;

+(id) scene
{
	CCScene *scene = [CCScene node];
    
    HUDsound *hud = [HUDsound node];
    [scene addChild:hud z:1];
    
    donate *layer = [[[donate alloc] initWithHUD:hud] autorelease];
    [scene addChild:layer];
    
    return scene;
}



- (id)initWithHUD:(HUDLayer *)hud
{
    if ((self = [super init])) 
	{
		
		[self donateAndTwit];
		[self startOfGame];
    }
    return self;
}



// on "init" you need to initialize your instance
-(void) startOfGame
{	
	int enemyVal = [[NSUserDefaults standardUserDefaults] integerForKey:@"enemy"];
	
	int backgroundValue = [[NSUserDefaults standardUserDefaults] integerForKey:@"backValue"];
	
	
		
	NSArray *starsArray2;
	if(backgroundValue==1)
		starsArray2 = [NSArray arrayWithObjects:@"noTraction", nil];
	else if(backgroundValue==2)
		starsArray2 = [NSArray arrayWithObjects:@"bugs",@"gatekeeper", nil];
	else if(backgroundValue==3)
		starsArray2 = [NSArray arrayWithObjects:@"bugs",@"badPress", nil];
	else if(backgroundValue==4)
		starsArray2 = [NSArray arrayWithObjects:@"bugs",@"badPress",@"HR", nil];
	else if(backgroundValue==5)
		starsArray2 = [NSArray arrayWithObjects:@"bugs",@"badPress",@"HR",@"competition", nil];
	
	
	NSString * str=[starsArray2 objectAtIndex:enemyVal-1];
	
	
	CCLabelTTF *reason = [CCLabelTTF labelWithString:@""  
										  dimensions: CGSizeMake(450.0, 20.0) 
										   alignment: UITextAlignmentLeft
											fontName:@"courier" 
											fontSize:12];
	reason.position = ccp(384,230);
	[reason setColor:ccBLACK];
	[self addChild:reason z:699];
	
	//[reason setString:[NSString stringWithString:str]];
	
	
	
	
	int day = [[NSUserDefaults standardUserDefaults] integerForKey:@"bizDaysScore"];
	
	
	
	int research = [[NSUserDefaults standardUserDefaults] integerForKey:@"researchScore"];
	
	
	
	int user =[[NSUserDefaults standardUserDefaults] integerForKey:@"usersValScore"];
	
	
	int press = [[NSUserDefaults standardUserDefaults] integerForKey:@"pressScore"];
	
	
	
	int dolarScore =[[NSUserDefaults standardUserDefaults] integerForKey:@"dolarScore"];
	
	
	
	
	NSString *strscore=[NSString stringWithFormat:@"%d",day];
	
	NSString *indro=@" days, ";
	
	NSString *finalstr=[strscore stringByAppendingString:indro];
	
	
	NSString *strscore1=[NSString stringWithFormat:@"%d",research];
	
	NSString *indro1=@" research, ";
	
	NSString *finalstr1=[strscore1 stringByAppendingString:indro1];
	
	
	NSString *strscore2=[NSString stringWithFormat:@"%d",user];
	
	NSString *indro2=@" users, ";
	
	NSString *finalstr2=[strscore2 stringByAppendingString:indro2];
	
	
	NSString *strscore3=[NSString stringWithFormat:@"%d",press];
	
	NSString *indro3=@" articles  and  $";
	
	NSString *finalstr3=[strscore3 stringByAppendingString:indro3];
	
	NSString *strscoreDolar=[NSString stringWithFormat:@"%d",dolarScore];
	
	
	NSString *finalstr4=[finalstr stringByAppendingString:finalstr1];
	
	
	NSString *finalstr5=[finalstr4 stringByAppendingString:finalstr2];
	
	NSString *finalstr6=[finalstr3 stringByAppendingString:strscoreDolar];
	
	CCLabelTTF *pressCase = [CCLabelTTF labelWithString:@""  
											 dimensions: CGSizeMake(450.0, 20.0) 
											  alignment: UITextAlignmentLeft
											   fontName:@"courier" 
											   fontSize:12];
	pressCase.position = ccp(238,182);
	[pressCase setColor:ccBLACK];
	[self addChild:pressCase z:699];
	
	
	[pressCase setString:[NSString stringWithString:finalstr5]];
	
	CCLabelTTF *dolar = [CCLabelTTF labelWithString:@""  
										 dimensions: CGSizeMake(460.0, 20.0) 
										  alignment: UITextAlignmentLeft
										   fontName:@"courier" 
										   fontSize:12];
	dolar.position = ccp(248,164);
	[dolar setColor:ccBLACK];
	[self addChild:dolar z:699];
	
	[dolar setString:[NSString stringWithString:finalstr6]];
	
	
	
	int yy =[[NSUserDefaults standardUserDefaults] integerForKey:@"totalScore"];
	
	CCLabelTTF *totalVal = [CCLabelTTF labelWithString:@""  
											dimensions: CGSizeMake(120.0, 120.0) 
											 alignment: UITextAlignmentLeft
											  fontName:@"courier" 
											  fontSize:16];
	totalVal.position = ccp(234,182);
	
	[totalVal setColor:ccBLACK];
	[self addChild:totalVal z:199];
	NSString *str1212=[NSString stringWithFormat:@"%d",yy];
	[totalVal setString:[NSString stringWithString:str1212]];	
	
	//[self submitScore];
	
	[[CCDirector sharedDirector] resume] ;
	[[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
	
	backGround = [CCSprite spriteWithFile:@"donatea1.png"];
	backGround.position = ccp(240, 160); 
	backGround.scale=1;
	[self addChild:backGround  z:-2]; 
	
	CCMenuItemImage *starMenuItem11 = [CCMenuItemImage 
									   itemFromNormalImage:@"PlayAgainUp.png" selectedImage:@"PlayAgaindown.png" 
									   target:self selector:@selector(playAgain)];
	starMenuItem11.position = ccp(110, 260);
	
	CCMenu *starMenu11 = [CCMenu menuWithItems:starMenuItem11, nil];
	starMenu11.position = CGPointZero;
	starMenu11.scale=1.2;
	[self addChild:starMenu11 z:44];
	
		
	
	CCMenuItemImage *starMenuItem14 = [CCMenuItemImage 
									   itemFromNormalImage:@"MainMenuUp.png" selectedImage:@"MainMenuDown.png" 
									   target:self selector:@selector(goToMainMenu)];
	starMenuItem14.position = ccp(220, 260);
	
	CCMenu *starMenu14 = [CCMenu menuWithItems:starMenuItem14, nil];
	starMenu14.position = CGPointZero;
	starMenu14.scale=1.2;
	[self addChild:starMenu14 z:44];
	
		
	scrollView2 = [[UIScrollView alloc] initWithFrame:CGRectMake(-2,264,482,80)];//-2,278,482,42
	[scrollView2 setBackgroundColor:[UIColor clearColor]];
	scrollView2.clipsToBounds = YES;		// default is NO, we want to restrict drawing within our scrollview
	scrollView2.scrollEnabled = YES;
	
	scrollView2.showsHorizontalScrollIndicator=NO;
	scrollView2.showsVerticalScrollIndicator=NO;
	scrollView2.pagingEnabled=NO;
	scrollView2.clipsToBounds = YES;
	
	
	
	NSArray *starsArray1 = [NSArray arrayWithObjects:@"1.png",@"2.png",@"3.png",@"4.png",@"5.png",@"6.png",@"7.png",@"8.png",@"9.png",@"10.png",@"11.png",@"12.png",@"13.png",@"14.png",@"15.png",@"16.png",@"17.png",@"18.png",@"19.png",@"20.png",@"21.png",@"22.png",@"23.png",@"24.png",@"25.png",nil];
	
	int x=5;
	for (int i = 0; i < [starsArray1 count]; i++)
	{
		
		UIButton *buttonForFood=[UIButton buttonWithType:UIButtonTypeCustom];
		buttonForFood.tag=i+1;
		[buttonForFood setImage:[UIImage imageNamed:[starsArray1 objectAtIndex:i]] forState: UIControlStateNormal];
		[buttonForFood addTarget:self action:@selector(ClickImage) forControlEvents:UIControlEventTouchUpInside];
		buttonForFood.frame = CGRectMake(x, 6, 40, 40);
		x=buttonForFood.frame.origin.x + buttonForFood.frame.size.width + 14.;
		[scrollView2 addSubview:buttonForFood];
	}
	scrollView2.contentSize = CGSizeMake(52,scrollView2.frame.size.height);
	//[scrollView2 setContentSize:CGSizeMake(scrollView2.frame.size.width, scrollView2.frame.size.height)];
	[scrollView2 setScrollEnabled:YES];
	
	[[[CCDirector sharedDirector]openGLView] addSubview:scrollView2];
	[self layoutScrollImages];
	
	
	
	
}


-(void)playAgain
{
	
	
	if(scrollView2)
	{
		[scrollView2   removeFromSuperview];
		scrollView2=nil;
	}
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[HelloWorld scene]];
}


- (void)layoutScrollImages
{
	UIImageView *view = nil;
	NSArray *subviews = [scrollView2 subviews];
	
	// reposition all image subviews in a horizontal serial fashion
	CGFloat curXLoc = 0;
	for (view in subviews)
	{
		if ([view isKindOfClass:[UIImageView class]] && view.tag > 0)
		{
			CGRect frame = view.frame;
			frame.origin = CGPointMake(curXLoc, 0);
			view.frame = frame;
			
			curXLoc += (kScrollObjWidth1);
		}
	}
	
	// set the content size so it can be scrollable
	[scrollView2 setContentSize:CGSizeMake((kNumImages1 * kScrollObjWidth1),40)];
}

-(void)goToMainMenu
{
	//[scrollView1   removeFromSuperview];
	//scrollView1=nil;
	[scrollView2   removeFromSuperview];
	scrollView2=nil;
	
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[menuPage scene]];
}



-(void)ClickImage
{
	UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"SORRY" message:@"You have donated your score.Please play again"
													delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert1 show];    
	[alert1 release];
}



-(void)donateAndTwit
{
	[self donate];
	
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	
	// getting an NSString
	NSString *myString = [prefs stringForKey:@"companyname"];
	
	int yy = [[NSUserDefaults standardUserDefaults] integerForKey:@"totalScore"];
	//NSArray *starsArray1 = [NSArray arrayWithObjects:@"BackflipStudios",@"Dropbox",@"etsy",@"Flipboard",@"fullcontact",@"getglue",@"gnip",@"gosphero",@"intlcandy",@"Makerbot",@"Monderoblabs",@"occipital",@"OpenspaceStore",@"pandodaily",@"Path",@"Pinterest",@"push.io",@"Quora",@"SimpleEnergy",@"techstars",@"templerun",@"thefancy",@"trada",@"Urbanairship",@"Zynga",nil];
	
	/*same one as before:
	 
	 I'm donating "935" points to my favorite startup "OpenspaceStore" and trying to get them a free ad in Startup The Game.
	 [[NSUserDefaults standardUserDefaults] setInteger:tagg forKey:@"buttonVal"];
	 replace "" with actual data*/
	NSString *strscore=[NSString stringWithFormat:@"%d",yy];
	//NSString *strscore=@"a";//[NSString stringWithFormat:@"%d",[[SaveInformation Getclientinfo:@"level1"] intValue]];
	NSString *indro=@"I donated my ";
	
	NSString *finalstr=[indro stringByAppendingString:strscore];
	NSString *finalstr1=@"' pts 2 get @ ";
	
	NSString *finalstr2=[finalstr stringByAppendingString:finalstr1];
	
	NSString *finalstrName=myString;
	
	NSString *finalstrNameAdd=[finalstr2 stringByAppendingString:finalstrName];
	
	NSString *finalstr3=@"'  integrated into #StartUpTheGame. Play the free IOS game and promote your favorite startup.";
	
	NSString *finalstr4=[finalstrNameAdd stringByAppendingString:finalstr3];
	
	SHKItem *item = [SHKItem text:finalstr4];
	[SHKTwitter shareItem:item];
}

-(void)donate
{
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	
	// getting an NSString
	NSString *myString = [prefs stringForKey:@"companyname"];
	
	int yy = [[NSUserDefaults standardUserDefaults] integerForKey:@"totalScore"];
	
	printf("%d",yy);
	
	strWhichApiCalled=@"Submit Company Score";
	
	//http://addoncon.com/twitterapp/index.php?action=submitusername&username=smondalobj&score=25

    NSString *post =[NSString stringWithFormat:@"action=%@&username=%@&score=%d",@"submitusername",myString,yy];
	NSLog(@"PostString=%@",post);
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	[request setURL:[NSURL URLWithString:URL1]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:postData];
	
	
	NSURLConnection *conn=[[[NSURLConnection alloc] initWithRequest:request delegate:self] autorelease];
	if(conn)
	{
		NSLog(@"Connected");
		
	}
	else
		
		NSLog(@"Not Connected");
	
	[request release],request=nil;
	
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	NSLog(@"HERE RESPONSE: %d",[(NSHTTPURLResponse*) response statusCode]);
	NSLog(@"response: %@",[response description]);
	responceData=[[NSMutableData alloc] init];
	
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	NSLog(@"ERROR..........%@",[error localizedDescription]);
	UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"SORRY" message:[error localizedDescription]
													delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert1 show];    
	[alert1 release];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[responceData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	//[tools stopLoading:loadingView];
	NSString *responseString=[[NSString alloc] initWithData:responceData encoding:NSUTF8StringEncoding]; 
    
    NSLog(@"RESPONSE:%@",responseString);
    
	/*id dict = [responseString  JSONValue];
	if([strWhichApiCalled isEqualToString:@"Submit Company Score"])
	{
        if([[NSString stringWithFormat:@"%@",[dict objectForKey:@"status"]] isEqualToString:@"1"])
        {
            NSString *strmsg=[dict objectForKey:@"msg"];
            
            UIAlertView *alertWarning = [[UIAlertView alloc]initWithTitle:@"Information" 
                                                                  message:strmsg 
                                                                 delegate:self 
                                                        cancelButtonTitle:@"OK" 
                                                        otherButtonTitles:nil];
            [alertWarning show];
            [alertWarning release];
			[self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:2],
							 [CCCallFuncN actionWithTarget:self selector:@selector(goToMainMenu)],
							 nil]];
        }
        else
        {
            UIAlertView *alertWarning = [[UIAlertView alloc]initWithTitle:@"Information" 
                                                                  message:@"Score not post." 
                                                                 delegate:self 
                                                        cancelButtonTitle:@"OK" 
                                                        otherButtonTitles:nil];
            [alertWarning show];
            [alertWarning release];
        }
	}
	else
	{
		;
	}*/

}


-(void)foodCRE01Video
{
	
}



-(void)addNew
{
	//[scrollView1   removeFromSuperview];
	//scrollView1=nil;
	[scrollView2   removeFromSuperview];
	scrollView2=nil;
	[name removeFromSuperview];
	name=nil;
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[postScore scene]];
	
}



-(void)goToMain
{
	[scrollView2   removeFromSuperview];
	scrollView2=nil;
	[name removeFromSuperview];
	name=nil;
	//[scrollView1   removeFromSuperview];
	//scrollView1=nil;
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[menuPage scene]];
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
		
	
	[responceData release];
	responceData=nil;
	[strWhichApiCalled release];
	strWhichApiCalled=nil;
	
	[[CCDirector sharedDirector] purgeCachedData];
	[self unscheduleAllSelectors];
	[[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
	[[CCTextureCache sharedTextureCache] removeAllTextures];
	[super dealloc];
}
@end
