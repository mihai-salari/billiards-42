//
//  BallView.m
//  billiards-42
//
//  Created by Admin on 10/20/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "BallView.h"
#import "PhysicsModel.h"

@implementation BallView {
    int timeUniformLocation;
    int directionUniformLocation;
    float totalTime;
}

- (void) startup {
    // creates sprite on layer
    NSLog(@"BallView startup method call!");
    self.sprite = [CCPhysicsSprite spriteWithTexture: [self.model getTexture]];
    cpBody* body = [((Model<PhysicsModel>*)self.model) getBody];
    [self.sprite setCPBody:body];
    self.sprite.position = [self.model getPosition];
    
    [self setupShader:self.sprite];
    
    self.node = self.sprite; // sprite is out main node   
    [self.renderLayer addChild:self.sprite];
}

- (void) update:(ccTime)delta {
    totalTime += delta;
    [self.node.shaderProgram use];
    glUniform1f(timeUniformLocation, totalTime);
    cpVect vel = cpBodyGetVel(self.sprite.CPBody);
    glUniform2f(directionUniformLocation, vel.x, vel.y);
}


- (void) setupShader:(CCSprite*) sprite {
    
    const GLchar * fragmentSource = (GLchar*) [[NSString stringWithContentsOfFile:[CCFileUtils fullPathFromRelativePath:@"ball.fsh"] encoding:NSUTF8StringEncoding error:nil] UTF8String];
    sprite.shaderProgram = [[CCGLProgram alloc] initWithVertexShaderByteArray:ccPositionTextureA8Color_vert
                                                      fragmentShaderByteArray:fragmentSource];
    [sprite.shaderProgram addAttribute:kCCAttributeNamePosition index:kCCVertexAttrib_Position];
    [sprite.shaderProgram addAttribute:kCCAttributeNameTexCoord index:kCCVertexAttrib_TexCoords];
    [sprite.shaderProgram link];
    [sprite.shaderProgram updateUniforms];
    timeUniformLocation = glGetUniformLocation(sprite.shaderProgram->_program, "u_time");
    directionUniformLocation = glGetUniformLocation(sprite.shaderProgram->_program, "u_direction");
}

@end
