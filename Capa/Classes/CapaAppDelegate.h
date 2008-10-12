//
//  CapaAppDelegate.h
//  Capa
//
//  Created by luis on 12/10/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CapaView.h"

@interface CapaAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CapaView *capaView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CapaView *capaView;

@end

