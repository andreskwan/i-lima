//
//  UICollisionBehavior+Swizzles.h
//  DynamicsFun
//
//  Created by Jon Friskics on 10/8/13.
//  Copyright (c) 2013 Code School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollisionBehavior (Swizzles)

- (instancetype)custom_initWithItems:(NSArray *)items;

@end
