//
//  DrawView.m
//  Captura
//
//  Created by luis on 15/10/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

@synthesize lines;
@synthesize currentLine;

- (void) loadView {
  self.lines = [NSMutableArray array];
  self.currentLine = [NSMutableArray array];
}

- (void) clear {
  self.lines = [NSMutableArray array];
  self.currentLine = [NSMutableArray array];
  [self setNeedsDisplay];
}

- (void) undo {
  if ([lines count] < 1) {
    return;
  }
  [lines removeLastObject];
  [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
  if ([currentLine count] == 0 && [lines count] == 0) {
    return;
  }
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(context, 3);
  CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
  CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);

  for(id line in [lines arrayByAddingObject:currentLine]) {
    if ([line count] > 0) {
      CGPoint startPoint = CGPointFromString([line objectAtIndex:0]);
      CGContextMoveToPoint(context, startPoint.x, startPoint.y);
      NSString* range = [NSString stringWithFormat:@"{1, %d", [line count] - 1];
      for (id pointString in [line subarrayWithRange:NSRangeFromString(range)]) {
        CGPoint point = CGPointFromString(pointString);
        CGContextAddLineToPoint(context, point.x, point.y);
      }
      CGContextStrokePath(context);
    }
  }
}

- (void)dealloc {
    [lines release];
    [currentLine release];
    [super dealloc];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  UITouch *touch = [touches anyObject];
  [currentLine addObject:NSStringFromCGPoint([touch locationInView:self])];
}
  
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
  UITouch *touch = [touches anyObject];
  [currentLine addObject:NSStringFromCGPoint([touch locationInView:self])];
  [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  [lines addObject:[NSArray arrayWithArray:currentLine]];
  [currentLine removeAllObjects];  
}

@end