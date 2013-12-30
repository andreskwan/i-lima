#import "CSEditPhotoNote.h"
#import "CSPhotoDetailVC.h"

#import "Photo.h"
#import "Photos.h"

@implementation CSEditPhotoNote

- (id)init
{
    self = [super init];
    if(self) {
        self.title = @"";
    }
    return self;
}

- (void)loadView
{
    self.notesTextView = [[UITextView alloc] init];
    
    UIFontDescriptor *helvetica22 = [UIFontDescriptor fontDescriptorWithName:@"HelveticaNeue" size:22.0f];
    self.notesTextView.font = [UIFont fontWithDescriptor:helvetica22 size:22.0f];
    self.notesTextView.delegate = self;
    
    self.view = self.notesTextView;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.notesTextView.text = self.photo.notes;
    
    [self.notesTextView becomeFirstResponder];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.notesTextView.frame = CGRectMake(0, 0, 320, 568 - 216);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSArray *allPhotos = [[Photos getPhotosFromArchive] allPhotos];
    NSMutableArray *allPhotosMutable = [[NSMutableArray alloc] initWithArray:allPhotos];
    [allPhotos enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if([obj photoId] == self.photo.photoId) {
            self.photo.notes = self.notesTextView.text;
            [allPhotosMutable replaceObjectAtIndex:idx withObject:self.photo];
        }
    }];
    Photos *photos = [[Photos alloc] init];
    photos.allPhotos = [allPhotosMutable copy];
    [Photos savePhotosToArchive:photos];
}

@end
