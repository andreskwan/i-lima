//
//  UISnapBehavior+Swizzles.m
//  Level5-MenuShowDynamics
//
//  Created by Jon Friskics on 10/8/13.
//  Copyright (c) 2013 Code School. All rights reserved.
//

#import "UISnapBehavior+Swizzles.h"
#import "CSSwizzler.h"
#import "AppDelegate+TestAdditions.h"

@implementation UISnapBehavior (Swizzles)

+ (void) load
{
    [CSSwizzler swizzleClass:[UISnapBehavior class]
               replaceMethod:@selector(initWithItem:snapToPoint:)
                  withMethod:@selector(custom_initWithItem:snapToPoint:)];
}

- (instancetype)custom_initWithItem:(id<UIDynamicItem>)item snapToPoint:(CGPoint)point
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    if(appDelegate.snapItem1.count > 0) {
        appDelegate.snapItem2 = @[item, @(point.x), @(point.y)];
    } else {
        appDelegate.snapItem1 = @[item, @(point.x), @(point.y)];
    }
    return [self custom_initWithItem:item snapToPoint:point];
}

@end
