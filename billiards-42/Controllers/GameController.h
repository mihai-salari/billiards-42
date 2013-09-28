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

@property (strong) ModelsManager *modelsManager; // Controller creates it in init

- (id) init;
- (id) initWithJSON:(NSString *) filePath;
- (void) loadFromJSON:(NSString *)filePath;
// components hooks
- (void) componentsStartup;
- (void) componentsUpdate:(ccTime) delta;
- (void) componentsBeforeRemove;

- (void) componentsHookHelper:(NSString *) methodName;


@end
