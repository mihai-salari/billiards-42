//
//  Model.m
//  billiards-42
//
//  Created by Admin on 9/21/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "Model.h"
#import "Component.h"
#import "RenderComponent.h"
#import "View.h"

@implementation Model {
    uint32_t _mid;
    NSMutableArray* _components;
}

- (id)init {
    if((self = [super init])) {
        _components = [NSMutableArray array];
        [_components retain];
    }
    return self;
}

- (id)initWithMid:(uint32_t)mid {
    if((self = [super init])) {
        self->_mid = mid;
        self->_components = [NSMutableArray array];
        [_components retain];
    }
    return self;
}

- (uint32_t) mid {
    return _mid;
}

- (void) setMid:(uint32_t) val {
    _mid = val;
}

- (void) addComponent:(NSObject *)component {
    // adds component
    [_components addObject:component];
}

- (NSObject *) getComponentOfClass:(Class)klass {
    for( NSObject* c in _components ) {
        if( [c isKindOfClass:klass] ) return c;
    }
    return nil; // return nil if not found
}

- (void) loadFromJSON:(NSDictionary *)jsonDict {
    // empty here - override in child classes
    // TODO: maybe through NotImplementedException???
}

- (CCNode*) getNode {
    RenderComponent* renderComponent = (RenderComponent*) [self getComponentOfClass:[RenderComponent class] ];
    if( renderComponent ) {
        View* view = [renderComponent getView];
        return view.node; // get node from view
    }
    return nil;
}

+ (NSArray*) listComponentsClasses {
    return [NSArray array];
}

@end
