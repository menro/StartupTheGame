#import "MyTools.h"
@implementation MyTools

-(UILabel *)createLabelWithFrame:(CGRect)frame ContainedIn:(UIView *)view ofTextColor:(UIColor *)txtcolor ofFont:(UIFont *)Font ofText:(NSString *)str
{
	UILabel *label =[[UILabel alloc]initWithFrame:frame];
	[label setBackgroundColor:[UIColor clearColor]];
	label.text=str;
	label.textColor=txtcolor;
	label.font=Font;
	label.numberOfLines=0;
	label.textAlignment=UITextAlignmentLeft;
	[view addSubview:label];
	return label;
}

-(UITextField *)createTextWithFrame:(CGRect)frame ContainedIn:(UIView *)view ofFont:(UIFont *)Font withPlaceHolder:(NSString *)placehold
{
	UITextField *textfield = [[[UITextField alloc]initWithFrame:frame] retain];
	textfield.borderStyle = UITextBorderStyleRoundedRect;
	textfield.backgroundColor = [UIColor clearColor];
	textfield.placeholder = placehold;
    textfield.textColor=[UIColor blackColor];
	textfield.font= Font;
	textfield.autocorrectionType = UITextAutocorrectionTypeNo;
	textfield.keyboardType = UIKeyboardTypeDefault;
	textfield.userInteractionEnabled=YES;
	textfield.delegate=self;
	textfield.returnKeyType = UIReturnKeyDone;
	
	textfield.layer.cornerRadius=4;
	textfield.layer.borderWidth=1.5;
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();	
	float grayComponents[4] = { 0.3, 0.3, 0.3, 1.0 };
	textfield.layer.borderColor=CGColorCreate(colorSpace, grayComponents);
	textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
	[view addSubview:textfield];
	return textfield;
}



/*-(UITextField *)createTextFieldWithText:(NSString *)Text
{
	UITextField *textfield = [[[UITextField alloc]initWithFrame:CGRectMake(128,4,143,25)] retain];
	textfield.borderStyle = UITextBorderStyleNone;
    textfield.textColor=[UIColor darkGrayColor];
	textfield.font= [UIFont fontWithName:@"Verdana" size:15];
    textfield.backgroundColor = [UIColor clearColor];
	textfield.autocorrectionType = UITextAutocorrectionTypeNo;
	textfield.keyboardType = UIKeyboardTypeDefault;
	textfield.userInteractionEnabled=YES;
	textfield.delegate=self;
	textfield.returnKeyType = UIReturnKeyDone;
	textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
	textfield.text=Text;
	return textfield;
}*/

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
	if(textField.frame.origin.y>=215)
	{
		UIView *ContainedView=[textField superview];
		CGRect rect=ContainedView.frame;
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.3];
		rect.origin.y-=(textField.frame.origin.y-215);
		ContainedView.frame=rect;
		[UIView commitAnimations];
	}
	return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
	if((textField.frame.origin.y-215)>0)
	{
		UIView *ContainedView=[textField superview];
		CGRect rect=ContainedView.frame;
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.3];
		rect.origin.y+=(textField.frame.origin.y-215);
		ContainedView.frame=rect;
		[UIView commitAnimations];
	}
	return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)theTextField 
{
	[theTextField  resignFirstResponder];
	return YES;
}

