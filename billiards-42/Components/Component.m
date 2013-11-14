//
//  Component.m
//  billiards-42
//
//  Created by Admin on 9/21/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "Component.h"

@implementation Component

- (id) initWithModel:(Model *)model {
    if((self = [super init])) {
        self.model= model;
    }
    return self;
}

- (Model<RenderableModel> *) renderableModel {
    if( ! [[self.model class] conformsToProtocol:@protocol(RenderableModel)] ) {
        NSLog(@"Class %@ does not conforms to renderableModel", NSStringFromClass([self.model class]) );
        return nil;
    } else return (Model<RenderableModel>*) self.model;
}

- (Model<PhysicsModel> *) physicalModel {
    if( ! [[self.model class] conformsToProtocol:@protocol(PhysicsModel)] ) {
        NSLog(@"Class %@ does not conforms to physicsModel", NSStringFromClass([self.model class]) );
        return nil;
    } else return (Model<PhysicsModel>*) self.model;
}

- (void) startup{
    // empty startup hook -- override
}

- (void) update:(ccTime)delta {
    // empty update hook -- override
}

- (void) beforeRemove {
    // empty beforeRemove hook - override 
}

@end
