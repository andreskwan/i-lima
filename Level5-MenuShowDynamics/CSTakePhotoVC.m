#import "CSTakePhotoVC.h"

@implementation CSTakePhotoVC

- (id)init
{
    self = [super init];
    if(self) {
        self.title = @"Take Photo";
        self.tabBarItem.image = [UIImage imageNamed:@"714-camera"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIAlertView *noCameraAlert = [[UIAlertView alloc] initWithTitle:@"No Camera"
                                                            message:@"The camera isn't available in the simulator - sorry!"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
    noCameraAlert.delegate = self;
    [noCameraAlert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    self.tabBarController.selectedViewController = [self.tabBarController.viewControllers objectAtIndex:0];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
