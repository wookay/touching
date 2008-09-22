//
//  AcontecimientoAppDelegate.m
//  Acontecimiento
//
//  Created by luis on 22/09/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import "AcontecimientoAppDelegate.h"

@implementation AcontecimientoAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window addSubview:acontecimientoView];    
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
