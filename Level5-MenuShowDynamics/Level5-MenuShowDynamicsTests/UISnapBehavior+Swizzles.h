//
//  UISnapBehavior+Swizzles.h
//  Level5-MenuShowDynamics
//
//  Created by Jon Friskics on 10/8/13.
//  Copyright (c) 2013 Code School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISnapBehavior (Swizzles)

- (instancetype)custom_initWithItem:(id<UIDynamicItem>)item snapToPoint:(CGPoint)point;

@end
