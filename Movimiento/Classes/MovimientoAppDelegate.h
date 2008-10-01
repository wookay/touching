//
//  MovimientoAppDelegate.h
//  Movimiento
//
//  Created by luis on 01/10/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovimientoView.h"

@interface MovimientoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    IBOutlet MovimientoView *view;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

