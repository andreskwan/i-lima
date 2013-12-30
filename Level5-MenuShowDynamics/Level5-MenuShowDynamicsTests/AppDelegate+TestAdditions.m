//
//  AppDelegate+TestAdditions.m
//  Level3-AnimatedTransition
//
//  Created by Eric Allam on 9/14/13.
//  Copyright (c) 2013 Code School. All rights reserved.
//

#import "AppDelegate+TestAdditions.h"
#import <objc/objc-runtime.h>


static char animatorInitCalledKey;
static char referenceFrameKey;
static char gravityItemsKey;
static char collisionItemsKey;
static char dynamicItemsKey;
static char snapItem1Key;
static char snapItem2Key;
static char shouldIAddBehaviorsKey;

@implementation AppDelegate (TestAdditions)

- (void) setAnimatorInitCalled:(NSNumber *)animatorInitCalled
{
    objc_setAssociatedObject(self, &animatorInitCalledKey, animatorInitCalled, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSNumber *)animatorInitCalled
{
    return objc_getAssociatedObject(self, &animatorInitCalledKey);
}

- (void) setReferenceFrame:(NSString *)referenceFrame
{
    objc_setAssociatedObject(self, &referenceFrameKey, referenceFrame, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)referenceFrame
{
    return objc_getAssociatedObject(self, &referenceFrameKey);
}

- (void) setGravityItems:(NSArray *)gravityItems
{
    objc_setAssociatedObject(self, &gravityItemsKey, gravityItems, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSArray *)gravityItems
{
    return objc_getAssociatedObject(self, &gravityItemsKey);
}

- (void) setCollisionItems:(NSArray *)collisionItems
{
    objc_setAssociatedObject(self, &collisionItemsKey, collisionItems, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSArray *)collisionItems
{
    return objc_getAssociatedObject(self, &collisionItemsKey);
}

- (void) setDynamicItems:(NSArray *)dynamicItems
{
    objc_setAssociatedObject(self, &dynamicItemsKey, dynamicItems, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSArray *)dynamicItems
{
    return objc_getAssociatedObject(self, &dynamicItemsKey);
}

- (void)setSnapItem1:(NSArray *)snapItem1
{
    objc_setAssociatedObject(self, &snapItem1Key, snapItem1, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSArray *)snapItem1
{
    return objc_getAssociatedObject(self, &snapItem1Key);
}

- (void)setSnapItem2:(NSArray *)snapItem2
{
    objc_setAssociatedObject(self, &snapItem2Key, snapItem2, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSArray *)snapItem2
{
    return objc_getAssociatedObject(self, &snapItem2Key);
}

- (void)setShouldIAddBehaviors:(NSNumber *)shouldIAddBehaviors
{
    objc_setAssociatedObject(self, &shouldIAddBehaviorsKey, shouldIAddBehaviors, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSNumber *)shouldIAddBehaviors
{
    return objc_getAssociatedObject(self, &shouldIAddBehaviorsKey);
}

@end
