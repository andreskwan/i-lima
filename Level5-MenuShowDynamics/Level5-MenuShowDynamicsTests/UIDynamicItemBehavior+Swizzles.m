//
//  UIDynamicItemBehavior+Swizzles.m
//  DynamicsFun
//
//  Created by Jon Friskics on 10/8/13.
//  Copyright (c) 2013 Code School. All rights reserved.
//

#import "UIDynamicItemBehavior+Swizzles.h"
#import "AppDelegate+TestAdditions.h"
#import "CSSwizzler.h"

@implementation UIDynamicItemBehavior (Swizzles)

+ (void)load
{
    [CSSwizzler swizzleClass:[UIDynamicItemBehavior class]
               replaceMethod:@selector(initWithItems:)
                  withMethod:@selector(custom_initWithItems:)];
}

- (instancetype)custom_initWithItems:(NSArray *)items
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.dynamicItems = items;
    
    return [self custom_initWithItems:items];
}

@end
