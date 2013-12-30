#import <XCTest/XCTest.h>
#import "CSRecordingTestCase.h"
#import "CSPropertyDefinition.h"
#import "AppDelegate.h"
#import "AppDelegate+TestAdditions.h"
#import "CSPhotoDetailVC.h"
#import "LongPressOverlay.h"

@interface Level5_MenuShowDynamicsTests : CSRecordingTestCase {
    AppDelegate *_appDel;
}

@end

@implementation Level5_MenuShowDynamicsTests

- (void)setUp
{
    [super setUp];
    _appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _appDel.shouldIAddBehaviors = @NO;
    
    _appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [(UITabBarController *)_appDel.window.rootViewController setSelectedIndex:0];
    [(UINavigationController *)[[(UITabBarController *)_appDel.window.rootViewController viewControllers] objectAtIndex:0] popToRootViewControllerAnimated:YES];
}

- (void)tearDown
{
    _appDel.snapItem1 = nil;
    _appDel.snapItem2 = nil;
    [super tearDown];
}

- (void)testSnapBehaviorMailButton
{
    CSPropertyDefinition *property = [self animatorProperty];
    if(property) {
        _appDel.shouldIAddBehaviors = @YES;
        [tester waitForViewWithAccessibilityLabel:@"cell"];
        [tester tapViewWithAccessibilityLabel:@"cell"];
        [tester waitForViewWithAccessibilityLabel:@"photoImageView"];
        UINavigationController *navController = (UINavigationController *)[[(UITabBarController *)_appDel.window.rootViewController viewControllers] objectAtIndex:0];
        CSPhotoDetailVC *photoDetailVC = (CSPhotoDetailVC *)navController.topViewController;
        [tester longPressViewWithAccessibilityLabel:@"photoImageView" duration:0.2f];

        __block LongPressOverlay *longPressOverlay;
        [photoDetailVC.view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if([[obj accessibilityLabel] isEqualToString:@"overlay"]) {
                longPressOverlay = (LongPressOverlay *)obj;
            }
        }];

        if(longPressOverlay.animator.behaviors.count > 0) {
            [longPressOverlay.animator.behaviors enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                XCTAssert([obj isKindOfClass:[UISnapBehavior class]], @"You created a dynamic behavior, but it is not a snap behavior");
                if([[_appDel.snapItem1[0] accessibilityLabel] isEqualToString:@"mailButton"]) {
                    XCTAssertEqualWithAccuracy([_appDel.snapItem1[1] floatValue], 135, 0.5, @"Did not snap the mailButton to a point 25 pts to the left of the long press");
                    XCTAssertEqualWithAccuracy([_appDel.snapItem1[2] floatValue], 70, 0.5, @"Did not snap the mailButton to a point 30 pts above the long press");
                    XCTAssert([longPressOverlay.animator.behaviors[0] damping] >= 0.8 && [longPressOverlay.animator.behaviors[0] damping] <= 1.0, @"Did not set the damping for the first snap behavior between 0.8 and 1.0");
                    
                } else if([[_appDel.snapItem2[0] accessibilityLabel] isEqualToString:@"mailButton"]) {
                    NSLog(@"position: %@ %f",NSStringFromCGPoint(longPressOverlay.pointOfLongPress),[_appDel.snapItem2[1] floatValue]);
                    XCTAssertEqualWithAccuracy([_appDel.snapItem2[1] floatValue], 135, 0.5, @"Did not snap the mailButton to a point 25 pts to the left of the long press");
                    XCTAssertEqualWithAccuracy([_appDel.snapItem2[2] floatValue], 70, 0.5, @"Did not snap the mailButton to a point 25 pts to the left of the long press");
                    XCTAssert([longPressOverlay.animator.behaviors[1] damping] >= 0.8 && [longPressOverlay.animator.behaviors[0] damping] <= 1.0, @"Did not set the damping for the mailButton snap behavior between 0.8 and 1.0");
                } else {
                    XCTFail(@"Did not create a dynamic behavior for self.mailButton");
                }
            }];
        } else {
            XCTFail(@"Did not create any snap behaviors");
        }
    } else {
        XCTFail(@"You won't be able to attempt this challenge without a UIDynamicAnimator property.  There was one when you first downloaded this project, so you might want to delete this project and try again.");
    }
}

