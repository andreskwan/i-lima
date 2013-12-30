#import "CSPhotoCell.h"

@implementation CSPhotoCell

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self) {
        self.cellImage = [[UIImageView alloc] init];
        self.cellImage.clipsToBounds = YES;
        [self.contentView addSubview:self.cellImage];
        
        self.cellName = [[UILabel alloc] init];
        
        self.cellName.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0f];
        
        self.cellName.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.cellName];
        
        self.cellNotesView = [[UIView alloc] init];
//        self.cellNotesView.backgroundColor = 
        [self.contentView addSubview:self.cellNotesView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.cellImage.frame = CGRectMake(5,
                                      5,
                                      60,
                                      40);
    
    self.cellName.frame = CGRectMake(CGRectGetMaxX(self.cellImage.frame) + 10,
                                     17,
                                     160,
                                     16);
    
    self.cellNotesView.frame = CGRectMake(CGRectGetWidth(self.frame) - 60,
                                          20,
                                          40,
                                          40);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
