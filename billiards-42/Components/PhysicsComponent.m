//
//  PhysicsComponent.m
//  billiards-42
//
//  Created by Admin on 9/28/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "PhysicsComponent.h"

// static C callback funcitons for Chimpunk //
static int physicsComponentCollisionBegin( cpArbiter* arb, cpSpace* space, void* data) {
    PhysicsComponent* physicsComponent = (PhysicsComponent*) data;
    
    // NOTE: physics component here is fired for last Ball model, we need to check cpArbiter to find bodies
    
    CP_ARBITER_GET_BODIES(arb, bodyA, bodyB)
    
    Model<PhysicsModel>* modelA = [physicsComponent findByBody:bodyA];
    Model<PhysicsModel>* modelB = [physicsComponent findByBody:bodyB];
    
    NSLog(@"Collision of models %@ #%d and %@ #%d", NSStringFromClass([modelA class]),[modelA getMid],
                                                    NSStringFromClass([modelB class]),[modelB getMid]);
    
    PhysicsComponent* physicsComponentA = [PhysicsComponent fromModel:modelA]; // we need A because ususally it's the ball -- consider changes here
    [physicsComponentA processCollisionWith:modelB];
    
    return 1; // go on with collision
}
// ~ chimpunk callbacks

@implementation PhysicsComponent

- (void) startup{
    cpBody* body = [self.physicalModel getBody];
    
    cpBodySetUserData(body, self.physicalModel);
    
    cpSpaceAddShape(self.physicsSpace, [self.physicalModel getShape] );
    if( ! cpBodyIsStatic(body) ) { // dont add static bodies
        CGPoint pos = [self.physicalModel getPosition];
        cpBodySetPos(body, cpv( pos.x, pos.y ));
        cpSpaceAddBody(self.physicsSpace, body);
    }
    cpShapeSetCollisionType(self.physicalModel.getShape, self.physicalModel.collisionType); // set Collision type
    
    if( self.physicalModel.trackCollisions ) [self setupCollisionsTracking];
}

- (void) update:(ccTime)delta {
    [self applyVelocityLimits];
}

- (void) beforeRemove {
    // empty beforeRemove hook - override
}

- (void) setupCollisionsTracking {
    NSArray* supportedTypes = [self.physicalModel getSupportedCollisionTypes];
    cpCollisionType ownType = self.physicalModel.collisionType;
    for(int i=0;i<supportedTypes.count;i++) {
        cpCollisionType otherType = [((NSNumber*) supportedTypes[i]) intValue];
        cpSpaceAddCollisionHandler(self.physicsSpace, ownType, otherType , physicsComponentCollisionBegin, NULL, NULL, NULL, self);
    }
}

- (Model<PhysicsModel>*) findByBody:(cpBody*) body {
    return (Model<PhysicsModel>*) cpBodyGetUserData( body );
}

- (void) processCollisionWith:(Model<PhysicsModel> *)modelB {
    [self.delegate handleCollisionOf:self.physicalModel and:modelB];
}

// limit velocity
- (void) applyVelocityLimits {
    cpVect vel = cpBodyGetVel( [self.physicalModel getBody] );
    cpFloat len = cpvlength(vel);
    if( ( len > 0 ) && ( len< cpSpaceGetIdleSpeedThreshold(self.physicsSpace) ) ) {
        NSLog(@"Model %d has been stopped by threshold vel is %f",[self.model getMid],len);
        cpBodySetVel([self.physicalModel getBody],cpvzero); // set to zero
    }
}

+ (PhysicsComponent*) fromModel:(Model *)model {
    return (PhysicsComponent*) [model getComponentOfClass:[PhysicsComponent class] ];
}

@end
