#import <Foundation/Foundation.h>

@interface Photo : NSObject <NSCoding>

@property (assign, nonatomic) NSInteger photoId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *filename;
@property (strong, nonatomic) NSString *notes;

- (UIImage *)loadImage:(NSString *)filename;

@end
