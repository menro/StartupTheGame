// Import the interfaces
#import "stage2.h"
#import "JSON.h"
#import "donate.h"
// HelloWorld implementation
@implementation stage2
#define URL1 @"http://addoncon.com/twitterapp/index.php?"

const CGFloat kScrollObjHeight	= 52.0;
const CGFloat kScrollObjWidth	= 62.0;
const NSUInteger kNumImages		= 25;

+(id) scene
{
	CCScene *scene = [CCScene node];
    
    HUDsound *hud = [HUDsound node];
    [scene addChild:hud z:1];
    
    stage2 *layer = [[[stage2 alloc] initWithHUD:hud] autorelease];
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
	
	k=0;
	p=2;
	
	
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
	totalVal.position = ccp(234,176);
	
	[totalVal setColor:ccBLACK];
	[self addChild:totalVal z:199];
	NSString *str1212=[NSString stringWithFormat:@"%d",yy];
	[totalVal setString:[NSString stringWithString:str1212]];
		
	[self submitScore];
	
	[[CCDirector sharedDirector] resume] ;
	[[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
	
	backGround = [CCSprite spriteWithFile:@"donatepageak.png"];
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
								  target:self selector:@selector(goToMain)];
	starMenuItem14.position = ccp(220, 260);
	
	CCMenu *starMenu14 = [CCMenu menuWithItems:starMenuItem14, nil];
	starMenu14.position = CGPointZero;
	starMenu14.scale=1.2;
	[self addChild:starMenu14 z:44];
	
	
	CCMenuItem *starMenuItem12 = [CCMenuItemImage 
	 itemFromNormalImage:@"AddNewStartupUp.png" selectedImage:@"AddNewStartupDown.png" 
	 target:self selector:@selector(addNew)];
	 starMenuItem12.position = ccp(375, 100);
	 
	 CCMenu *starMenu12 = [CCMenu menuWithItems:starMenuItem12, nil];
	 starMenu12.position = CGPointZero;
	 starMenu12.scale=1.2;
	 [self addChild:starMenu12 z:44];
	
	
	[[NSUserDefaults standardUserDefaults] setInteger:10 forKey:@"showHighScore"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	if(arrName)
	{
		[arrName release];
		arrName=nil;
	}
	if(arrImage)
	{
		[arrImage release];
		arrImage=nil;
	}
	
	arrName = [[NSMutableArray alloc] init];
	
	arrImage = [[NSMutableArray alloc] init];
	
    if(!arrPic)
	arrPic=[[NSMutableArray alloc] init];
	if(!arrLabel)
	arrLabel=[[NSMutableArray alloc] init];
	
	
	if(!arrPic1)
		arrPic1=[[NSMutableArray alloc] init];
	if(!arrLabel1)
		arrLabel1=[[NSMutableArray alloc] init];
	
	openspaceAppDelegate * delegate = (openspaceAppDelegate *)([UIApplication sharedApplication].delegate);
	[delegate submitScore: yy];
	
	
	
}


-(void)ClickImage:(id)sender
{
	if(k==0)
	{
	//[tools startLoading:backGround childView:loadingView text:@"Loading"];
	UIButton *butt=(UIButton*)sender;
	
	int tagg=butt.tag;
	//[[NSUserDefaults standardUserDefaults] setInteger:tagg forKey:@"buttonVal"];
	//[[NSUserDefaults standardUserDefaults] synchronize];
	NSString * str=[arrName objectAtIndex:tagg];
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	
	// saving an NSString
	[prefs setObject:str forKey:@"companyname"];
	//[[CCDirector sharedDirector] pause] ;
	//[[CCDirector sharedDirector] replaceScene:[donate scene]];
	[self donateCase];
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

-(void)donateCase
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
	NSString *finalstr1=@" pts 2 get @";
	
	NSString *finalstr2=[finalstr stringByAppendingString:finalstr1];
	
	NSString *finalstrName=myString;
	
	NSString *finalstrNameAdd=[finalstr2 stringByAppendingString:finalstrName];
	
	NSString *finalstr3=@"  integrated into #StartUpTheGame. Play the free IOS game and promote your favorite startup.";
	
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
	
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init]autorelease];
	[request setURL:[NSURL URLWithString:URL1]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:postData];
	
	
	NSURLConnection *conn=[[[NSURLConnection alloc] initWithRequest:request delegate:self] autorelease];
	if(conn)
	{
		//NSLog(@"Connected");
		
	}
	else
		
		//NSLog(@"Not Connected");
	
	[request release],request=nil;
	
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	//NSLog(@"ERROR..........%@",[error localizedDescription]);
	UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"SORRY" message:@"Donating scores to your favorite startup requires an internet connection"
	delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert1 show];    
	[alert1 release];
	
	p=2;
}

