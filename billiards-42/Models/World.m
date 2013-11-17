//
//  World.m
//  billiards-42
//
//  Created by Admin on 9/26/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "World.h"
#import "RenderComponent.h"
#import "ZoomAndPanComponent.h"
#import "ModelFactory.h"

@implementation World

+ (NSArray *) listComponentsClasses {
    return [NSArray arrayWithObjects:[RenderComponent class],[ZoomAndPanComponent class],nil];
}

- (CGSize) getSize{
    return self.size;
}

- (CCTexture2D*) getTexture {
    CCTexture2D *_texture = [[CCTextureCache sharedTextureCache] addImage: self.background ];
    return _texture;
}

- (CGPoint) getPosition
{
    return CGPointMake(0 ,0);
}

- (void) loadFromJSON:(NSDictionary *)jsonDict {
    self.mid = [((NSNumber* )jsonDict[@"mid"]) integerValue ];
    self.size = [ModelFactory CGSizeFromJSON:jsonDict[@"size"]];
    self.background = jsonDict[@"background"];
    self.physicsDamping = [((NSNumber* )jsonDict[@"physics_damping"]) floatValue ];
    self.physicsIdleSpeed = [((NSNumber* )jsonDict[@"physics_idle_speed"]) floatValue ];
}

@end
