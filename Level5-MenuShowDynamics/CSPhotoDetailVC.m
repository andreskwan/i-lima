#import "CSPhotoDetailVC.h"
#import "Photo.h"
#import "CSEditPhotoNote.h"

#import "LongPressOverlay.h"

@implementation CSPhotoDetailVC

- (id)init
{
    self = [super init];
    if(self) {
        self.title = [NSString stringWithFormat:@"Photo ID %d",self.photo.photoId];
    }
    return self;
}

- (void)loadView
{
    self.scrollView = [[UIScrollView alloc] init];
    //kwan
    self.scrollView.backgroundColor = [UIColor grayColor];
    
    self.photoImageView = [[UIImageView alloc] init];
    self.photoImageView.accessibilityLabel = @"photoImageView";
    [self.scrollView addSubview:self.photoImageView];

    self.photoNameLabel = [[UILabel alloc] init];
//    self.photoNameLabel.backgroundColor = [UIColor clearColor];
    self.photoNameLabel.backgroundColor = [UIColor clearColor];
    self.photoNameLabel.textAlignment = NSTextAlignmentRight;
    
    UIFontDescriptor *helvetica24 = [UIFontDescriptor fontDescriptorWithName:@"HelveticaNeue" size:24.0f];
    UIFontDescriptor *boldBase = [helvetica24 fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold];
    self.photoNameLabel.font = [UIFont fontWithDescriptor:boldBase size:24.0f];
    
    self.photoNameLabel.textColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.photoNameLabel];
    
    self.notesView = [[UITextView alloc] init];
    self.notesView.editable = NO;
    UIFontDescriptor *helvetica22 = [UIFontDescriptor fontDescriptorWithName:@"HelveticaNeue" size:22.0f];
    self.notesView.font = [UIFont fontWithDescriptor:helvetica22 size:22.0f];
    
    [self.scrollView addSubview:self.notesView];
    
    self.view = self.scrollView;
}

- (void)viewDidLoad
{
    self.view.tintColor = [UIColor redColor];
    self.photoImageView.image = [self.photo loadImage:self.photo.filename];
    
    self.photoNameLabel.text = self.photo.name;
    
    self.photoImageView.userInteractionEnabled = YES;
    self.longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    self.longPress.minimumPressDuration = 0.2;
    [self.photoImageView addGestureRecognizer:self.longPress];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.notesView.text = self.photo.notes;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.photoImageView.frame = CGRectMake(0,
                                           0,
                                           CGRectGetWidth(self.scrollView.frame),
                                           200);

    CGSize photoNameLabelSize = [self.photoNameLabel.text sizeWithAttributes:@{NSFontAttributeName: self.photoNameLabel.font, UIFontDescriptorTraitsAttribute: @(UIFontDescriptorTraitBold)}];
    
    self.photoNameLabel.frame = CGRectMake(CGRectGetWidth(self.photoImageView.frame) - photoNameLabelSize.width - 20,
                                           CGRectGetMaxY(self.photoImageView.frame) - 40,
                                           photoNameLabelSize.width,
                                           photoNameLabelSize.height);
    
    self.notesView.frame = CGRectMake(10,
                                      CGRectGetMaxY(self.photoImageView.frame) + 10,
                                      CGRectGetWidth(self.scrollView.frame) - 10,
                                      140);
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self.notesView.layoutManager ensureLayoutForTextContainer:self.notesView.textContainer];
    CGRect notesViewRect = [self.notesView.layoutManager usedRectForTextContainer:self.notesView.textContainer];
    
    CGRect updatedFrame = self.notesView.frame;
    updatedFrame.size.height = ceilf(notesViewRect.size.height + self.notesView.textContainerInset.top + self.notesView.textContainerInset.bottom);
    self.notesView.frame = updatedFrame;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self overlayTapped:nil];
}

- (void)editButtonTapped:(id)sender
{
    CSEditPhotoNote *csEditPhotoNote = [[CSEditPhotoNote alloc] init];
    csEditPhotoNote.photo = self.photo;

    [self.navigationItem setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:self.photo.name
                                                                               style:UIBarButtonItemStyleBordered
                                                                              target:nil
                                                                              action:nil]];
    [self.navigationController pushViewController:csEditPhotoNote animated:YES];
}

- (void)linkButtonTapped:(id)sender
{
    NSString *subject = self.photo.name;
    NSString *body = self.photo.notes;
    NSArray *to = [NSArray arrayWithObject:@"nowhere@example.com"];
    
    MFMailComposeViewController *composeVC = [[MFMailComposeViewController alloc] init];
    composeVC.mailComposeDelegate = self;
    [composeVC setSubject:subject];
    [composeVC setMessageBody:body isHTML:NO];
    [composeVC setToRecipients:to];
    NSData *imageData = UIImagePNGRepresentation(self.photoImageView.image);
    [composeVC addAttachmentData:imageData mimeType:@"image/png" fileName:self.photo.filename];
    
    [self presentViewController:composeVC animated:YES completion:^{
        [self overlayTapped:nil];
    }];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)longPress:(UILongPressGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan) {
        self.overlay = [[LongPressOverlay alloc] initWithFrame:self.view.frame
                                                         point:[gesture locationInView:self.view]];
        self.overlay.accessibilityLabel = @"overlay";
        self.overlay.backgroundColor = [UIColor blackColor];
        self.overlay.layer.opacity = 0.0;
        
        [self.overlay.mailButton addTarget:self
                                    action:@selector(linkButtonTapped:)
                          forControlEvents:UIControlEventTouchUpInside];
        [self.overlay.editButton addTarget:self
                                    action:@selector(editButtonTapped:)
                          forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:self.overlay];
        [UIView animateWithDuration:0.3 animations:^{
            self.overlay.layer.opacity = 0.7;
        }];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(overlayTapped:)];
        tapGesture.numberOfTapsRequired = 1;
        [self.overlay addGestureRecognizer:tapGesture];
    }
}

- (void)overlayTapped:(UITapGestureRecognizer *)gesture
{
    [UIView animateWithDuration:0.3 animations:^{
        self.overlay.layer.opacity = 0.0;
    } completion:^(BOOL finished) {
        [self.overlay removeFromSuperview];
    }];
}

@end