- (void)testSnapBehaviorEditButton
{
    CSPropertyDefinition *property = [self animatorProperty];
    if(property) {
        _appDel.shouldIAddBehaviors = @YES;
        [tester waitForViewWithAccessibilityLabel:@"cell"];
        [tester tapViewWithAccessibilityLabel:@"cell"];
        [tester waitForViewWithAccessibilityLabel:@"photoImageView"];
        UINavigationController *navController = (UINavigationController *)[[(UITabBarController *)_appDel.window.rootViewController viewControllers] objectAtIndex:0];
        CSPhotoDetailVC *photoDetailVC = (CSPhotoDetailVC *)navController.topViewController;
        [tester longPressViewWithAccessibilityLabel:@"photoImageView" duration:0.2f];
        
        __block LongPressOverlay *longPressOverlay;
        [photoDetailVC.view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if([[obj accessibilityLabel] isEqualToString:@"overlay"]) {
                longPressOverlay = (LongPressOverlay *)obj;
            }
        }];
        
        if(longPressOverlay.animator.behaviors.count > 0) {
            [longPressOverlay.animator.behaviors enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                XCTAssert([obj isKindOfClass:[UISnapBehavior class]], @"You created a dynamic behavior, but it is not a snap behavior");
                if([[_appDel.snapItem1[0] accessibilityLabel] isEqualToString:@"editButton"]) {
                    XCTAssertEqualWithAccuracy([_appDel.snapItem1[1] floatValue], 135, 0.5, @"Did not snap the editButton to a point 25 pts to the right of the long press");
                    XCTAssertEqualWithAccuracy([_appDel.snapItem1[2] floatValue], 70, 0.5, @"Did not snap the editButton to a point 30 pts above the long press");
                    XCTAssert([longPressOverlay.animator.behaviors[0] damping] >= 0.8 && [longPressOverlay.animator.behaviors[0] damping] <= 1.0, @"Did not set the damping for the editButton snap behavior between 0.8 and 1.0");
                    
                } else if([[_appDel.snapItem2[0] accessibilityLabel] isEqualToString:@"editButton"]) {
                    NSLog(@"position: %@ %f",NSStringFromCGPoint(longPressOverlay.pointOfLongPress),[_appDel.snapItem2[1] floatValue]);
                    XCTAssertEqualWithAccuracy([_appDel.snapItem2[1] floatValue], 185, 0.5, @"Did not snap the editButton to a point 25 pts to the left of the long press");
                    XCTAssertEqualWithAccuracy([_appDel.snapItem2[2] floatValue], 70, 0.5, @"Did not snap the editButton to a point 25 pts to the left of the long press");
                    XCTAssert([longPressOverlay.animator.behaviors[1] damping] >= 0.8 && [longPressOverlay.animator.behaviors[0] damping] <= 1.0, @"Did not set the damping for the first snap behavior between 0.8 and 1.0");
                } else {
                    XCTFail(@"Did not create a dynamic behavior for self.editButton");
                }
            }];
        } else {
            XCTFail(@"Did not create any snap behaviors");
        }
    } else {
        XCTFail(@"You won't be able to attempt this challenge without a UIDynamicAnimator property.  There was one when you first downloaded this project, so you might want to delete this project and try again.");
    }
}


- (CSPropertyDefinition *)animatorProperty
{
    CSPropertyDefinition *property;
    
    property = [CSPropertyDefinition firstPropertyWithType:@"UIDynamicAnimator" forClass:[LongPressOverlay class]];
    
    return property;
}

@end
