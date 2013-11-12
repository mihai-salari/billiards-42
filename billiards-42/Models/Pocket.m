//
//  Pocket.m
//  billiards-42
//
//  Created by Admin on 9/26/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "Pocket.h"
#import "ModelFactory.h"

@implementation Pocket

+ (NSArray *) listComponentsClasses {
    return [NSArray arrayWithObjects:[RenderComponent class], nil];
}


// RenderableModel

- (CGSize) getSize{
    return CGSizeMake(self.radius, self.radius);
}

- (CCTexture2D*) getTexture {
    CCTexture2D *_texture = [[CCTextureCache sharedTextureCache] addImage: @"pocket.png" ];
    return _texture;
}

- (CGPoint) getPosition
{
    return CGPointMake( self.center.x/2, self.center.y /2);
}


- (void) loadFromJSON:(NSDictionary *)jsonDict {
    self.center = [ModelFactory CGPointFromJSON:jsonDict[@"center"]];
    self.radius = [( (NSNumber*) jsonDict[@"radius"] ) floatValue];
}

@end
