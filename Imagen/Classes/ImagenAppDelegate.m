//
//  ImagenAppDelegate.m
//  Imagen
//
//  Created by luis on 04/10/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import "ImagenAppDelegate.h"

@implementation ImagenAppDelegate

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
