//
//  UIDynamicAnimator+Swizzles.m
//  DynamicsFun
//
//  Created by Jon Friskics on 10/8/13.
//  Copyright (c) 2013 Code School. All rights reserved.
//

#import "UIDynamicAnimator+Swizzles.h"
#import "CSSwizzler.h"
#import "AppDelegate+TestAdditions.h"

@implementation UIDynamicAnimator (Swizzles)

+ (void)load
{
    [CSSwizzler swizzleClass:[UIDynamicAnimator class]
               replaceMethod:@selector(initWithReferenceView:)
                  withMethod:@selector(custom_initWithReferenceView:)];
    
    [CSSwizzler swizzleClass:[UIDynamicAnimator class]
               replaceMethod:@selector(addBehavior:)
                  withMethod:@selector(custom_addBehavior:)];
}

- (instancetype)custom_initWithReferenceView:(UIView *)view
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.animatorInitCalled = @(YES);
    
    appDelegate.referenceFrame = NSStringFromCGRect(view.frame);
    
    return [self custom_initWithReferenceView:view];
}

- (void)custom_addBehavior:(UIDynamicBehavior *)behavior
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    if([appDelegate.shouldIAddBehaviors boolValue]) {
        [self custom_addBehavior:behavior];
    } else {
    }
}

@end
