//
//  RenderComponent.m
//  billiards-42
//
//  Created by Admin on 9/21/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

// RenderComponent takes a Model
// and looks for View
// and calls view to init and update Models representation

#import "RenderComponent.h"

@implementation RenderComponent {
    View* _view;
}

- (Model<RenderableModel> *) renderableModel {
    return (Model<RenderableModel>*) self.model;
}



- (void) startup{
    // create view
    _view = [ViewFactory BuildViewByName:NSStringFromClass(self.model.class)];
    _view.model = self.renderableModel; // set model ref
    _view.renderLayer = self.renderLayer; // set layer
    [_view startup];
}

- (void) update:(ccTime)delta {
}

- (void) beforeRemove {
}


@end
