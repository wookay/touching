//
//  ColoresAppDelegate.m
//  Colores
//
//  Created by luis on 19/09/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import "ColoresAppDelegate.h"

@implementation ColoresAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}

- (IBAction) changeColores:(id)sender {
  NSString* title = [sender titleForSegmentAtIndex:[sender selectedSegmentIndex]];
  SEL sel = NSSelectorFromString([NSString stringWithFormat:@"%@Color", [title lowercaseString]]);
  UIColor* color = [UIColor performSelector:sel];
  [window setBackgroundColor:color];
}

@end