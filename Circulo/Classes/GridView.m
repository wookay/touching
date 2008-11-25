//
//  GridView.m
//  Circulo
//
//  Created by luis on 10/10/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import "GridView.h"
#import "CirculoView.h"
#import <QuartzCore/QuartzCore.h>
//#import <UIKit/UIAnimator.h>
//#import <UIKit/UITransformAnimation.h>

@implementation GridView

@synthesize angleSlider;
@synthesize xSlider;
@synthesize ySlider;
@synthesize zSlider;

- (void) loadView {
  [self changedSlider:self];
}

- (void)drawRect:(CGRect)rect {
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGMutablePathRef grid = CGPathCreateMutable();
  int idx;
  for (idx = 0; idx < rect.size.width; idx+=10) {
    CGPathMoveToPoint(grid, nil, idx, 0);
    CGPathAddLineToPoint(grid, nil, idx, rect.size.height);
  }
  for (idx = 0; idx < rect.size.height; idx+=10) {
    CGPathMoveToPoint(grid, nil, 0, idx);
    CGPathAddLineToPoint(grid, nil, rect.size.width, idx);
  }
  CGContextBeginPath(context);
  CGContextAddPath(context, grid);
  CGContextSetLineWidth(context, 0.3f);
  CGContextSetStrokeColorWithColor(context, [[UIColor greenColor] CGColor]);
  CGContextStrokePath(context);
  CFRelease(grid);
  

  CGContextSetLineWidth(context, 3);
  CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
  CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
  CGContextAddArc(context, self.center.x, self.center.y, [[self angleSlider] value], radians(0), radians(30), 1);
  CGContextAddEllipseInRect(context, CGRectMake(150, 300, [[self xSlider] value], 30));
  CGContextAddRect(context, CGRectMake(30, 250, 30, [[self ySlider] value]));
  CGContextMoveToPoint(context, self.center.x, self.center.y);
  CGContextAddLineToPoint(context, [[self zSlider] value] + 160, 100);  
  CGContextStrokePath(context);
}

- (void)dealloc {
  [super dealloc];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
  UITouch *touch = [touches anyObject];
  CirculoView* circuloView = (CirculoView*) [self viewWithTag:TAG_CIRCULOVIEW];
  int x_dist = [touch locationInView:self].x - [touch previousLocationInView:self].x;
  int y_dist = [touch locationInView:self].y - [touch previousLocationInView:self].y;
  circuloView.center = CGPointMake(circuloView.center.x + x_dist, circuloView.center.y + y_dist);
}

- (IBAction) changedSlider:(id)sender {
  [self setNeedsDisplay];
  CirculoView* circuloView = (CirculoView*) [self viewWithTag:TAG_CIRCULOVIEW];
  CALayer *circuloLayer = [circuloView layer];  
  [circuloLayer removeAllAnimations];
  CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
  animation.duration = 10;
  animation.repeatCount = 10;
  animation.autoreverses = NO;
  CATransform3D t = circuloLayer.transform;
  t = CATransform3DScale(t, 1, 1, 1);
  CATransform3D e = CATransform3DRotate(t, radians([angleSlider value]), [xSlider value], [ySlider value], [zSlider value]);
  animation.toValue = [NSValue valueWithCATransform3D:e];
  [circuloLayer addAnimation:animation forKey:@"rotateAnimation"];
}

@end
