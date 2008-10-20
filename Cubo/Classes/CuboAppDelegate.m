//
//  CuboAppDelegate.m
//  Cubo
//
//  Created by luis on 20/10/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import "CuboAppDelegate.h"

@implementation CuboAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
  [UIApplication sharedApplication].statusBarHidden = YES;  
  [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
