//
//  KXMyScene.m
//  BallChallenge
//
//  Created by Kenneth Wilcox on 10/13/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

#import "KXMyScene.h"

@implementation KXMyScene

- (id)initWithSize:(CGSize)size {
  if (self = [super initWithSize:size]) {
    /* Setup your scene here */
    self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    
    // Add Edge/Border
    SKNode *edge = [SKNode node];
    edge.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    [self addChild:edge];
    
  }
  return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  /* Called when a touch begins */
  
  for (UITouch *touch in touches) {
    CGPoint location = [touch locationInNode:self];
    
    int random = arc4random_uniform(3);
    SKSpriteNode *ball;
    switch (random) {
      case 0:
        ball = [SKSpriteNode spriteNodeWithImageNamed:@"8Ball"];
        ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.size.width * 0.5];
        ball.physicsBody.mass = 0.82;
        ball.physicsBody.restitution = 0.2;
        break;
      case 1:
        ball = [SKSpriteNode spriteNodeWithImageNamed:@"BeachBall"];
        ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.size.width * 0.5];
        ball.physicsBody.mass = 0.09;
        ball.physicsBody.restitution = 0.9;
        ball.physicsBody.friction = 0.3;
        break;
      default:
        ball = [SKSpriteNode spriteNodeWithImageNamed:@"SoccerBall"];
        ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.size.width * 0.5];
        ball.physicsBody.mass = 0.4;
        ball.physicsBody.restitution = 0.5;
        ball.physicsBody.angularVelocity = 20.0;
        break;
    }
    ball.physicsBody.linearDamping = 1.0;
    ball.position = location;
    [self addChild:ball];
  }
}

-(void)update:(CFTimeInterval)currentTime {
  /* Called before each frame is rendered */
}

@end
