//
//  CirclePrimitive.m
//  billiards-42
//
//  Created by Abliamit Abliamitov on 10.11.13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "BallControlView.h"

@implementation BallControlView

@synthesize colorCode;
@synthesize radius;
@synthesize center;
@synthesize direction;

-(id)initWithRadius: (int)rad colorCode:(int)color center:(CGPoint)point direction:(CGPoint)dir {
    if( (self=[super init]) ) {
        self.radius = rad;
        self.colorCode = color;
        self.center = point;
        self.direction = dir;
        // set up the geometry of this sprite
        // this is necessary so the sprite indicates it's body size
        // relative the center point (position)
        //        CGSize size;
        //        size.width = 2 * rad;
        //        size.height = 2 * rad;
        //        self.contentSize = size;
        //        self.anchorPoint = point;
        
    }
    return self;
}

-(void)draw {
    
    glLineWidth(1);
    
    
    //    //red
    //    if (colorCode == 0) {
    //        glColor4f(255, 0, 0, 255);
    //    }
    //    // yellow
    //    if (colorCode == 1) {
    //        glColor4f(255, 255, 0, 255);
    //    }
    //    // green
    //    if (colorCode == 2) {
    //        glColor4f(0, 255, 0, 255);
    //    }
    ccDrawColor4B(255, 255, 255, 255);
    // coordinates are relative to this sprites "position"
    // the draw primitives origin are in the lower left corner relative to the anchor point
    // so the center is "radius" pixels over and up on the x,y axis
    CGPoint c = ccp(center.x, center.y );
    CGPoint d = ccp(direction.x, direction.y);
    
    ccDrawCircle(c, radius, 0, 1000, NO);
    ccDrawColor4B(255, 255, 255, 255);
    
    glLineWidth(5);
    ccDrawLine(c, d);
    
    int rx = direction.x - center.x;
    int ry = direction.y - center.y ;
    float cs = cos(CC_DEGREES_TO_RADIANS(360));
    float ss = sin(CC_DEGREES_TO_RADIANS(360));
    
    CGPoint opposit = ccp((center.x - rx * cs - ry * ss),(center.y - rx * ss - ry * cs));
    
//    float x = cos(M_PI) * radius + center.x;
//    float y = sin(M_PI) * radius + center.y;
//    CGPoint opposit = ccp(x,y);
    //NSLog(@"direction x =%f y= %f, opposit x=%f y= %f", d.x, d.y, opposit.x, opposit.y);
    glLineWidth(2);
    ccDrawColor4B(255, 255, 255, 255);
    ccDrawLine(c, opposit);
    
    ccDrawColor4B(255, 0, 0, 255);
    ccDrawCircle(opposit, 2, 0, 1000, NO);
    
}

@end
