//
//  MemoriaAppDelegate.m
//  Memoria
//
//  Created by luis on 04/12/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import "MemoriaAppDelegate.h"
#import "LeakView.h"

@implementation MemoriaAppDelegate

@synthesize window;

- (IBAction) touchedLeakButton:(id)sender {
  id leak1 = [[LeakView alloc] init];
  id leak2 = [[LeakView alloc] init];
  id leak3 = [[LeakView alloc] init];
  id leak4 = [[LeakView alloc] init];
  id leak5 = [[LeakView alloc] init];
//  [leak1 release];
//  [leak2 release];
//  [leak3 release];
//  [leak4 release];
//  [leak5 release];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
