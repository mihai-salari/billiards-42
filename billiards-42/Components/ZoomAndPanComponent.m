//
//  ZoomAndPanComponent.m
//  billiards-42
//
//  Created by Admin on 11/9/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "ZoomAndPanComponent.h"
#import "CCNode+SFGestureRecognizers.h"

@implementation ZoomAndPanComponent

- (Model<RenderableModel> *) renderableModel {
    return (Model<RenderableModel>*) self.model;
}

- (void) startup{
    // save min zoom (initial)
    self.minZoom = 0.5f; //self.renderLayer.scale;
    self.maxZoom = 2.0f; // hardcoded max zoom to x2
    //! pinch gesture recognizer
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
    self.renderableModel.node.isTouchEnabled = YES;
    [self.renderableModel.node addGestureRecognizer:pinchGestureRecognizer];
    pinchGestureRecognizer.delegate = self;
    [pinchGestureRecognizer release];
    
    //! pan gesture recognizer
    UIGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    panGestureRecognizer.delegate = self;
    [self.renderableModel.node addGestureRecognizer:panGestureRecognizer];
    [panGestureRecognizer release];
}

- (void) update:(ccTime)delta {

}

- (void) beforeRemove {

}


#pragma mark - GestureRecognizer delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return YES;
}

- (void)handlePinchGesture:(UIPinchGestureRecognizer*)aPinchGestureRecognizer
{
    if (aPinchGestureRecognizer.state == UIGestureRecognizerStateBegan || aPinchGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        float scale = [aPinchGestureRecognizer scale];
        float newScale = self.renderLayer.scale * scale;
        // check boundaries
        if( newScale > self.maxZoom ) newScale = self.maxZoom;
        if( newScale < self.minZoom ) newScale = self.minZoom;
        
        self.renderLayer.scale = newScale;
        //NSLog(@"Scale %f",self.renderLayer.scale);
        aPinchGestureRecognizer.scale = 1;
        [self positionLayerSafe:CGPointZero]; // to fix bounds
    }
}

- (void)handlePanGesture:(UIPanGestureRecognizer*)aPanGestureRecognizer
{
    CGPoint translation = [aPanGestureRecognizer translationInView:aPanGestureRecognizer.view];
    translation.y *= -1;
    [aPanGestureRecognizer setTranslation:CGPointZero inView:aPanGestureRecognizer.view];
    [self positionLayerSafe:translation];
}

// changes renderlayer position with check for window bounds
// crazy math -- I feel like we need to read more about it
- (void) positionLayerSafe:(CGPoint) translation {
    CGSize size = [CCDirector sharedDirector].winSize;
    float maxX = 0;
    float minY = -( self.renderLayer.boundingBox.size.height - size.height/2.0f ) * 2.0f /* what's this ?retina ratio */ ;
    float minR = size.width;
    float minB = size.height;
    //
    self.renderLayer.position = ccpAdd(self.renderLayer.position, translation);
    
    if( self.renderLayer.boundingBox.origin.x > maxX ) self.renderLayer.position = ccpAdd( self.renderLayer.position, CGPointMake(-self.renderLayer.boundingBox.origin.x, 0));
    
    if( self.renderLayer.boundingBox.origin.y < minY ) self.renderLayer.position = ccpAdd( self.renderLayer.position, CGPointMake(0.0f, self.renderLayer.boundingBox.origin.y*(-1.0f) + minY ));
    
    float right = self.renderLayer.boundingBox.size.width*2.0f + self.renderLayer.boundingBox.origin.x;
    float bottom = self.renderLayer.boundingBox.size.height - self.renderLayer.boundingBox.origin.y;
    minB = self.renderLayer.boundingBox.size.height;
    
    if( right < minR ) self.renderLayer.position = ccpAdd( self.renderLayer.position, CGPointMake((minR - right ), 0));
    if( bottom < minB ) self.renderLayer.position = ccpAdd( self.renderLayer.position, CGPointMake(0, - ( minB - bottom )));
}

@end
