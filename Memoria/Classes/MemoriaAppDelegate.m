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
  [[LeakView alloc] init];
  [[LeakView alloc] init];
  [[LeakView alloc] init];
  [[LeakView alloc] init];
  [[LeakView alloc] init];
  [[LeakView alloc] init];
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
