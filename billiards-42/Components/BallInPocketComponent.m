//
//  BallInPocketComponent.m
//  billiards-42
//
//  Created by Admin on 11/16/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "BallInPocketComponent.h"
#import "Ball.h"
#import "BallView.h"
#import "RenderComponent.h"
#import "Pocket.h"

@implementation BallInPocketComponent

- (void) update:(ccTime)delta {
    for (id object in [self allModels ]) {
        if ([object isMemberOfClass:[Ball class]]){
            Ball* ball = (Ball*)object;
            RenderComponent* renderer = [RenderComponent fromModel:ball];
            BallView* ballView = (BallView*) [renderer getView];
            View* pocketView = [[RenderComponent fromModel:self.model] getView];
            float distance = ccpDistance(ballView.node.position, pocketView.node.position);
            Pocket* pocket = (Pocket*) self.model;
            if( distance < (pocket.radius / 2)) {
                [self.delegate ball:ball inPocket:pocket];
            }
        }
    }}

- (void) beforeRemove {
    
}

+ (BallInPocketComponent*) fromModel:(Model *)model {
    return (BallInPocketComponent*) [model getComponentOfClass:[BallInPocketComponent class] ];
}

@end
