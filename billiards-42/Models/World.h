//
//  World.h
//  billiards-42
//
//  Created by Admin on 9/26/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"
#import "RenderableModel.h"

@interface World : Model <RenderableModel>

@property (nonatomic,retain) CCNode* node;

@property CGSize size; // world size ( when zoomed in ) in points
@property (strong) NSString* background; // background image used


@end
