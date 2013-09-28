//
//  Wall.m
//  billiards-42
//
//  Created by Admin on 9/26/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "Wall.h"
#import "PhysicsComponent.h"

@implementation Wall


- (id)initWithMid:(uint32_t)mid {
    if((self = [super init])) {
        _cpBody = nil;
        _cpShape = nil;
    }
    return self;
}


+ (NSArray *) listComponentsClasses {
    return [NSArray arrayWithObject:[PhysicsComponent class]];
}

- (cpBody *) getBody{
    if( _cpBody == nil ) [self _createBody];
    return _cpBody;
}

- (void) setBody:(cpBody *)body {
    _cpBody = body; // TODO: maybe through exception for wall in this method?
}


- (void) _createBody {
    _cpBody = cpBodyNewStatic(); // walls are static bodies
    _cpShape = cpSegmentShapeNew(_cpBody, cpv(self.start.x, self.start.y) , cpv(self.end.x, self.end.y) , 1); // and add shape to body
}

@end
