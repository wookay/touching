//
//  AnimacionAppDelegate.h
//  Animacion
//
//  Created by wookay on 06/07/09.
//  Copyright masshacking 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnimacionViewController;

@interface AnimacionAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AnimacionViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AnimacionViewController *viewController;

@end

