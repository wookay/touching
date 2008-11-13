//
//  PersistenciaAppDelegate.m
//  Persistencia
//
//  Created by luis on 13/11/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import "PersistenciaAppDelegate.h"

@implementation PersistenciaAppDelegate

@synthesize window;
@synthesize persistenciaView;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window addSubview:persistenciaView];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [persistenciaView release];
    [window release];
    [super dealloc];
}


@end
