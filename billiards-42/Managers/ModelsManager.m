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
    NSMutableArray * _components;
    uint32_t _lowestUnassignedMid;
}

- (id) init {
    if((self = [super init])) {
        _models = [NSMutableArray array];
        _components = [NSMutableArray array]; // to iterate easily through all components in game
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
    [_components addObject:component]; // this IS redundant, but allows us to search fast and easy
}

- (NSMutableArray *) allComponents {
    return _components;
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
    NSError *error = nil;
    NSString* content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    NSData *jsonData = [content dataUsingEncoding:NSASCIIStringEncoding];
    NSDictionary * jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    // process json
    uint32_t levelId = jsonDict[@"id"]; // Do we need it???
    NSArray * models = jsonDict[@"models"];

    for (NSDictionary* modelDict in models) {
        [self createModelFromJson:modelDict];
    }
    
//    NSLog(@"JSON: %@", jsonDict);
    
}

- (void) createModelFromJson:(NSDictionary*) jsonDict {
    NSLog(@"Model JSON: %@", jsonDict);
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
