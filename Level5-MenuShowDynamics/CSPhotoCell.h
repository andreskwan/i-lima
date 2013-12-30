#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CSPhotoCell : UITableViewCell

@property (strong, nonatomic) UIImageView *cellImage;
@property (strong, nonatomic) UILabel *cellName;
@property (strong, nonatomic) UIView *cellNotesView;

@property (strong, nonatomic) UIDynamicAnimator *animator;

@end
