//
//  CirculoAppDelegate.h
//  Circulo
//
//  Created by luis on 05/10/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridView.h"
#import "CirculoView.h"

@interface CirculoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    IBOutlet GridView *gridView;
    IBOutlet CirculoView *circuloView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GridView *gridView;
@property (nonatomic, retain) IBOutlet CirculoView *circuloView;

@end

