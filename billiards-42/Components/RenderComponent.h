//
//  RenderComponent.h
//  billiards-42
//
//  Created by Admin on 9/21/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Component.h"
#import "RenderableModel.h"
#import "ViewFactory.h"
#import "Model.h"

@interface RenderComponent : Component

- (View*) getView;

+ (RenderComponent*) fromModel:(Model*) model;

@end
