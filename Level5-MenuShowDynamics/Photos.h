#import <Foundation/Foundation.h>

@class Photo;

@interface Photos : NSObject <NSCoding>

@property (strong, nonatomic) NSArray *allPhotos;

+ (Photos *)getPhotosFromArchive;
+ (void)savePhotosToArchive:(Photos *)photos;

@end
