//
//  GameController.m
//  billiards-42
//
//  Created by Admin on 9/21/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "GameController.h"

@implementation GameController

- (id) init {
    if((self = [super init])) {
        self.modelsManager = [[ModelsManager alloc] init];
    }
    return self;
}


- (id) initWithJSON:(NSString *)filePath {
    if([self init]) {
        [self.modelsManager loadFromJSON:filePath];
    }
    return self;
}

@end
