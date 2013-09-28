//
//  Ball.m
//  billiards-42
//
//  Created by Admin on 9/26/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "Ball.h"
#import "PhysicsComponent.h"
#import "RenderComponent.h"

@implementation Ball


- (id)initWithMid:(uint32_t)mid {
    if((self = [super init])) {
        _cpBody = nil;
        _cpShape = nil;
    }
    return self;
}

+ (NSArray *) listComponentsClasses {
    return [NSArray arrayWithObjects:[RenderComponent class],[PhysicsComponent class], nil];
}


// RenderableModel

- (CGSize) getSize{
    return CGSizeMake(62.0, 62.0); //stub
}

- (CCTexture2D*) getTexture {
    CCTexture2D *_texture = [[CCTextureCache sharedTextureCache] addImage: @"ball1.png" ];
    return _texture;
}

- (CGPoint) getPosition
{
    return self.position;
}

// PhysicsModel


- (cpBody *) getBody{
    if( _cpBody == nil ) [self _createBody];
    return _cpBody;
}

- (void) setBody:(cpBody *)body {
    _cpBody = body;
}


- (void) _createBody {
    _cpBody = cpBodyNewStatic(); // walls are static bodies
    _cpShape = cpCircleShapeNew(_cpBody, self.radius, cpvzero);
}


 
@end
