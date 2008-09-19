//
//  ColoresAppDelegate.h
//  Colores
//
//  Created by luis on 19/09/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColoresAppDelegate : NSObject <UIApplicationDelegate> {  
  UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (IBAction) changeColores:(id)sender;

@end

