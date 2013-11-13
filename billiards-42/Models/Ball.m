//
//  Ball.m
//  billiards-42
//
//  Created by Admin on 9/26/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "Ball.h"
#import "PhysicsComponent.h"
#import "RenderComponent.h"
#import "ModelFactory.h"
#import "CirclePrimitive.h"

@implementation Ball


- (id)initWithMid:(uint32_t)mid {
    if((self = [super init])) {
        _cpBody = nil;
        _cpShape = nil;
    }
    return self;
}

+ (NSArray *) listComponentsClasses {
    return [NSArray arrayWithObjects:[RenderComponent class],[PhysicsComponent class], nil];
}


// RenderableModel

- (CGSize) getSize{
    return CGSizeMake(62.0, 62.0); //stub
}

- (CCTexture2D*) getTexture {
    CCTexture2D *_texture = [[CCTextureCache sharedTextureCache] addImage: @"ball1.png" ];
    return _texture;
}

- (CGPoint) getPosition
{
    return self.position;
}

// PhysicsModel


- (cpBody *) getBody{
    if( _cpBody == nil ) [self _createBody];
    return _cpBody;
}

- (cpShape *) getShape{
    if( _cpShape == nil ) [self _createBody];
    return _cpShape;
}

- (void) setBody:(cpBody *)body {
    _cpBody = body;
}


- (void) _createBody {
    _cpBody = cpBodyNew(10.0f, cpMomentForCircle(10.0f, 0, self.radius, cpvzero));
    _cpShape = cpCircleShapeNew(_cpBody, self.radius, cpvzero);
    cpShapeSetElasticity( _cpShape, 0.9f );
	cpShapeSetFriction( _cpShape, 0.5f );
}

// load

- (void) loadFromJSON:(NSDictionary *)jsonDict {
    self.position = [ModelFactory CGPointFromJSON:jsonDict[@"position"]];
    self.radius = [( (NSNumber*) jsonDict[@"radius"] ) floatValue];
}

- (void)touchStarted {
    CGPoint rightPoint = CGPointMake(0, 0);
    circle = [[CirclePrimitive alloc] initWithRadius:16 colorCode:2 center:rightPoint direction:rightPoint];
    [[self getNode] addChild: circle z:1 tag:100];
}

-(void)touchMoved:(CGPoint) touch {
    CCNode *node = [self getNode];
    CGPoint center = node.position;
    float angle = node.rotation;
    NSLog(@"Touch moved angle = %f %f %f", angle, center.x, center.y);
    
    //double distance = sqrt(pow(puck_center.x-touch_point.x, 2)+ pow(puck_center.y-touch_point.y, 2));
    double distance = ccpDistance(center, touch);
    CGPoint direction = ccp(touch.x - center.x, touch.y - center.y);
    
    if (distance > 50){
        float delta = (distance - 50);
        distance = 50.0;
        float x = (0 + distance*(direction.x))/(delta+distance);
        float y = (0 + distance*(direction.y))/(delta+distance);
        direction = ccp(x, y);       
        
    }
    if (distance > 16) {
        
        //NSLog(@"X =%f, Y=%f", direction.x, direction.y);
        circle.direction = direction;
        circle.radius = distance;
    }
    
    
}

 
@end
