//
//  BotonesAppDelegate.h
//  Botones
//
//  Created by wookay on 06/07/09.
//  Copyright masshacking 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BotonesViewController;

@interface BotonesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    BotonesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet BotonesViewController *viewController;

@end

