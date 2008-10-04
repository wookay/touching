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

@end