-(UIButton *)createButtonOfType:(UIButtonType)Type Frame:(CGRect)frame ContainedIn:(UIView *)view ofTitle:(NSString *)Title ofFont:(UIFont *)Font ofTitleColor:(UIColor *)Titlecolor ofBackImage:(NSString *)image Target:(id)object AddAction:(SEL)Action
{
	UIButton *button=[[UIButton buttonWithType:Type]retain];
	button.frame=frame;
	button.backgroundColor=[UIColor clearColor];
	[button setTitle:Title forState:UIControlStateNormal];
	[button setTitleColor:Titlecolor forState:normal];
	button.titleLabel.font=Font;
	button.titleLabel.textAlignment=UITextAlignmentLeft;
	[button.titleLabel setLineBreakMode:UILineBreakModeWordWrap];
	[button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
	[button setTitle:Title forState:UIControlStateHighlighted];
	[button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
	[button addTarget:object action:Action forControlEvents:UIControlEventTouchUpInside];
	[view addSubview:button];
	return button;
}
/*
-(UnderlineButton *)createUnderLineLabelButtonOfFrame:(CGRect)Frame withText:(NSString *)text ofColor:(UIColor *)fontColor ofFont:(UIFont *)lblFont containedIn:(UIView *)view Target:(id)object AddAction:(SEL)Action
{
	CGSize offset1= [text sizeWithFont:lblFont];
	UnderlineButton * myButton = [[UnderlineButton buttonWithType:UIButtonTypeCustom] retain];
	myButton.frame = CGRectMake(Frame.origin.x,Frame.origin.y,offset1.width,offset1.height);
	[myButton setTitle:text forState:UIControlStateNormal];
	[myButton.titleLabel setLineBreakMode:UILineBreakModeWordWrap];
	[myButton setTitleColor:fontColor forState:UIControlStateNormal];
	myButton.titleLabel.font=lblFont;
	myButton.titleLabel.numberOfLines=1;
	[myButton addTarget:object action:Action forControlEvents:UIControlEventTouchUpInside];
	[view addSubview:myButton];
	return myButton;
}
*/
-(UIImageView *)createImageViewWithFrame:(CGRect)frame ContainedIn:(UIView *)view ofImageName:(NSString *)imageName
{
	UIImageView *imageView=[[UIImageView alloc]init];
	imageView.frame=frame;
	imageView.image=[UIImage imageNamed:imageName];
	imageView.userInteractionEnabled=NO;
	[view addSubview:imageView];
	return imageView;		
}

/*- (UITextView *)createTextViewWithFrame:(CGRect)frame ofTextColor:(UIColor *)txtcolor ContainedIn:(UIView *)view
{
	textView = [[UITextView alloc] initWithFrame:frame];
    textView.textColor = txtcolor;
	textView.clearsContextBeforeDrawing=YES;
    textView.font = [UIFont fontWithName:@"Verdana" size:20];
	textView.backgroundColor = [UIColor clearColor];
	textView.returnKeyType = UIReturnKeyDefault;
	textView.autocorrectionType=YES;
	textView.keyboardType = UIKeyboardTypeDefault;
	[view addSubview:textView];
	return textView;
}*/

-(UITextView *)createTextViewWithframe:(CGRect)frame ofFontSize:(NSInteger)fontSize ofPlaceHolder:(NSString *)placeHolder containedIn:(UIView *)containingView
{
	UITextView *textView1 = [[UITextView alloc] initWithFrame:frame];
    textView1.textColor = [UIColor blackColor];
	textView1.font = [UIFont fontWithName:@"Verdana" size:fontSize];
	textView1.returnKeyType = UIReturnKeyDefault;
	textView1.autocorrectionType=YES;
	textView1.keyboardType = UIKeyboardTypeDefault;
	textView1.backgroundColor=[UIColor whiteColor];
	
	textView1.layer.cornerRadius=4;
	textView1.layer.borderWidth=1.5;
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();	
	float grayComponents[4] = { 0.3, 0.3, 0.3, 1.0 };
	textView1.layer.borderColor=CGColorCreate(colorSpace, grayComponents);
	
	textView1.delegate=self;
	[containingView addSubview:textView1];
	
	UILabel *label1 =[[UILabel alloc]init] ;
	label1.font=[UIFont fontWithName:@"Verdana" size:fontSize];
	[label1 setBackgroundColor:[UIColor clearColor]];
	label1.frame=CGRectMake(8,6,frame.size.width-20,20);
	label1.textColor=[UIColor darkGrayColor];
	label1.numberOfLines=0;
	label1.text=placeHolder;
	label1.textAlignment=UITextAlignmentLeft;
	label1.alpha=1.0;
	[textView1 addSubview:label1];
	[label1 release];
	return textView1;
}

- (void)textViewDidChange:(UITextView *)textView2
{
    if (textView2.text.length==0)
    {
		((UILabel *)[[textView2 subviews] objectAtIndex:1]).alpha=1.0;
	}
	else
	{
		((UILabel *)[[textView2 subviews] objectAtIndex:1]).alpha=0.0;
		if(([textView2.text characterAtIndex:textView2.text.length-1]=='\n') &&([textView2.text characterAtIndex:textView2.text.length-2]=='\n'))
		{
			[textView2 resignFirstResponder];
		}
	}
}


-(UISegmentedControl *)createSegmentControllerInitWithItem:(NSArray *)items ofFrame:(CGRect )Frame ofTintColor:(UIColor *)tintcolor Selected:(NSInteger)selected ContainedIn:(UIView *)view Target:(id)object AddAction:(SEL)Action
{
	styleSegmentedControl = [[UISegmentedControl alloc] initWithItems:items];
	[styleSegmentedControl addTarget:object action:Action forControlEvents:UIControlEventValueChanged];
	styleSegmentedControl.selectedSegmentIndex=selected;
	styleSegmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
	styleSegmentedControl.tintColor=tintcolor;
    styleSegmentedControl.backgroundColor = [UIColor clearColor];
	[styleSegmentedControl sizeToFit];
    styleSegmentedControl.frame = Frame;
	[view addSubview:styleSegmentedControl];
	return styleSegmentedControl;
	
}

-(UIPickerView *)createPickerWithActionSheetWithTitle:(NSString *)title ContainedIn:(UIView *)view transform:(NSInteger )p
{
	viewTransform=p;
	CGRect rect=view.frame;
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.3];
	rect.origin.y-=viewTransform;
	view.frame=rect;
	[UIView commitAnimations];
	contentView=view;
	
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
	actionSheet.actionSheetStyle =UIActionSheetStyleBlackOpaque;
	[actionSheet  showInView:view];
	[actionSheet release];
	
	pickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
	CGSize pickerSize = [pickerView sizeThatFits:CGSizeZero];
	pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	pickerView.frame = CGRectMake(0.0,30.0, pickerSize.width,pickerSize.height);
	pickerView.delegate = self;
	pickerView.showsSelectionIndicator = YES;
	[actionSheet addSubview:pickerView];
		
	UIButton *btnCancel=[[UIButton buttonWithType:UIButtonTypeCustom]retain];
	[btnCancel setBackgroundImage:[UIImage imageNamed:@"button-small.png"] forState:UIControlStateNormal];
	btnCancel.frame=CGRectMake(258,2,60,27);
	[btnCancel setTitle:@"Done" forState:UIControlStateNormal];
	btnCancel.backgroundColor=[UIColor clearColor];
	btnCancel.showsTouchWhenHighlighted=NO;
	[actionSheet addSubview:btnCancel];
	[btnCancel addTarget:self action:@selector(dismisActionSheet:) forControlEvents:UIControlEventTouchUpInside];
    [btnCancel release];
	return pickerView;
}


-(UIDatePicker *)createDatePickerWithActionSheetWithTitle:(NSString *)title ContainedIn:(UIView *)view ofMode:(UIDatePickerMode)Mode ofTransform:(NSInteger)p
{
	viewTransform=p;
	CGRect rect=view.frame;
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.3];
	rect.origin.y-=viewTransform;
	view.frame=rect;
	[UIView commitAnimations];
	contentView=view;
	
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
	actionSheet.actionSheetStyle =UIActionSheetStyleBlackOpaque;
	[actionSheet  showInView:view];
	[actionSheet release];
	
	NSDate *now = [NSDate date];
	datePicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
	datePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	datePicker.datePickerMode =Mode;
	CGSize pickerSize = [datePicker sizeThatFits:CGSizeZero];
	datePicker.frame = CGRectMake(0.0, 30.0, pickerSize.width,pickerSize.height);
	datePicker.backgroundColor = [UIColor blackColor];
	[datePicker setDate:now animated:YES];
	[actionSheet addSubview:datePicker];
		
	UIButton *btnCancel=[[UIButton buttonWithType:UIButtonTypeCustom]retain];
	[btnCancel setBackgroundImage:[UIImage imageNamed:@"button-small.png"] forState:UIControlStateNormal];
	btnCancel.frame=CGRectMake(258,4,60,25);
	[btnCancel setTitle:@"Done" forState:UIControlStateNormal];
	btnCancel.backgroundColor=[UIColor clearColor];
	btnCancel.showsTouchWhenHighlighted=NO;
	[actionSheet addSubview:btnCancel];
	[btnCancel addTarget:self action:@selector(dismisActionSheet:) forControlEvents:UIControlEventTouchUpInside];
    [btnCancel release];
	return datePicker;
}


