//
//  AnimacionViewController.m
//  Animacion
//
//  Created by wookay on 06/07/09.
//  Copyright masshacking 2009. All rights reserved.
//

#import "AnimacionViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation AnimacionViewController
@synthesize spriteView;
@synthesize groupButton;


-(IBAction) touchedContentsAnimation:(id)sender {
  CAKeyframeAnimation* contentsAnimation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
  contentsAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
  contentsAnimation.values = [NSArray arrayWithObjects:
                              (id) [[UIImage imageNamed:@"vincent.jpg"] CGImage],
                              (id) [[UIImage imageNamed:@"bandaged.jpg"] CGImage],
                              nil];
  contentsAnimation.duration = 2.0;
  [spriteView.layer addAnimation:contentsAnimation forKey:@"contents"];
} 

-(IBAction) touchedPositionAnimation:(id)sender {
  CAKeyframeAnimation* positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
  positionAnimation.values = [NSArray arrayWithObjects:
                              [NSValue valueWithCGPoint:spriteView.layer.position],
                              [NSValue valueWithCGPoint:CGPointMake(spriteView.layer.position.x, spriteView.layer.position.y/2)],
                              [NSValue valueWithCGPoint:CGPointMake(spriteView.layer.position.x/2, spriteView.layer.position.y)],
                              [NSValue valueWithCGPoint:spriteView.layer.position],
                              nil];
  positionAnimation.duration = 2.0;
  [spriteView.layer addAnimation:positionAnimation forKey:@"position"];
} 

-(IBAction) touchedOpacityAnimation:(id)sender {
  CAKeyframeAnimation* opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
  opacityAnimation.values = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:0.9],
                              [NSNumber numberWithFloat:0.1],
                              nil];
  opacityAnimation.duration = 0.7;
  opacityAnimation.repeatCount = 3;
  [spriteView.layer addAnimation:opacityAnimation forKey:@"opacity"];
} 

#define degree_to_radian(degree) degree * M_PI / 180
-(IBAction) touchedTransformAnimation:(id)sender {
  CAKeyframeAnimation* transformAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
  CATransform3D t = CATransform3DRotate(spriteView.layer.transform, degree_to_radian(-180), 0, 0, 1);
  transformAnimation.values = [NSArray arrayWithObjects:
                               [NSValue valueWithCATransform3D:spriteView.layer.transform],
                               [NSValue valueWithCATransform3D:t],
                               nil];
  transformAnimation.duration = 1;
  [spriteView.layer addAnimation:transformAnimation forKey:@"transform"];
}

-(IBAction) touchedGroupAnimation:(id)sender {
  CAAnimationGroup* groupAnimation = [CAAnimationGroup animation];  
  groupAnimation.duration = 2;  
  NSMutableArray* ary = [NSMutableArray array];
  for(NSString* animationKey in spriteView.layer.animationKeys) {
    CAKeyframeAnimation* spriteAnimation = (CAKeyframeAnimation*)[spriteView.layer animationForKey:animationKey];
    CAKeyframeAnimation* keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:animationKey];
    keyframeAnimation.values = [NSArray arrayWithArray:spriteAnimation.values];
    if ([@"position" isEqualToString:animationKey]) {
      keyframeAnimation.values = [NSArray arrayWithObjects:
                                  [NSValue valueWithCGPoint:groupButton.layer.position],
                                  [NSValue valueWithCGPoint:CGPointMake(groupButton.layer.position.x, groupButton.layer.position.y/2)],
                                  [NSValue valueWithCGPoint:CGPointMake(groupButton.layer.position.x/2, groupButton.layer.position.y)],
                                  [NSValue valueWithCGPoint:groupButton.layer.position],
                                  nil];      
    }
    [ary addObject:keyframeAnimation];
  }
  groupAnimation.animations = ary;
  [groupButton.layer addAnimation:groupAnimation forKey:@"group"];
}

-(void) viewDidLoad {
  [super viewDidLoad];
  [self.view addSubview:spriteView];
}

- (void)dealloc {
  [spriteView release];
    [groupButton release];
  [super dealloc];
}

@end