-(void)fetchTopTwentyfive
{
	strWhichApiCalled=@"Fetch Top Ten";
	
   // http://addoncon.com/twitterapp/index.php?action=toptwentyfivecheckedscore
    
    NSString *post =[NSString stringWithFormat:@"action=%@",@"toptwentyfivecheckedscore"];
	//NSLog(@"PostString=%@",post);
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init]autorelease];
	[request setURL:[NSURL URLWithString:URL1]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:postData];
	
	
	conn1=[[[NSURLConnection alloc] initWithRequest:request delegate:self] autorelease];
	if(conn1)
	{
		//NSLog(@"Connected");
		
	}
	else
		
		//NSLog(@"Not Connected");
	
	[request release],request=nil;
}

-(void)submitScore
{
	int yy = [[NSUserDefaults standardUserDefaults] integerForKey:@"totalScore"];
	yy=yy+941;
	//printf("%d",yy);
	
	
	strWhichApiCalled=@"Update High Score";
	
    //http://addoncon.com/twitterapp/index.php?action=updatehighscore&score=
    
    NSString *post =[NSString stringWithFormat:@"action=%@&score=%d",@"updatehighscore",yy];
	//NSLog(@"PostString=%@",post);
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init]autorelease] ;
	[request setURL:[NSURL URLWithString:URL1]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:postData];
	
	
	conn=[[[NSURLConnection alloc] initWithRequest:request delegate:self] autorelease];
	if(conn)
	{
		//NSLog(@"Connected");
		
	}
	else
		
		//NSLog(@"Not Connected");
	
	[request release],request=nil;
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	//NSLog(@"HERE RESPONSE: %d",[(NSHTTPURLResponse*) response statusCode]);
	//NSLog(@"response: %@",[response description]);
	responceData=[[NSMutableData alloc] init];
	
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[responceData appendData:data];
}

-(void)allCompany
{
	scrollView2 = [[UIScrollView alloc] initWithFrame:CGRectMake(-2,264,482,80)];//-2,278,482,42
	[scrollView2 setBackgroundColor:[UIColor clearColor]];
	scrollView2.clipsToBounds = YES;		// default is NO, we want to restrict drawing within our scrollview
	scrollView2.scrollEnabled = YES;
	
	scrollView2.showsHorizontalScrollIndicator=NO;
	scrollView2.showsVerticalScrollIndicator=NO;
	scrollView2.pagingEnabled=NO;
	scrollView2.clipsToBounds = YES;
	
	
	
	///NSArray *starsArray1 = [NSArray arrayWithObjects:@"1.png",@"2.png",@"3.png",@"4.png",@"5.png",@"6.png",@"7.png",@"8.png",@"9.png",@"10.png",@"11.png",@"12.png",@"13.png",@"14.png",@"15.png",@"16.png",@"17.png",@"18.png",@"19.png",@"20.png",@"21.png",@"22.png",@"23.png",@"24.png",@"25.png",nil];
	
	int x=5;
	int w=16;
	for (int i = 0; i < [arrImage count]; i++)
	{
		if(scrollView2)
		{
	    
			spinner1= [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(w,16,20,20)]autorelease];
			spinner1.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
			spinner1.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
										 UIViewAutoresizingFlexibleRightMargin |
										 UIViewAutoresizingFlexibleTopMargin |
										 UIViewAutoresizingFlexibleBottomMargin);
			spinner1.backgroundColor=[UIColor clearColor];
			spinner1.opaque=YES;
			w=spinner1.frame.origin.x+spinner1.frame.size.width+43;
			[scrollView2 addSubview:spinner1];
			[spinner1 startAnimating];
			// [arrLabel1 addObject:spinner1];
			
			
			asyncImage = [[[ASYImage alloc] initWithFrame:CGRectMake(x, 2, 40, 40)]autorelease];
			[asyncImage loadImageFromURL:[arrImage objectAtIndex:i]indicator:spinner1];
			// CALayer *l = [asyncImage layer];
			// [l setMasksToBounds:YES];
			// [l setCornerRadius:10.0];
			
			
			[scrollView2 addSubview:asyncImage];
			[arrPic1 addObject:asyncImage];
			UILabel *lblName=[[UILabel alloc]init];
			lblName.frame=CGRectMake(x,44,45,12);
			lblName.backgroundColor=[UIColor whiteColor];
			lblName.text=[arrName objectAtIndex:i];
			lblName.font =[UIFont fontWithName:@"Arial" size:10];
			lblName.textColor=[UIColor blackColor];
			lblName.textAlignment=UITextAlignmentCenter;
			[scrollView2 addSubview:lblName];
			//[lblName release],lblName=nil;
			[arrLabel addObject:lblName];
			UIButton *buttonForFood=[UIButton buttonWithType:UIButtonTypeCustom];
			buttonForFood.tag=i;
			//[buttonForFood setImage:[UIImage imageNamed:[arrImage objectAtIndex:i]] forState: UIControlStateNormal];
			//[buttonForFood setImage:[arrImage objectAtIndex:i] forState: UIControlStateNormal];
			[buttonForFood addTarget:self action:@selector(ClickImage:) forControlEvents:UIControlEventTouchUpInside];
			buttonForFood.frame = CGRectMake(x, 2, 40, 40);
			x=buttonForFood.frame.origin.x + buttonForFood.frame.size.width + 14.;
			[scrollView2 addSubview:buttonForFood];
			[arrPic addObject:buttonForFood];
			
			
		}
		
	}
	scrollView2.contentSize = CGSizeMake(52,scrollView2.frame.size.height);
	//[scrollView2 setContentSize:CGSizeMake(scrollView2.frame.size.width, scrollView2.frame.size.height)];
	[scrollView2 setScrollEnabled:YES];
	
	[[[CCDirector sharedDirector]openGLView] addSubview:scrollView2];
	[self layoutScrollImages];	
	
}




