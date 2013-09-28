//
//  World.m
//  billiards-42
//
//  Created by Admin on 9/26/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "World.h"
#import "RenderComponent.h"

@implementation World

+ (NSArray *) listComponentsClasses {
    return [NSArray arrayWithObject:[RenderComponent class]];
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
    return CGPointMake(0, 0);
}

@end