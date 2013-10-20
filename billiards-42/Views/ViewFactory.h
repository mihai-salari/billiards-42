//
//  ViewFactory.h
//  billiards-42
//
//  Created by Admin on 10/20/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "View.h"

@interface ViewFactory : NSObject

+ (View*) BuildViewByName: (NSString*) modelName;

@end
