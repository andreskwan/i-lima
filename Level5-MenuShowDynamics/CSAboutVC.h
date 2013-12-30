#import <UIKit/UIKit.h>

@interface CSAboutVC : UIViewController

@property (strong, nonatomic) UIScrollView *contentSubview;

@property (strong, nonatomic) UILabel *headerLabel;
@property (strong, nonatomic) UILabel *authorLabel;
@property (strong, nonatomic) UIButton *csLogoButton;
@property (strong, nonatomic) UITextView *descriptionTextView;
@property (strong, nonatomic) UITextView *csInfoTextView;

- (void)logoTapped:(id)sender;
- (void)contentSizeChanged:(id)sender;

@end
