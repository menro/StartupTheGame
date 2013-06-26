#import <Foundation/Foundation.h>
#import <QuartzCore/CALayer.h>
//#import "UnderlineButton.h"

@interface MyTools : NSObject<UITextFieldDelegate,UITextViewDelegate,UIActionSheetDelegate,UIPickerViewDelegate>
{
	//UITextField *textfield;
	UITextView *textView;
	UILabel *lblLoadingView;
	//UIButton *button;
	UIButton *button1;
	//UIImageView *imageView;
	UIScrollView *scrollView;
	UISegmentedControl *styleSegmentedControl;
	UIDatePicker *datePicker;
	UIPickerView *pickerView;
	UIActivityIndicatorView *spinner;
	UISwitch *switchCtl;
	
	NSInteger viewTransform;
	UIView *contentView;
	
	UISearchBar *searchBar;
}

-(UILabel *)createLabelWithFrame:(CGRect)frame ContainedIn:(UIView *)view ofTextColor:(UIColor *)txtcolor ofFont:(UIFont *)Font ofText:(NSString *)str;

-(UITextField *)createTextWithFrame:(CGRect)frame ContainedIn:(UIView *)view ofFont:(UIFont *)Font withPlaceHolder:(NSString *)placehold;

//-(UITextField *)createTextFieldWithText:(NSString *)Text;

-(UIButton *)createButtonOfType:(UIButtonType)Type Frame:(CGRect)frame ContainedIn:(UIView *)view ofTitle:(NSString *)Title ofFont:(UIFont *)Font ofTitleColor:(UIColor *)Titlecolor ofBackImage:(NSString *)image Target:(id)object AddAction:(SEL)Action;

//-(UnderlineButton *)createUnderLineLabelButtonOfFrame:(CGRect)Frame withText:(NSString *)text ofColor:(UIColor *)fontColor ofFont:(UIFont *)lblFont containedIn:(UIView *)view Target:(id)object AddAction:(SEL)Action;

-(UIImageView *)createImageViewWithFrame:(CGRect)frame ContainedIn:(UIView *)view ofImageName:(NSString *)imageName;

-(UIScrollView *)createScrollViewWithFrame:(CGRect)frame ContentSize:(CGSize)size VscrollVisibled:(BOOL)YES_NO HscrollVisibled:(BOOL)YES_NO1 WillBounce:(BOOL)no ContainedIn:(UIView *)view;

//-(UITextView *)createTextViewWithFrame:(CGRect)frame ofTextColor:(UIColor *)txtcolor ContainedIn:(UIView *)view;

-(UISegmentedControl *)createSegmentControllerInitWithItem:(NSArray *)items ofFrame:(CGRect )Frame ofTintColor:(UIColor *)tintcolor Selected:(NSInteger)selected ContainedIn:(UIView *)view Target:(id)object AddAction:(SEL)Action;

-(UIPickerView *)createPickerWithActionSheetWithTitle:(NSString *)title ContainedIn:(UIView *)view transform:(NSInteger )p;

-(UIDatePicker *)createDatePickerWithActionSheetWithTitle:(NSString *)title ContainedIn:(UIView *)view ofMode:(UIDatePickerMode)Mode ofTransform:(NSInteger)p;

-(UISwitch *)createUISwitchWithFrame:(CGRect)frame Target:(id)object Action:(SEL)Action IsOn:(BOOL)yes ContainedIn:(UIView *)view;

-(UIAlertView *)createAlertViewWithTitle:(NSString *)title message:(NSString *)msg Delegate:(id)object cancelButtonTitle:(NSString *)btnCancel otherButtonTitles:(NSArray *)btnOthers ofTag:(NSInteger)Tag;

-(UISearchBar *)createSearchBarContainedIn:(UIView *)view;

-(UILabel *)createActivityIndicator;
-(UILabel *)createActivityIndicator1;
//-(UIView *)createActivityIndicator1:(NSString *)loadingText;
-(UIImageView *)createActivityIndicator5;
-(void)startLoadingg:(UIView *)parentView childView:(UIImageView *)child text:(NSString *)loadingText;
-(void)stopLoadingg:(UIView *)child;
-(UITextView *)createTextViewWithframe:(CGRect)frame ofFontSize:(NSInteger)fontSize ofPlaceHolder:(NSString *)placeHolder containedIn:(UIView *)containingView;

-(NSInteger)calculateNoOfLinesOfTheString:(NSString*)str ofFont:(UIFont *)fontName contentWidth:(NSInteger)conWidth;
//-(UITextField *)createTextWithoutFrame:(CGRect)frame ContainedIn:(UIView *)view ofFont:(UIFont *)Font withPlaceHolder:(NSString *)placehold;
-(void)startLoading:(UIView *)parentView childView:(UIView *)child text:(NSString *)loadingText;
-(void)stopLoading:(UIView *)child;
@end
