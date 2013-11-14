//
//  BallControlComponent.h
//  billiards-42
//
//  Created by Abliamit Abliamitov on 14.11.13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "Component.h"
#import "BallControlView.h"
#import "RenderableModel.h"
#import "PhysicsModel.h"

@interface BallControlComponent : Component

@property (readonly) Model<RenderableModel>* renderableModel;
@property (readonly) Model<PhysicsModel>* physicalModel;
@property (retain) BallControlView* view;

- (void)touchStarted;
- (void)touchMoved:(CGPoint) touch;
- (void)touchCompleted:(CGPoint) touch;

@end
