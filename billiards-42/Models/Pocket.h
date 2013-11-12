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

@interface Pocket : Model <RenderableModel>

@property CGPoint center; // Pocket center
@property CGFloat radius; // Pocket radius

@end
