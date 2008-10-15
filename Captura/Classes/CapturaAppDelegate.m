//
//  CapturaAppDelegate.m
//  Captura
//
//  Created by luis on 15/10/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import "CapturaAppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@implementation CapturaAppDelegate

@synthesize window;
@synthesize drawView;
@synthesize imageView;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [drawView loadView];
    [window makeKeyAndVisible];
}

- (void)dealloc {
    [window release];
    [imageView release];
    [drawView release];
    [super dealloc];
}

- (IBAction) touchedClear:(id)sender {
  [drawView clear];
}

- (IBAction) touchedUndo:(id)sender {
  [drawView undo];
}

- (IBAction) touchedCapture:(id)sender {
  self.imageView.image = [self captureView:drawView];
}

- (UIImage*) captureView:(UIView *)view {
  UIGraphicsBeginImageContext(view.frame.size);
	[view.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
  return newImage;
}

@end