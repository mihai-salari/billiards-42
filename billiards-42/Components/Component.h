//
//  Component.h
//  billiards-42
//
//  Created by Admin on 9/21/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Model.h"
#import "RenderableModel.h"
#import "PhysicsModel.h"
#import "GameDelegate.h"

@interface Component : NSObject

@property (strong) Model *model;
// following props made to interact with scene
@property (retain) CCLayer* renderLayer;
@property (retain) CCLayer* controlLayer;
@property cpSpace* physicsSpace;

@property (readonly) Model<RenderableModel>* renderableModel;
@property (readonly) Model<PhysicsModel>* physicalModel;

@property (retain) NSObject<GameDelegate>* delegate; // game delegate

- (id) initWithModel:(Model *) model;
- (void) startup; // startup hook - runs once - when level is loaded
- (void) update:(ccTime) delta; // update
- (void) beforeRemove; // fires before model is removed from ModelsManager

@end
