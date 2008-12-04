//
//  LeakView.m
//  Memoria
//
//  Created by luis on 04/12/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import "LeakView.h"


@implementation LeakView


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


@end
