//
//  ModelsManager.m
//  billiards-42
//
//  Created by Admin on 9/21/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "ModelsManager.h"

@implementation ModelsManager {
    NSMutableArray * _models;
    NSMutableDictionary * _componentsByClass;
    uint32_t _lowestUnassignedMid;
}

- (id) init {
    if((self = [super init])) {
        _models = [NSMutableArray array];
        _componentsByClass = [NSMutableDictionary dictionary];
        _lowestUnassignedMid = 1;
    }
    return self;
}

- (uint32_t) generateNewMid {
    if( _lowestUnassignedMid < UINT32_MAX) {
        return _lowestUnassignedMid++;
    } else {
        for( uint32_t i = 1; i < UINT32_MAX; ++i) {
            if( ![_models containsObject:@(i) ]) {
                return i;
            }
        }
        NSLog(@"ERROR: No available MIDs!");
        return 0;
    }
}


- (void) addComponent:(Component *)component toModel:(Model *)model {
    NSMutableDictionary * components = _componentsByClass[NSStringFromClass([component class])];
    if( !components ) {
        components = [NSMutableDictionary dictionary];
        _componentsByClass[NSStringFromClass([component class])] = components;
    }
    components[@(model.mid)] = component; // this maybe redundant
    [model addComponent:component];
}

- (Component *) getComponentOfClass:(Class)class forModel:(Model *)model {
    return _componentsByClass[NSStringFromClass(class)][@(model.mid)];
}

// adds model
- (void) addModel:(Model *)model {
    if (model.mid == 0) {
        model.mid = [self generateNewMid];
    }
    [_models addObject:model];
}

// removes model
- (void) removeModel:(Model *)model {
    for( NSMutableDictionary * components in _componentsByClass.allValues ) {
        if( components[@(model.mid)]) {
            // TODO: call each component's "Remove" hook here
            // like render component should remove assosiated sprite
            // and physics component to remove assosiated body
            [components removeObjectForKey:@(model.mid)];
        }
    }
    [_models removeObject:@(model.mid)];
}

- (void) loadFromJSON:(NSString *)filePath {
    // TODO: implement
}

/*- (NSArray *) getAllModelsPosessingComponentOfClass:(Class)class {
    NSMutableDictionary * components = _componentsByClass[NSStringFromClass(class)];
    if( components ) {
        NSMutableArray * retval = [NSMutableArray arrayWithCapacity:components.allKeys.count];
        for(NSNumber* mid in components.allKeys) {
            [retval addObject:[[Model a]]]
        }
    }
}*/ // Ray does some freaky stuff here

@end