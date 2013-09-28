//
//  Ball.h
//  billiards-42
//
//  Created by Admin on 9/26/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "Model.h"
#import "RenderableModel.h"
#import "PhysicsModel.h"

@interface Ball : Model <RenderableModel, PhysicsModel>

@property CGPoint position; // ball position
@property CGFloat radius; // ball radius

@end
