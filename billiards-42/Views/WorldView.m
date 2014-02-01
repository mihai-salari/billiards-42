//
//  WorldView.m
//  billiards-42
//
//  Created by Admin on 10/20/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "WorldView.h"

@implementation WorldView {
    int timeUniformLocation;
    float totalTime;
}

- (void) startup {
    // creates sprite on layer
    NSLog(@"WordView startup method call!");
    CCSprite* sprite = [CCSprite spriteWithTexture: [self.model getTexture]];
    
    sprite.position = [self.model getPosition];
    sprite.anchorPoint = CGPointZero;
    
    self.node = sprite; //save sprite back to model
    
    [self setupShader:sprite]; // add effects
    
    [self.renderLayer addChild:sprite];
}

- (void) update:(ccTime)delta {
    totalTime += delta;
    [self.node.shaderProgram use];
    glUniform1f(timeUniformLocation, totalTime);
}

- (void) setupShader:(CCSprite*) sprite {
    
    const GLchar * fragmentSource = (GLchar*) [[NSString stringWithContentsOfFile:[CCFileUtils fullPathFromRelativePath:@"background.fsh"] encoding:NSUTF8StringEncoding error:nil] UTF8String];
    sprite.shaderProgram = [[CCGLProgram alloc] initWithVertexShaderByteArray:ccPositionTextureA8Color_vert
                                                      fragmentShaderByteArray:fragmentSource];
    [sprite.shaderProgram addAttribute:kCCAttributeNamePosition index:kCCVertexAttrib_Position];
    [sprite.shaderProgram addAttribute:kCCAttributeNameTexCoord index:kCCVertexAttrib_TexCoords];
    [sprite.shaderProgram link];
    [sprite.shaderProgram updateUniforms];
    timeUniformLocation = glGetUniformLocation(sprite.shaderProgram->_program, "u_time");
}

@end
