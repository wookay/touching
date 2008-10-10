//
//  CirculoView.m
//  Circulo
//
//  Created by luis on 05/10/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import "CirculoView.h"
#import "GridView.h"

@implementation CirculoView

- (void) loadView {
  [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
  self.center = CGPointMake(170, -120);
}

- (void)drawRect:(CGRect)rect {
}

- (void)dealloc {
    [super dealloc];
}

@end