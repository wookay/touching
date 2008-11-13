//
//  Picture.m
//  Persistencia
//
//  Created by luis on 13/11/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import "Picture.h"


@implementation Picture

@synthesize date;
@synthesize image;

- (void)dealloc {
    [date release];
    [image release];
    [super dealloc];
}

@end
