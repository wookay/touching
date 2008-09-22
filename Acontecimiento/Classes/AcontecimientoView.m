//
//  AcontecimientoView.m
//  Acontecimiento
//
//  Created by luis on 22/09/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import "AcontecimientoView.h"


@implementation AcontecimientoView

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

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  [self debug:@"touchesBegan" touches:touches withEvent:event];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
  [self debug:@"touchesMoved" touches:touches withEvent:event];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  [self debug:@"touchesEnded" touches:touches withEvent:event];
}

- (void) touchesCanceled:(NSSet *)touches withEvent:(UIEvent *)event {
  [self debug:@"touchesCanceled" touches:touches withEvent:event];
}

- (void) debug:(id)action touches:(NSSet *)touches withEvent:(UIEvent *)event {
  
  UITouch *touch = [touches anyObject];
  CGPoint touchPoint = [touch locationInView:self];
  touchPointXLabel.text = [NSString stringWithFormat:@"%g", touchPoint.x];
  touchPointYLabel.text = [NSString stringWithFormat:@"%g", touchPoint.y];

  CGPoint prevPoint = [touch previousLocationInView:self];
  prevPointXLabel.text = [NSString stringWithFormat:@"%g", prevPoint.x];
  prevPointYLabel.text = [NSString stringWithFormat:@"%g", prevPoint.y];  
  
  tapCountLabel.text = [NSString stringWithFormat:@"%d", [touch tapCount]];
  timestampLabel.text = [NSString stringWithFormat:@"%g", [touch timestamp]]; 
  NSArray* phases = [NSArray arrayWithObjects:@"UITouchPhaseBegan", @"UITouchPhaseMoved", @"UITouchPhaseStationary",@"UITouchPhaseEnded", @"UITouchPhaseCanceled", nil];
  phaseLabel.text = [NSString stringWithFormat:@"%@", [phases objectAtIndex:[touch phase]]];  
  
  CGPoint textPoint = [textView contentOffset];
  if ([@"touchesMoved" isEqualToString:prevAction] && [@"touchesMoved" isEqualToString:action]) {
    textView.text = [NSString stringWithFormat:@"%@.", textView.text];
  } else {
    textView.text = [NSString stringWithFormat:@"%@\n%@", textView.text, action];
  }  
  [textView setContentOffset:textPoint animated:NO];
  [textView scrollRangeToVisible:NSMakeRange([textView.text length], 0)];
  prevAction = action;
}

@end