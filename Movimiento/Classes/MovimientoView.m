//
//  MovimientoView.m
//  Movimiento
//
//  Created by luis on 01/10/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import "MovimientoView.h"
//#import <UIKit/UIAnimator.h>
//#import <UIKit/UITransformAnimation.h>

@implementation MovimientoView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (void)dealloc {
    [super dealloc];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  [UIView beginAnimations:@"BIRD" context:NULL];
  [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
  [UIView setAnimationDuration:1];
  [UIView setAnimationDelegate:self];
  [UIView setAnimationWillStartSelector:@selector(flyAnimationWillStart:context:)];
  [UIView setAnimationDidStopSelector:@selector(flyAnimationDidStop:finished:context:)];
  UITouch *touch = [touches anyObject];
  birdView.center = [touch locationInView:self];
  [UIView commitAnimations];
}

- (void)flyAnimationWillStart:(NSString *)animationID context:(void *)context {
  centerXLabel.text = [NSString stringWithFormat:@"%g", birdView.center.x];
  centerYLabel.text = [NSString stringWithFormat:@"%g", birdView.center.y];
}

- (void)flyAnimationDidStop:(NSString *)animationID finished:(bool)finished context:(void *)context {
}

#define radians(degrees) degrees * M_PI / 180

- (IBAction) touchedRotateButton:(id)sender {
  CALayer* layer = [birdView layer];
  [layer setValue:[NSNumber numberWithFloat:0.5] forKeyPath:@"anchorPoint.x"];
  [layer setValue:[NSNumber numberWithFloat:0.5] forKeyPath:@"anchorPoint.y"];
  birdView.transform = CGAffineTransformRotate([birdView transform], radians(45));
}

@end