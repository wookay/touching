//
//  CirculoAppDelegate.m
//  Circulo
//
//  Created by luis on 05/10/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import "CirculoAppDelegate.h"

@implementation CirculoAppDelegate

@synthesize window;
@synthesize gridView;
@synthesize circuloView;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    [gridView loadView];
    [circuloView loadView];
    [gridView addSubview:circuloView];
    [window addSubview:gridView];
    [window makeKeyAndVisible];
}

- (void)dealloc {
    [circuloView release];
    [gridView release];
    [window release];
    [super dealloc];
}

@end