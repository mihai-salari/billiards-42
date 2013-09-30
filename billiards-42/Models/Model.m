//
//  Model.m
//  billiards-42
//
//  Created by Admin on 9/21/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "Model.h"

@implementation Model {
    uint32_t _mid;
    NSMutableArray* _components;
}

- (id)initWithMid:(uint32_t)mid {
    if((self = [super init])) {
        _mid = mid;
        _components = [NSMutableArray array];
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

+ (NSArray*) listComponentsClasses {
    return [NSArray array];
}

@end
