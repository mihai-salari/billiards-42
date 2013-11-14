//
//  PhysicsComponent.m
//  billiards-42
//
//  Created by Admin on 9/28/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "PhysicsComponent.h"

@implementation PhysicsComponent

- (void) startup{
    cpBody* body = [self.physicalModel getBody];
    
    cpSpaceAddShape(self.physicsSpace, [self.physicalModel getShape] );
    if( ! cpBodyIsStatic(body) ) { // dont add static bodies
        CGPoint pos = [self.physicalModel getPosition];
        cpBodySetPos(body, cpv( pos.x, pos.y ));
        cpSpaceAddBody(self.physicsSpace, body);
    }
    
}

- (void) update:(ccTime)delta {
    // empty update hook -- override
}

- (void) beforeRemove {
    // empty beforeRemove hook - override
}

+ (PhysicsComponent*) fromModel:(Model *)model {
    return (PhysicsComponent*) [model getComponentOfClass:[PhysicsComponent class] ];
}

@end
