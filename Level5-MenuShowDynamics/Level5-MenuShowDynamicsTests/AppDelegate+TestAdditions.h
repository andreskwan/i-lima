//
//  AppDelegate+TestAdditions.h
//  Level3-AnimatedTransition
//
//  Created by Eric Allam on 9/14/13.
//  Copyright (c) 2013 Code School. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (TestAdditions)

@property (strong, nonatomic) NSNumber *animatorInitCalled;
@property (strong, nonatomic) NSString *referenceFrame;
@property (strong, nonatomic) NSArray *gravityItems;
@property (strong, nonatomic) NSArray *collisionItems;
@property (strong, nonatomic) NSArray *dynamicItems;
@property (strong, nonatomic) NSArray *snapItem1;
@property (strong, nonatomic) NSArray *snapItem2;
@property (strong, nonatomic) NSNumber *shouldIAddBehaviors;

@end
