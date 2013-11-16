//
//  Pocket.h
//  billiards-42
//
//  Created by Admin on 9/26/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "Model.h"
#import "RenderComponent.h"
#import "RenderableModel.h"
#import "PhysicsModel.h"

@interface Pocket : Model <RenderableModel,PhysicsModel> {
    cpBody * _cpBody;
    cpShape * _cpShape;
}

@property CGPoint center; // Pocket center
@property CGFloat radius; // Pocket radius

@end
