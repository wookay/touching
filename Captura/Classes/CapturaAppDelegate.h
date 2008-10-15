//
//  CapturaAppDelegate.h
//  Captura
//
//  Created by luis on 15/10/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawView.h"

@interface CapturaAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DrawView* drawView;
    UIImageView* imageView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DrawView* drawView;
@property (nonatomic, retain) IBOutlet UIImageView* imageView;

- (IBAction) touchedClear:(id)sender ;
- (IBAction) touchedUndo:(id)sender ;
- (IBAction) touchedCapture:(id)sender ;
- (UIImage*) captureView:(UIView *)view ;

@end

