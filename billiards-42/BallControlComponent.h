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

@property (retain) BallControlView* view;

- (void)touchStarted;
- (void)touchMoved:(CGPoint) touch;
- (void)touchCompleted:(CGPoint) touch;

+ (BallControlComponent*) fromModel:(Model*) model;

@end
