//
//  ZoomAndPanComponent.h
//  billiards-42
//
//  Created by Admin on 11/9/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "Component.h"
#import "RenderableModel.h"

@interface ZoomAndPanComponent : Component <UIGestureRecognizerDelegate>

@property (readonly) Model<RenderableModel>* renderableModel;

@property CGFloat minZoom;
@property CGFloat maxZoom;

- (void) disable;
- (void) enable;

@end
