#import "Photos.h"

@implementation Photos

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.allPhotos forKey:@"allPhotos"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self) {
        self.allPhotos = [aDecoder decodeObjectForKey:@"allPhotos"];
    }
    return self;
}

+ (NSString *)pathToArchive {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [paths objectAtIndex:0];
    return [docsDir stringByAppendingPathComponent:@"photos.model"];
}

+ (Photos *)getPhotosFromArchive {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[Photos pathToArchive]];
}

+ (void)savePhotosToArchive:(NSArray *)photos {
    [NSKeyedArchiver archiveRootObject:photos toFile:[Photos pathToArchive]];
}

@end
