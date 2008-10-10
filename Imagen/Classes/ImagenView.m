//
//  ImagenView.m
//  Imagen
//
//  Created by luis on 04/10/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import "ImagenView.h"


@implementation ImagenView


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

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
  convex.center = CGPointMake(160, 120);
  convex.contentMode = row;
}

- (UIView *) pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
  UILabel* label = [[UILabel alloc] initWithFrame:CGRectInset([pickerView frame], 20, 0)];
  label.font = [UIFont boldSystemFontOfSize: 14];
  label.backgroundColor = [UIColor clearColor];
  NSArray* titles = [NSArray arrayWithObjects:
                      @"UIViewContentModeScaleToFill",
                      @"UIViewContentModeScaleAspectFit",
                      @"UIViewContentModeScaleAspectFill",
                      @"UIViewContentModeRedraw",
                      @"UIViewContentModeCenter",
                      @"UIViewContentModeTop",
                      @"UIViewContentModeBottom",
                      @"UIViewContentModeLeft",
                      @"UIViewContentModeRight",
                      @"UIViewContentModeTopLeft",
                      @"UIViewContentModeTopRight",
                      @"UIViewContentModeBottomLeft",
                      @"UIViewContentModeBottomRight", nil];
  label.text = [titles objectAtIndex:row];
  return label;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  return UIViewContentModeBottomRight;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
  UITouch *touch = [touches anyObject];
  int x_dist = [touch locationInView:self].x - [touch previousLocationInView:self].x;
  int y_dist = [touch locationInView:self].y - [touch previousLocationInView:self].y;
  convex.center = CGPointMake(convex.center.x + x_dist, convex.center.y + y_dist);
}

@end