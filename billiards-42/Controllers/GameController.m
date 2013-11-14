//
//  GameController.m
//  billiards-42
//
//  Created by Admin on 9/21/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "GameController.h"
#import "ZoomAndPanComponent.h"

@implementation GameController

- (id) init {
    if((self = [super init])) {
        self.modelsManager = [[ModelsManager alloc] init];
    }
    return self;
}


- (id) initWithJSON:(NSString *)filePath {
    if([self init]) {
        [self loadFromJSON:filePath];
    }
    return self;
}

- (void) loadFromJSON:(NSString *)filePath {
    [self.modelsManager loadFromJSON:filePath];
}

// starts everything
- (void) start {
    NSMutableArray* components = [self.modelsManager allComponents];
    for (Component* component in components) {
        component.renderLayer = self.renderLayer;
        component.physicsSpace = self.physicsSpace;
        component.controlLayer = self.controlLayer;
    }
    [self componentsStartup];
}

- (void) update:(ccTime)delta {
    [self componentsUpdate:delta];
}

- (void) componentsHookHelper:(NSString *)methodName {
    SEL selector = NSSelectorFromString(methodName);
    NSMutableArray* components = [self.modelsManager allComponents];
    for (Component* component in components) {
        [component performSelector:selector];
    }
}

// calls Startup for every component
- (void) componentsStartup{
    [self componentsHookHelper:@"startup"];
}

// calls beforeRemove for every component
- (void) componentsBeforeRemove{
    [self componentsHookHelper:@"beforeRemove"];
}

// calls Update for every component
- (void) componentsUpdate:(ccTime)delta {
    NSMutableArray* components = [self.modelsManager allComponents];
    for (Component* component in components) {
        [component update:delta];
    }
}

- (void) enableZoomAndPan {
    ZoomAndPanComponent* zoomAndPan = (ZoomAndPanComponent*)[_modelsManager.world getComponentOfClass:[ZoomAndPanComponent class]];
    [zoomAndPan enable];
}

- (void) disableZoomAndPan {
    ZoomAndPanComponent* zoomAndPan = (ZoomAndPanComponent*)[_modelsManager.world getComponentOfClass:[ZoomAndPanComponent class]];
    [zoomAndPan disable];
}

@end
