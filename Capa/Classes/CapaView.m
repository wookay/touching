//
//  CapaView.m
//  Capa
//
//  Created by luis on 12/10/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import "CapaView.h"

@implementation CapaView

@synthesize inspectView;
@synthesize button;
@synthesize slider;
@synthesize pageControl;
@synthesize swit;

- (void) loadView {
  targetView = nil;
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
  
  UIFont* font = [UIFont systemFontOfSize:18];
  CGContextSelectFont(context, [[font fontName] UTF8String], [font pointSize], kCGEncodingMacRoman);
  CGContextSetTextMatrix(context, CGAffineTransformMake(1, 0, 0, -1, 0, 0));
  
  if (targetView) {
    CGContextSetLineWidth(context, 3);
    CGContextSetStrokeColorWithColor(context, [[UIColor orangeColor] CGColor]);
    CGRect frame;
    if (targetView.frame.size.height == 460) {
      frame = CGRectMake(0, 0, 320, 460);
    } else {
      frame = targetView.frame;
    }
    CGContextAddRect(context, frame);  
    CGContextStrokePath(context);
    
    CGPoint topLeft = frame.origin;
    NSString* topLeftInfo = NSStringFromCGPoint(topLeft);
    CGPoint bottomRight = CGPointMake(topLeft.x + frame.size.width, topLeft.y + frame.size.height);
    NSString* bottomRightInfo = NSStringFromCGPoint(bottomRight);
     if (frame.size.height == 460) {
       CGContextShowTextAtPoint(context, topLeft.x + 3, topLeft.y + 20, [topLeftInfo UTF8String], [topLeftInfo length]);       
       CGContextShowTextAtPoint(context, bottomRight.x - 85, bottomRight.y - 10, [bottomRightInfo UTF8String], [bottomRightInfo length]);
     } else {
       CGContextShowTextAtPoint(context, topLeft.x, topLeft.y - 5, [topLeftInfo UTF8String], [topLeftInfo length]);       
       CGContextShowTextAtPoint(context, bottomRight.x - 30, bottomRight.y + 15, [bottomRightInfo UTF8String], [bottomRightInfo length]);
     }
  }
}  

- (void)dealloc {
  [inspectView release];
  [button release];
  [slider release];
  [pageControl release];
  [swit release];
  [super dealloc];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  UITouch *touch = [touches anyObject];
  [self updateInspectView:[touch view]];
}


#define radians(degrees) degrees * M_PI / 180

- (IBAction) touchedButton:(id)sender {
  [self updateInspectView:sender];
}

- (IBAction) touchedSwitch:(id)sender {
  CALayer* layer = [button layer];  
  if ([swit isOn]) {
    [layer setValue:[NSNumber numberWithFloat:1.2] forKeyPath:@"transform.scale.x"];
    [layer setValue:[NSNumber numberWithFloat:1.2] forKeyPath:@"transform.scale.y"];
  } else {
    [layer setValue:[NSNumber numberWithFloat:1.0] forKeyPath:@"transform.scale.x"];
    [layer setValue:[NSNumber numberWithFloat:1.0] forKeyPath:@"transform.scale.y"];
  }
  [self updateInspectView:sender];
}

- (IBAction) touchedSlider:(id)sender {
  button.transform = CGAffineTransformRotate([button transform], radians([slider value]));  
  [self updateInspectView:sender];
}

- (IBAction) touchedPageControl:(id)sender {
  CALayer* layer = [button layer];
  if (pageControl.currentPage==0) {
    [layer setValue:[NSNumber numberWithFloat:0.0] forKeyPath:@"anchorPoint.x"];
    [layer setValue:[NSNumber numberWithFloat:0.0] forKeyPath:@"anchorPoint.y"];
  } else if (pageControl.currentPage==1) {
    [layer setValue:[NSNumber numberWithFloat:0.5] forKeyPath:@"anchorPoint.x"];
    [layer setValue:[NSNumber numberWithFloat:0.5] forKeyPath:@"anchorPoint.y"];
  } else if (pageControl.currentPage==2) {
    [layer setValue:[NSNumber numberWithFloat:1.0] forKeyPath:@"anchorPoint.x"];
    [layer setValue:[NSNumber numberWithFloat:1.0] forKeyPath:@"anchorPoint.y"];
  }
  [self updateInspectView:sender];
}

- (void) updateInspectView:(UIView*)target {
  CALayer* layer = [target layer];
  NSString* frameInfo = [NSString stringWithFormat:@"frame: %@", NSStringFromCGRect([layer frame])];
  NSString* boundsInfo = [NSString stringWithFormat:@"bounds: %@", NSStringFromCGRect([layer bounds])];
  NSNumber* positionX = [layer valueForKeyPath:@"position.x"];
  NSNumber* positionY = [layer valueForKeyPath:@"position.y"];
  NSString* positionInfo = [NSString stringWithFormat:@"position: {%@, %@}", positionX, positionY];
  NSNumber* anchorPointX = [layer valueForKeyPath:@"anchorPoint.x"];
  NSNumber* anchorPointY = [layer valueForKeyPath:@"anchorPoint.y"];
  NSString* anchorPointInfo = [NSString stringWithFormat:@"anchorPoint: {%@, %@}", anchorPointX, anchorPointY];
  NSString* zPositionInfo = [NSString stringWithFormat:@"zPosition: %@", [layer valueForKeyPath:@"zPosition"]];
  NSNumber* transformRotationX = [layer valueForKeyPath:@"transform.rotation.x"];
  NSNumber* transformRotationY = [layer valueForKeyPath:@"transform.rotation.y"];
  NSNumber* transformRotationZ = [layer valueForKeyPath:@"transform.rotation.z"];
  NSNumber* transformScaleX = [layer valueForKeyPath:@"transform.scale.x"];
  NSNumber* transformScaleY = [layer valueForKeyPath:@"transform.scale.y"];
  NSNumber* transformScaleZ = [layer valueForKeyPath:@"transform.scale.z"];
  NSNumber* transformTranslationX = [layer valueForKeyPath:@"transform.translation.x"];
  NSNumber* transformTranslationY = [layer valueForKeyPath:@"transform.translation.y"];
  NSNumber* transformTranslationZ = [layer valueForKeyPath:@"transform.translation.z"]; 
  NSString* transformRotationInfo = [NSString stringWithFormat:@"transform.rotation: %@ %@ %@",
                                     transformRotationX, transformRotationY, transformRotationZ];
  NSString* transformScaleInfo = [NSString stringWithFormat:@"transform.scale: %@ %@ %@",
                                  transformScaleX, transformScaleY, transformScaleZ];
  NSString* transformTranslationInfo = [NSString stringWithFormat:@"transform.translation: %@ %@ %@",
                                        transformTranslationX, transformTranslationY, transformTranslationZ];
  
  NSArray* infos = [NSArray arrayWithObjects:frameInfo,
                    boundsInfo,
                    positionInfo,
                    anchorPointInfo,
                    zPositionInfo,
                    transformRotationInfo,
                    transformScaleInfo,
                    transformTranslationInfo, nil];
  inspectView.text = [infos componentsJoinedByString:@"\n"];
  targetView = target;
  [self setNeedsDisplay];
}

@end
