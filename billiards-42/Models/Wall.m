//
//  Wall.m
//  billiards-42
//
//  Created by Admin on 9/26/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "Wall.h"
#import "PhysicsComponent.h"
#import "ModelFactory.h"

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

- (cpShape *) getShape{
    if( _cpShape == nil ) [self _createBody];
    return _cpShape;
}

- (CGPoint) getPosition
{
    return self.start;
}

- (void) _createBody {
    _cpBody = cpBodyNewStatic(); // walls are static bodies
    _cpShape = cpSegmentShapeNew(_cpBody, cpv(self.start.x / 2.0f, self.start.y / 2.0f) , cpv(self.end.x / 2.0f, self.end.y / 2.0f) , 2); // and add shape to body
}


// load

- (void) loadFromJSON:(NSDictionary *)jsonDict {
    self.start = [ModelFactory CGPointFromJSON:jsonDict[@"start"]];
    self.end = [ModelFactory CGPointFromJSON:jsonDict[@"end"]];
}

@end
