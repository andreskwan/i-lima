#import "LongPressOverlay.h"

@implementation LongPressOverlay

- (id)initWithFrame:(CGRect)frame point:(CGPoint)point {
    self = [super initWithFrame:frame];
    if(self) {
        NSLog(@"hi");
        self.pointOfLongPress = point;
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
    
    self.mailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.mailButton.accessibilityLabel = @"mailButton";
    [self.mailButton setImage:[UIImage imageNamed:@"mail_icon"]
                     forState:UIControlStateNormal];
    self.mailButton.layer.opacity = 1.0;
    [self addSubview:self.mailButton];
    
    self.editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editButton.accessibilityLabel = @"editButton";
    [self.editButton setImage:[UIImage imageNamed:@"edit_icon"]
                     forState:UIControlStateNormal];
    [self addSubview:self.editButton];

    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];

    // the mailButton will start offscreen
    self.mailButton.frame = CGRectMake(-100,
                                       -100,
                                       40,
                                       40);
    
    // the editButton will also start offscreen
    self.editButton.frame = CGRectMake(350,
                                       250,
                                       40,
                                       40);
    
    
    
    /* TODO: We need the mailButton to snap into place just a little above and to the
     left of where the user pressed.  The position of the press is stored as a CGPoint
     in the self.pointOfLongPress variable.
     
     Create a UISnapBehvaior instance for the mailButton that snaps to a CGPoint that is 30 pts
     above where the user pressed and 25 pts to the left of where the user pressed.
     
     Then, adjust the snap behavior's damping to be a number between 0.8 and 1.0
    */
    
    UISnapBehavior *snapMail = [[UISnapBehavior alloc] initWithItem:self.mailButton
                                                        snapToPoint:CGPointMake(self.pointOfLongPress.x - 25, self.pointOfLongPress.y - 30)];
    snapMail.damping = 0.8;
    [self.animator addBehavior:snapMail];
    /* TODO: We need the editButton to snap into place just a little above and to the
     right of where the user pressed.
     
     Create a UISnapBehvaior instance that for the editButton that snaps to a CGPoint that is 30 pts
     above where the user pressed and 25 pts to the left of where the user pressed.
     
     Then, adjust the snap behavior's damping to be a number between 0.8 and 1.0
    */
    UISnapBehavior *snapEdit = [[UISnapBehavior alloc] initWithItem:self.editButton
                                                        snapToPoint:CGPointMake(self.pointOfLongPress.x + 25, self.pointOfLongPress.y - 30)];
    snapEdit.damping = 0.8;
    [self.animator addBehavior:snapEdit];
    
}

@end
