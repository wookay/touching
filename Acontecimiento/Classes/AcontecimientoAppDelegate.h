//
//  AcontecimientoAppDelegate.h
//  Acontecimiento
//
//  Created by luis on 22/09/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AcontecimientoView.h"

@interface AcontecimientoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    IBOutlet AcontecimientoView *acontecimientoView;  
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

