//
//  MovimientoAppDelegate.m
//  Movimiento
//
//  Created by luis on 01/10/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import "MovimientoAppDelegate.h"

@implementation MovimientoAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window addSubview:view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