-(void)dismisActionSheet:(id)sender
{
	CGRect rect=contentView.frame;
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.3];
	rect.origin.y+=viewTransform;
	contentView.frame=rect;
	[UIView commitAnimations];
	[(UIActionSheet *)[sender superview] dismissWithClickedButtonIndex:0 animated:YES];
}


/*-(UILabel *)createActivityIndicator1
{
	lblLoadingView=[[UILabel alloc]initWithFrame:CGRectMake(80,40,135,37)];
	lblLoadingView.text=@"Loading..";
	lblLoadingView.font=[UIFont fontWithName:@"Verdana-Bold" size:17];
	lblLoadingView.textColor=[UIColor whiteColor];
	lblLoadingView.textAlignment=UITextAlignmentRight;
	lblLoadingView.backgroundColor=[UIColor clearColor];
	spinner = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0,2,35,35)];
	spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
	spinner.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
								UIViewAutoresizingFlexibleRightMargin |
								UIViewAutoresizingFlexibleTopMargin |
								UIViewAutoresizingFlexibleBottomMargin);
	spinner.backgroundColor=[UIColor clearColor];
	spinner.opaque=YES;
	[lblLoadingView addSubview:spinner];
	return lblLoadingView;
}*/
-(UIView *)createActivityIndicator1
{
	UIView *tempView=[[UIView alloc]initWithFrame:CGRectMake(0,0,320,480)];
	tempView.backgroundColor=[UIColor colorWithRed:61.0/255.0 green:61.0/255.0 blue:61.0/255.0 alpha:0.9];
	
	UIActivityIndicatorView *spinner1 = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(120,205,20,20)];
	spinner1.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
	spinner1.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
	spinner1.backgroundColor=[UIColor clearColor];
	spinner1.opaque=YES;
	[tempView addSubview:spinner1];
	[spinner1 release];
	
	UILabel *lblLoadingView1=[[UILabel alloc]initWithFrame:CGRectMake(108,200,140,30)];
	lblLoadingView1.text=@"";
	lblLoadingView1.font=[UIFont fontWithName:@"Verdana" size:15];
	lblLoadingView1.textColor=[UIColor whiteColor];
	lblLoadingView1.textAlignment=UITextAlignmentCenter;
	lblLoadingView1.backgroundColor=[UIColor clearColor];
	[tempView addSubview:lblLoadingView1];
	[lblLoadingView1 release];
	
	return tempView;
}
-(UIImageView *)createActivityIndicator5
{
	UIImageView *tempView=[[UIImageView alloc]initWithFrame:CGRectMake(0,20,320,462)];
	//tempView.backgroundColor=[UIColor colorWithRed:61.0/255.0 green:61.0/255.0 blue:61.0/255.0 alpha:0.9];
	tempView.image=[UIImage imageNamed:@"splash_alt.png"];
	
	UIActivityIndicatorView *spinner1 = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(120,205,20,20)];
	spinner1.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
	spinner1.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
	spinner1.backgroundColor=[UIColor clearColor];
	spinner1.opaque=YES;
	[tempView addSubview:spinner1];
	[spinner1 release];
	
	UILabel *lblLoadingView1=[[UILabel alloc]initWithFrame:CGRectMake(108,200,140,30)];
	lblLoadingView1.text=@"";
	lblLoadingView1.font=[UIFont fontWithName:@"Verdana" size:15];
	lblLoadingView1.textColor=[UIColor whiteColor];
	lblLoadingView1.textAlignment=UITextAlignmentCenter;
	lblLoadingView1.backgroundColor=[UIColor clearColor];
	[tempView addSubview:lblLoadingView1];
	[lblLoadingView1 release];
	
	return tempView;
}
-(void)startLoadingg:(UIView *)parentView childView:(UIImageView *)child text:(NSString *)loadingText
{
	[parentView addSubview:child];
	[((UIActivityIndicatorView *)[[child subviews] objectAtIndex:0]) startAnimating];
	((UILabel *)[[child subviews] objectAtIndex:1]).text=loadingText;
}
-(void)stopLoadingg:(UIView *)child
{
	[((UIActivityIndicatorView *)[[child subviews] objectAtIndex:0]) stopAnimating];
	[child removeFromSuperview];
}

