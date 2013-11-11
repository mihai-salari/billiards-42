//
//  GameController.h
//  billiards-42
//
//  Created by Admin on 9/21/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelsManager.h"

@interface GameController : NSObject

@property (retain) ModelsManager *modelsManager; // Controller creates it in init
@property (retain) CCLayer* renderLayer;
@property cpSpace* physicsSpace;

- (id) init;
- (id) initWithJSON:(NSString *) filePath;
- (void) loadFromJSON:(NSString *)filePath;
// components hooks
- (void) componentsStartup;
- (void) componentsUpdate:(ccTime) delta;
- (void) componentsBeforeRemove;
//
- (void) start; // called by creator, calls componentsStartup
- (void) update:(ccTime) delta;

- (void) componentsHookHelper:(NSString *) methodName;

- (void) disableZoomAndPan; // enable/disable touch events
- (void) enableZoomAndPan;


@end
