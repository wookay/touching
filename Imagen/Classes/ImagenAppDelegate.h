//
//  ImagenAppDelegate.h
//  Imagen
//
//  Created by luis on 04/10/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagenView.h"

@interface ImagenAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    IBOutlet ImagenView *view;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ImagenView *view;

@end

