//
//  BotonesAppDelegate.m
//  Botones
//
//  Created by wookay on 06/07/09.
//  Copyright masshacking 2009. All rights reserved.
//

#import "BotonesAppDelegate.h"
#import "BotonesViewController.h"

@implementation BotonesAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
