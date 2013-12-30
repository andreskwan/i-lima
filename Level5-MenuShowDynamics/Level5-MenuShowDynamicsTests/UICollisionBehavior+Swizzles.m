//
//  UICollisionBehavior+Swizzles.m
//  DynamicsFun
//
//  Created by Jon Friskics on 10/8/13.
//  Copyright (c) 2013 Code School. All rights reserved.
//

#import "UICollisionBehavior+Swizzles.h"
#import "AppDelegate+TestAdditions.h"
#import "CSSwizzler.h"

@implementation UICollisionBehavior (Swizzles)

+ (void)load
{
    [CSSwizzler swizzleClass:[UICollisionBehavior class]
               replaceMethod:@selector(initWithItems:)
                  withMethod:@selector(custom_initWithItems:)];
}

- (instancetype)custom_initWithItems:(NSArray *)items
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.collisionItems = items;
    
    return [self custom_initWithItems:items];
}

@end
