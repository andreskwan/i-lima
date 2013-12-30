#import <UIKit/UIKit.h>

@class Photo;

@interface CSEditPhotoNote : UIViewController <UITextViewDelegate>

@property (strong, nonatomic) Photo *photo;
@property (strong, nonatomic) UITextView *notesTextView;

@end
