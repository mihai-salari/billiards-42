//
//  PhysicsModel.h
//  billiards-42
//
//  Created by Admin on 9/28/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#define COLLISION_WALL 1
#define COLLISION_BALL 2
#define COLLISION_POCKET 4

@protocol PhysicsModel <NSObject>

- (cpBody*) getBody;
- (void) setBody:(cpBody*) body;
- (cpShape*) getShape;
- (CGPoint) getPosition;

@property (readonly) uint collisionType;
@property (readonly) BOOL trackCollisions;
- (NSArray*) getSupportedCollisionTypes;

@end
