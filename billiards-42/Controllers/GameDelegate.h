//
//  GameDelegate.h
//  billiards-42
//
//  Created by Admin on 11/16/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol GameDelegate <NSObject>

- (void) handleCollisionOf:(Model<PhysicsModel>*) modelA and:(Model<PhysicsModel>*) modelB;

@end
