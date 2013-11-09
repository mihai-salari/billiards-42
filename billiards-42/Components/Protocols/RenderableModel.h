//
//  RenderableModel.h
//  billiards-42
//
//  Created by Admin on 9/28/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@protocol RenderableModel <NSObject>

@property (nonatomic,retain) CCNode* node; // property to save node - for RenderComponent

- (CCTexture2D *) getTexture;
- (CGSize) getSize;
- (CGPoint) getPosition;

@end
