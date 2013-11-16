//
//  Pocket.m
//  billiards-42
//
//  Created by Admin on 9/26/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "Pocket.h"
#import "ModelFactory.h"
#import "PhysicsComponent.h"

@implementation Pocket

+ (NSArray *) listComponentsClasses {
    return [NSArray arrayWithObjects:[RenderComponent class],[PhysicsComponent class], nil];
}


// RenderableModel

- (CGSize) getSize{
    return CGSizeMake(self.radius, self.radius);
}

- (CCTexture2D*) getTexture {
    CCTexture2D *_texture = [[CCTextureCache sharedTextureCache] addImage: @"pocket.png" ];
    return _texture;
}

- (CGPoint) getPosition
{
    return CGPointMake( self.center.x/2, self.center.y /2);
}

// PhysicsModel


- (cpBody *) getBody{
    if( _cpBody == nil ) [self _createBody];
    return _cpBody;
}

- (cpShape *) getShape{
    if( _cpShape == nil ) [self _createBody];
    return _cpShape;
}

- (void) setBody:(cpBody *)body {
    _cpBody = body;
}

- (void) _createBody {
    _cpBody = cpBodyNew(10.0f, cpMomentForCircle(10.0f, 0, self.radius / 2, cpvzero));
    _cpShape = cpCircleShapeNew(_cpBody, self.radius / 4 , cpvzero);

    cpShapeSetSensor(_cpShape, YES); // No real collisions
    
    cpShapeSetElasticity( _cpShape, 0.0f );
	cpShapeSetFriction( _cpShape, 0.0f );
}

- (uint) collisionType {
    return COLLISION_POCKET;
}

- (BOOL) trackCollisions {
    return NO;
}

- (NSArray*) getSupportedCollisionTypes {
    return NULL;
}

// ~ PhysicsModel


- (void) loadFromJSON:(NSDictionary *)jsonDict {
    self.center = [ModelFactory CGPointFromJSON:jsonDict[@"center"]];
    self.radius = [( (NSNumber*) jsonDict[@"radius"] ) floatValue];
}

@end
