//
//  View.h
//  billiards-42
//
//  Created by Admin on 10/20/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"
#import "RenderableModel.h"


// base class for View
// view renders 
@interface View : NSObject

@property (retain) Model<RenderableModel> * model;
@property (retain) CCLayer* renderLayer;
@property (retain) CCLayer* controlLayer;
@property (retain) CCNode* node;

- (void) startup;
- (void) update:(ccTime) delta; // update
- (void) beforeRemove;

@end
