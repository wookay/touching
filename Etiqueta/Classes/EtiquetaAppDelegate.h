//
//  EtiquetaAppDelegate.h
//  Etiqueta
//
//  Created by Woo-Kyoung Noh on 10/29/09.
//  Copyright Mintech 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EtiquetaAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