-(void)startLoading:(UIView *)parentView childView:(UIView *)child text:(NSString *)loadingText
{
	[parentView addSubview:child];
	[((UIActivityIndicatorView *)[[child subviews] objectAtIndex:0]) startAnimating];
	((UILabel *)[[child subviews] objectAtIndex:1]).text=loadingText;
}

-(void)stopLoading:(UIView *)child
{
	[((UIActivityIndicatorView *)[[child subviews] objectAtIndex:0]) stopAnimating];
	[child removeFromSuperview];
}


-(UILabel *)createActivityIndicator
{
	lblLoadingView=[[UILabel alloc]initWithFrame:CGRectMake(100,200,110,25)];//100,200,110,25(x,y)
	lblLoadingView.text=@"Loading..";
	lblLoadingView.font=[UIFont fontWithName:@"Verdana-Bold" size:15];//15
	lblLoadingView.textColor=[UIColor darkGrayColor];//darkGrayColor
	lblLoadingView.textAlignment=UITextAlignmentRight;
	lblLoadingView.backgroundColor=[UIColor clearColor];
	spinner = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0,0,25,25)];
	spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;//Gray
	spinner.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
								UIViewAutoresizingFlexibleRightMargin |
								UIViewAutoresizingFlexibleTopMargin |
								UIViewAutoresizingFlexibleBottomMargin);
	spinner.backgroundColor=[UIColor clearColor];
	spinner.opaque=YES;
	[lblLoadingView addSubview:spinner];
	return lblLoadingView;
}



