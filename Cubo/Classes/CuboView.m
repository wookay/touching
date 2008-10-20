//
//  CuboView.m
//  Cubo
//
//  Created by luis on 20/10/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import "CuboView.h"

#define radians(degrees) degrees * M_PI / 180
#define CUBESIZE 230

@implementation CuboView

@synthesize trackBall;
@synthesize xSlider;
@synthesize ySlider;
@synthesize zSlider;

- (id) captureView:(UIView*)view {
  UIGraphicsBeginImageContext(view.frame.size);
	[view.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
  return (id) [newImage CGImage];
}

- (CALayer*) makeSurface:(CATransform3D)t text:(NSString*)text bgcolor:(UIColor*)bgcolor {
  CGRect rect = CGRectMake(0, 0, CUBESIZE, CUBESIZE);
  UILabel* label = [[UILabel alloc] initWithFrame:rect];
  label.text = text;
  label.textAlignment = UITextAlignmentCenter;
  label.font = [UIFont systemFontOfSize:CUBESIZE];
  label.textColor = [UIColor yellowColor];
  label.backgroundColor = bgcolor;
  
  CALayer *imageLayer = [CALayer layer];
  imageLayer.anchorPoint = CGPointMake(1, 1);
  imageLayer.frame = rect;
  imageLayer.transform = t;  
  imageLayer.contents = [self captureView:label];
  return imageLayer;
}

- (void)awakeFromNib {
  transformed = [CALayer layer];
  transformed.frame = self.bounds;
  [self.layer addSublayer:transformed];

  CATransform3D t = CATransform3DMakeTranslation(0, 0, 0);
  [transformed addSublayer:[self makeSurface:t text:@"1" bgcolor:[UIColor redColor]]];
  
  t = CATransform3DRotate(t, radians(90), 0, 1, 0);
  t = CATransform3DTranslate(t, CUBESIZE, 0, 0);
  [transformed addSublayer:[self makeSurface:t text:@"2" bgcolor:[UIColor orangeColor]]];

  t = CATransform3DRotate(t, radians(90), 0, 1, 0);
  t = CATransform3DTranslate(t, CUBESIZE, 0, 0);
  [transformed addSublayer:[self makeSurface:t text:@"3" bgcolor:[UIColor greenColor]]];
  
  t = CATransform3DRotate(t, radians(90), 0, 1, 0);
  t = CATransform3DTranslate(t, CUBESIZE, 0, 0);
  [transformed addSublayer:[self makeSurface:t text:@"4" bgcolor:[UIColor blueColor]]];
  
  t = CATransform3DRotate(t, radians(-90), 1, 0, 0);
  t = CATransform3DTranslate(t, 0, CUBESIZE, 0);
  [transformed addSublayer:[self makeSurface:t text:@"5" bgcolor:[UIColor clearColor]]];
  
  t = CATransform3DRotate(t, radians(180), 0, 1, 0);
  t = CATransform3DTranslate(t, CUBESIZE, 0, CUBESIZE);
  [transformed addSublayer:[self makeSurface:t text:@"6" bgcolor:[UIColor purpleColor]]];
  
  [self changedSlider:self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  CGPoint location = [[touches anyObject] locationInView:self];
  if(nil == self.trackBall) {
    self.trackBall = [TrackBall trackBallWithLocation:location inRect:self.bounds];
  } else {
    [self.trackBall setStartPointFromLocation:location];
  }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
  CGPoint location = [[touches anyObject] locationInView:self];
  CATransform3D transform = [trackBall rotationTransformForLocation:location];
  transformed.sublayerTransform = transform;
  [self updateSliders];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  CGPoint location = [[touches anyObject] locationInView:self];
  [self.trackBall finalizeTrackBallForLocation:location];
}

- (void)dealloc {
  self.trackBall = nil;
  [xSlider release];
  [ySlider release];
  [zSlider release];
  [super dealloc];
}

- (IBAction) changedSlider:(id)sender {
  [transformed setValue:[NSNumber numberWithFloat:[xSlider value]] forKeyPath:@"sublayerTransform.rotation.x"];
  [transformed setValue:[NSNumber numberWithFloat:[ySlider value]] forKeyPath:@"sublayerTransform.rotation.y"];
  [transformed setValue:[NSNumber numberWithFloat:[zSlider value]] forKeyPath:@"sublayerTransform.rotation.z"];   
}

- (void) updateSliders {
  NSNumber* transformRotationX = [transformed valueForKeyPath:@"sublayerTransform.rotation.x"];
  NSNumber* transformRotationY = [transformed valueForKeyPath:@"sublayerTransform.rotation.y"];
  NSNumber* transformRotationZ = [transformed valueForKeyPath:@"sublayerTransform.rotation.z"];
  xSlider.value = [transformRotationX floatValue];
  ySlider.value = [transformRotationY floatValue];
  zSlider.value = [transformRotationZ floatValue];
}

@end
