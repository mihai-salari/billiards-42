//
//  BallControlComponent.m
//  billiards-42
//
//  Created by Abliamit Abliamitov on 14.11.13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "BallControlComponent.h"
#import "BallControlView.h"

@implementation BallControlComponent



- (void) startup{

}

- (void)touchStarted {
    NSLog(@"BallControlComponent touchStarted");
    _view = [[BallControlView alloc] initWithRadius: self.model.getNode.boundingBox.size.width/2 colorCode:2 center: [self.model.getNode position] direction: [self.model.getNode position]];
    [self.controlLayer addChild: _view z:1 tag:100];
}

-(void)touchMoved:(CGPoint) touch {
   //NSLog(@"BallControlComponent touchMoved");
    
    CGPoint center = _view.center;
    double distance = ccpDistance(center, touch);
    CGPoint direction = ccp(touch.x, touch.y);
    
    if (distance > 75){
        distance = 75.0;
        float x = center.x + distance*(touch.x - center.x)/sqrt(pow(touch.x - center.x, 2) + pow(touch.y - center.y, 2));
        float y = center.y + distance*(touch.y - center.y)/sqrt(pow(touch.x - center.x, 2) + pow(touch.y - center.y, 2));
        direction = ccp(x, y);
        
    }
    if (distance > self.model.getNode.boundingBox.size.width/2) {
        _view.direction = direction;
        _view.radius = distance;
    }
    
    
}

- (void)touchCompleted:(CGPoint) touch {
    //NSLog(@"BallControlComponent touchCompleted");
    cpVect impulse = cpv((self.model.getNode.position.x - touch.x)*100, (self.model.getNode.position.y - touch.y)*100);
    cpBodyApplyImpulse(self.physicalModel.getBody, impulse, cpv(0.0, 0.0));
    // create view
    [self.controlLayer removeChild:_view];
    [self.controlLayer cleanup];
    _view = NULL;
}

- (void) update:(ccTime)delta {
    if (_view) {
        _view.center = [self.model.getNode position];
    }
}

+ (BallControlComponent*) fromModel:(Model *)model {
    return (BallControlComponent*) [model getComponentOfClass:[BallControlComponent class] ];
}

@end
