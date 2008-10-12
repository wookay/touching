//
//  CapaAppDelegate.m
//  Capa
//
//  Created by luis on 12/10/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import "CapaAppDelegate.h"

@implementation CapaAppDelegate

@synthesize window;
@synthesize capaView;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [capaView loadView];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [capaView release];
    [window release];
    [super dealloc];
}


@end
