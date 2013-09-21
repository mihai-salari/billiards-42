//
//  Model.m
//  billiards-42
//
//  Created by Admin on 9/21/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "Model.h"

@implementation Model {
    uint32_t _mid;
}

- (id)initWithMid:(uint32_t)mid {
    if((self = [super init])) {
        _mid = mid;
    }
    return self;
}

- (uint32_t) mid {
    return _mid;
}

@end