-(UIScrollView *)createScrollViewWithFrame:(CGRect)frame ContentSize:(CGSize)size VscrollVisibled:(BOOL)YES_NO HscrollVisibled:(BOOL)YES_NO1 WillBounce:(BOOL)no ContainedIn:(UIView *)view
{
	scrollView=[[[UIScrollView alloc] initWithFrame:frame]autorelease];
	scrollView.contentSize =size;
	scrollView.scrollEnabled=YES;
	scrollView.showsVerticalScrollIndicator=YES_NO;
	scrollView.showsHorizontalScrollIndicator=YES_NO1;
	[scrollView flashScrollIndicators];
	scrollView.bounces =YES;
	[scrollView autoresizesSubviews];
	[view addSubview:scrollView];
	return scrollView;
}


-(UISwitch *)createUISwitchWithFrame:(CGRect)frame Target:(id)object Action:(SEL)Action IsOn:(BOOL)yes ContainedIn:(UIView *)view
{
	switchCtl = [[[UISwitch alloc] initWithFrame:frame]autorelease];
	[switchCtl addTarget:object action:Action forControlEvents:UIControlEventValueChanged];
	switchCtl.backgroundColor = [UIColor clearColor];
	switchCtl.on=yes;
	[view addSubview:switchCtl];
	return switchCtl;
}


-(UIAlertView *)createAlertViewWithTitle:(NSString *)title message:(NSString *)msg Delegate:(id)object cancelButtonTitle:(NSString *)btnCancel otherButtonTitles:(NSArray *)btnOthers ofTag:(NSInteger)Tag
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:object cancelButtonTitle:btnCancel otherButtonTitles:[btnOthers objectAtIndex:0],[btnOthers objectAtIndex:1],nil];
	[alert show];
	alert.tag=Tag;
	return alert;
}

-(UISearchBar *)createSearchBarContainedIn:(UIView *)view
{
	searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0,43,320,40)];
	searchBar.barStyle=UIBarStyleBlackTranslucent;
	[searchBar setShowsCancelButton:YES animated:YES];
	searchBar.placeholder=@"< Search >";
	[view addSubview:searchBar];
	
	return searchBar;
}

-(NSInteger)calculateNoOfLinesOfTheString:(NSString*)str ofFont:(UIFont *)fontName contentWidth:(NSInteger)conWidth
{
	NSInteger index=0;
	NSInteger withValue=0;
	NSInteger lineCounter=0;
	NSInteger withOfLine = 0;
	int l = 0;
	for(;index<str.length;index++)
	{
		withValue++;
		NSString *tmp = [str substringWithRange:NSMakeRange(index, 1)];
		NSString *strCopy;
		if(withValue<str.length-l)
		{
			strCopy = [str substringWithRange:NSMakeRange(l, withValue)];
		}
		CGSize strSize=[strCopy sizeWithFont:fontName];
		int cursorX=strSize.width;
		if([tmp isEqual:@"\n"] || cursorX>=conWidth)
		{
			l=index;
			withValue = 0;			
			lineCounter++;
		}
	}
	if(!withOfLine)
	{
		withOfLine = 16;
	}
	if(!lineCounter)
	{
		withOfLine = withValue;
	}
	lineCounter++;
	return lineCounter;
}



//to make tabBar userInteraction Enabled NO
/*for(int i=0;i<[self.tabBarController.tabBar.subviews count];i++)
 {
 [[self.tabBarController.tabBar.subviews objectAtIndex:i] setUserInteractionEnabled:NO];
 }*/

// to parse from a xml file
//NSMutableData *DATA = [[NSMutableData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"atv" ofType:@"xml"]];

@end
