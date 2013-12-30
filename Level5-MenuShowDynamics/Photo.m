#import "Photo.h"

@implementation Photo

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger:self.photoId forKey:@"photoId"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.filename forKey:@"filename"];
    [aCoder encodeObject:self.notes forKey:@"notes"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self) {
        self.photoId = [aDecoder decodeIntegerForKey:@"photoId"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.filename = [aDecoder decodeObjectForKey:@"filename"];
        self.notes = [aDecoder decodeObjectForKey:@"notes"];
    }
    return self;
}

- (UIImage *)loadImage:(NSString *)filename
{
    return [UIImage imageNamed:filename];
}

@end
