//
//  PhysicsComponent.m
//  billiards-42
//
//  Created by Admin on 9/28/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "PhysicsComponent.h"

@implementation PhysicsComponent

- (Model<PhysicsModel> *) physicalModel {
    return (Model<PhysicsModel>*) self.model;
}

- (void) startup{
    cpBody* body = [self.physicalModel getBody];
    CGPoint pos = [self.physicalModel getPosition];
    cpBodySetPos(body, cpv( pos.x, pos.y ));
    cpSpaceAddShape(self.physicsSpace, [self.physicalModel getShape] );
    cpSpaceAddBody(self.physicsSpace, body);
    
}

- (void) update:(ccTime)delta {
    // empty update hook -- override
}

- (void) beforeRemove {
    // empty beforeRemove hook - override
}

@end