-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	//[tools stopLoading:loadingView];
	NSString *responseString=[[[NSString alloc] initWithData:responceData encoding:NSUTF8StringEncoding]autorelease]; 
    
    //NSLog(@"RESPONSE:%@",responseString);
    NSMutableArray *arr;
    //arr=[[NSMutableArray alloc]init];
        id dict = [responseString  JSONValue];
	if([strWhichApiCalled isEqualToString:@"Update High Score"])
	{
		[self fetchTopTwentyfive];
	}
	else if([strWhichApiCalled isEqualToString:@"Fetch Top Ten"])
	{
		if([[NSString stringWithFormat:@"%@",[dict objectForKey:@"status"]] isEqualToString:@"1"])
        {
			if([[dict objectForKey:@"toptwentyfive"] isKindOfClass:[NSMutableArray class]])
			{
				
				if(arr)
				{
					printf("\nfghfhkghfh\n");
					[arr release];
					arr=nil;
				}
				else
				arr=[[NSMutableArray alloc]init];
				arr = [dict objectForKey:@"toptwentyfive"];
				
				for(int i=0;i<[arr count];i++)
				{
					NSURL *url1 = [NSURL URLWithString:[NSString stringWithFormat:@"%@",[[arr objectAtIndex:i] objectForKey:@"profile_img"]]];
					//NSData *data = [NSData dataWithContentsOfURL:url1];
					//UIImage *frame_image_=[UIImage imageWithData:data];
					
					[arrImage addObject:url1];
					
					NSString *str = [[arr objectAtIndex:i] objectForKey:@"company_name"];
					[arrName addObject:str];
				}
				
				//NSLog(@"%@",arrImage);
				//NSLog(@"%@",arrName);
				[self allCompany];
				p=2;
				
				
			}
			
           
        }
        else
        {
            UIAlertView *alertWarning = [[UIAlertView alloc]initWithTitle:@"Information" 
                                                                  message:@"Some problem are there." 
                                                                 delegate:self 
                                                        cancelButtonTitle:@"OK" 
                                                        otherButtonTitles:nil];
            [alertWarning show];
            [alertWarning release];
        }
	}
	else {
		;
	}

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
			
			curXLoc += (kScrollObjWidth);
		}
	}
	
	// set the content size so it can be scrollable
	[scrollView2 setContentSize:CGSizeMake((kNumImages * kScrollObjWidth),40)];
}

-(void)foodCRE01Video
{
	
    
	[scrollView1   removeFromSuperview];
	scrollView1=nil;
	[scrollView2   removeFromSuperview];
	scrollView2=nil;
	
	for (UIButton *target in arrPic)
	{
		[target   removeFromSuperview];
		
		target=nil;
	}
	for (UILabel *target in arrLabel)
	
	{
		[target   removeFromSuperview];
		
		target=nil;
	}
	for (UIActivityIndicatorView *target in arrLabel1)
	{
		[target   removeFromSuperview];
		
		target=nil;
	}
	for (ASYImage *target in arrPic1)
		
	{
		[target   removeFromSuperview];
		
		target=nil;
	}
	
	
	[arrPic release];
	arrPic=nil;
	[arrLabel release];
	arrLabel=nil;
	[arrPic1 release];
	arrPic1=nil;
	[arrLabel1 release];
	arrLabel1=nil;
	[responceData release];
	responceData=nil;
	[strWhichApiCalled release];
	strWhichApiCalled=nil;
	
	[arrImage release];
	arrImage=nil;
	[arrName release];
	arrName=nil;
	
	[[CCDirector sharedDirector] purgeCachedData];
	[self unscheduleAllSelectors];
	[[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
	[[CCTextureCache sharedTextureCache] removeAllTextures];
}

-(void)playAgain
{
	if(p==2)
	{
		[self foodCRE01Video];		
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[HelloWorld scene]];
	}
}

-(void)addNew
{
	if(p==2)
	{
		[self foodCRE01Video];	
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[donatePage scene]];
	}
	
}

-(void)goToMainMenu
{
	if(p==2)
	{
		
		[self foodCRE01Video];
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[menuPage scene]];
	}
}


-(void)goToMain
{
	if(p==2)
	{
	[self foodCRE01Video];
	[[CCDirector sharedDirector] pause] ;
	[[CCDirector sharedDirector] replaceScene:[menuPage scene]];
	}
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
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
