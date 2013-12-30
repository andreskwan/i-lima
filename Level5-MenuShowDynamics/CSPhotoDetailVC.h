#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@class Photo, LongPressOverlay;

@interface CSPhotoDetailVC : UIViewController <MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) Photo *photo;
@property (strong, nonatomic) UILabel *photoNameLabel;

@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) UIImageView *photoImageView;
@property (strong, nonatomic) UITextView *notesView;

@property (strong, nonatomic) LongPressOverlay *overlay;
@property (strong, nonatomic) UILongPressGestureRecognizer *longPress;

@property (strong, nonatomic) UIDynamicAnimator *animator;

@end