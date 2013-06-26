// Import the interfaces
#import "donatePage.h"
#import "JSON.h"
// HelloWorld implementation
@implementation donatePage
#define URL1 @"http://addoncon.com/twitterapp/index.php?"


+(id) scene
{
	CCScene *scene = [CCScene node];
    
    HUDsound *hud = [HUDsound node];
    [scene addChild:hud z:1];
    
    donatePage *layer = [[[donatePage alloc] initWithHUD:hud] autorelease];
    [scene addChild:layer];
    
    return scene;
}



- (id)initWithHUD:(HUDLayer *)hud
{
    if ((self = [super init])) 
	{
		[self startOfGame];
    }
    return self;
}



// on "init" you need to initialize your instance
-(void) startOfGame
{	
	
	CCSprite *backGround2 = [CCSprite spriteWithFile:@"addfavoritek.png"];
	backGround2.position = ccp(240, 160); 
	
	[self addChild:backGround2  z:300]; 
	
	k=0;
	
	CCMenuItemImage *starMenuItem11 = [CCMenuItemImage 
									   itemFromNormalImage:@"MainMenuUp.png" selectedImage:@"MainMenuDown.png" 
									   target:self selector:@selector(goToMain)];
	starMenuItem11.position = ccp(380, 275);
	
	CCMenu *starMenu11 = [CCMenu menuWithItems:starMenuItem11, nil];
	starMenu11.position = CGPointZero;
	starMenu11.scale=1.2;
	[self addChild:starMenu11 z:644];
	
	/*CCMenuItem *starMenuItem12 = [CCMenuItemImage 
	 itemFromNormalImage:@"AddNewStartupUp.png" selectedImage:@"AddNewStartupDown.png" 
	 target:self selector:@selector(addNew)];
	 starMenuItem12.position = ccp(375, 80);
	 
	 CCMenu *starMenu12 = [CCMenu menuWithItems:starMenuItem12, nil];
	 starMenu12.position = CGPointZero;
	 starMenu12.scale=1.2;
	 [self addChild:starMenu12 z:44];*/
	
	
	CCMenuItemImage *starMenuItem14 = [CCMenuItemImage 
									   itemFromNormalImage:@"dtupakp.png" selectedImage:@"dtdownakp.png" 
									   target:self selector:@selector(donateAndTwit)];
	starMenuItem14.position = ccp(385, 170);
	
	CCMenu *starMenu14 = [CCMenu menuWithItems:starMenuItem14, nil];
	starMenu14.position = CGPointZero;
	
	[self addChild:starMenu14 z:644];
	
	
	
	CCMenuItemImage *starMenuItem143 = [CCMenuItemImage 
									   itemFromNormalImage:@"dupak.png" selectedImage:@"ddownak.png" 
									   target:self selector:@selector(donate)];
	starMenuItem143.position = ccp(215, 170);
	
	CCMenu *starMenu143 = [CCMenu menuWithItems:starMenuItem143, nil];
	starMenu143.position = CGPointZero;
	
	[self addChild:starMenu143 z:644];
	
	
	
	
	[self allButtons];
	
}




-(void)allButtons
{
	
	name=[[UITextField alloc]initWithFrame:CGRectMake(16, 78,450,40)];
	name.autocapitalizationType=NO;
	//name.borderStyle=UITextBorderStyleNone;
	//name.placeholder=@"Type Message";
	//name.keyboardType=UIKeyboardTypeAlphabet;
	name.text=@"";
	name.textColor=[UIColor blackColor];
	
	//name.keyboardAppearance=UIKeyboardAppearanceAlert;
	name.delegate=self;
	
	[name setBackgroundColor:[UIColor clearColor]];
	[[[CCDirector sharedDirector]openGLView] addSubview:name];
	
}




-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[name resignFirstResponder];
	return YES;
}


-(void)donateAndTwit
{
	if([name.text length]==0)
	{
		UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"SORRY" message:@"Please select A company name"
														delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert1 show];    
		[alert1 release];
		
	}
	
	else if(k==0 && ([name.text length]>0))
	{
	[self donate];
	
		NSString *myString = name.text;//[prefs stringForKey:@"companyname"];
	
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
	NSString *finalstr1=@" pts 2 get @";
	
	NSString *finalstr2=[finalstr stringByAppendingString:finalstr1];
	
	NSString *finalstrName=myString;
	
	NSString *finalstrNameAdd=[finalstr2 stringByAppendingString:finalstrName];
	
	NSString *finalstr3=@"  integrated into #StartUpTheGame. Play the free IOS game and promote your favorite startup.";
	
	NSString *finalstr4=[finalstrNameAdd stringByAppendingString:finalstr3];
	
	SHKItem *item = [SHKItem text:finalstr4];
	[SHKTwitter shareItem:item];	
		k=10;
	}
	else if(k!=0)
	{
		
		UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"SORRY" message:@"You have donated your score.Please play again"
														delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert1 show];    
		[alert1 release];
	}
}

-(void)donate
{
	if(k==0)
	{
	int yy = [[NSUserDefaults standardUserDefaults] integerForKey:@"totalScore"];
	//int tagg = [[NSUserDefaults standardUserDefaults] integerForKey:@"buttonVal"];
	
	//printf("%d",yy);
	//name.text=@"";
	//printf("%d",yy);
	strWhichApiCalled=@"Submit Company Score";
	
    //http://addoncon.com/twitterapp/index.php?action=submitusername&username=smondalobj&score=25
    
	
    NSString *post =[NSString stringWithFormat:@"action=%@&username=%@&score=%d",@"submitusername",name.text,yy];
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
		k=1;
	}
	else 
	{
		
		UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"SORRY" message:@"You have donated your score.Please play again"
														delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert1 show];    
		[alert1 release];
	}

	
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
    
	id dict = [responseString  JSONValue];
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
                                                                  message:@"User name is not valid." 
                                                                 delegate:self 
                                                        cancelButtonTitle:@"OK" 
                                                        otherButtonTitles:nil];
            [alertWarning show];
            [alertWarning release];
			k=0;
        }
	}
	else {
		;
	}

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

-(void)goToMainMenu
{
	//[scrollView1   removeFromSuperview];
	//scrollView1=nil;
	[scrollView2   removeFromSuperview];
	scrollView2=nil;
	[name   removeFromSuperview];
	name=nil;
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[menuPage scene]];
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
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
