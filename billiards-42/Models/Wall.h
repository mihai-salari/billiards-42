//
//  Wall.h
//  billiards-42
//
//  Created by Admin on 9/26/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "Model.h"
#import "PhysicsModel.h"


// Wall is renderless model -- only affects physics
@interface Wall : Model <PhysicsModel>

@property CGPoint start; // it will use Line segments in physics
@property CGPoint end;

@end
