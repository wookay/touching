//
//  CapturaView.m
//  Captura
//
//  Created by luis on 15/10/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import "CapturaView.h"


@implementation CapturaView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
  UIView* drawView = [self viewWithTag:TAG_DRAWVIEW];
  UIView* imageView = [self viewWithTag:TAG_IMAGEVIEW];
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetStrokeColorWithColor(context, [[UIColor orangeColor] CGColor]);
  CGContextAddRect(context, drawView.frame);
  CGContextAddRect(context, imageView.frame);
  CGContextStrokePath(context);
}


- (void)dealloc {
    [super dealloc];
}


@end
