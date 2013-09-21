//
//  GameController.h
//  billiards-42
//
//  Created by Admin on 9/21/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelsManager.h"

@interface GameController : NSObject

@property (retain) ModelsManager *modelsManager; // Controller creates it in init

- (id) init;

@end
