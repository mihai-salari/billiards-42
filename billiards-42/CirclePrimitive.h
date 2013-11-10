//
//  CirclePrimitive.h
//  billiards-42
//
//  Created by Abliamit Abliamitov on 10.11.13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "cocos2d.h"

@interface CirclePrimitive : CCNode {
    int radius;
    int colorCode;
    CGPoint center;
    CGPoint direction;
}

@property (nonatomic, assign) int colorCode;
@property (nonatomic, assign) int radius;
@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGPoint direction;

-(id)initWithRadius: (int)radius colorCode:(int)color center:(CGPoint)center direction:(CGPoint)direction;
-(void)draw;

@end
