#import <UIKit/UIKit.h>

@interface LongPressOverlay : UIView

@property (assign, nonatomic) CGPoint pointOfLongPress;

@property (strong, nonatomic) UIButton *mailButton;
@property (strong, nonatomic) UIButton *editButton;

- (id)initWithFrame:(CGRect)frame point:(CGPoint)point;

@property (strong, nonatomic) UIDynamicAnimator *animator;

@end
