//
//  PersistenciaAppDelegate.h
//  Persistencia
//
//  Created by luis on 13/11/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersistenciaView.h"

@interface PersistenciaAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PersistenciaView *persistenciaView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PersistenciaView *persistenciaView;

@end

