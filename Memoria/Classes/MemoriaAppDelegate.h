//
//  MemoriaAppDelegate.h
//  Memoria
//
//  Created by luis on 04/12/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemoriaAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (IBAction) touchedLeakButton:(id)sender ;

@end

