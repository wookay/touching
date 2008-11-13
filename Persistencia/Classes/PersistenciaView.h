//
//  PersistenciaView.h
//  Persistencia
//
//  Created by luis on 13/11/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PersistenciaView : UIView {
  UIImageView* imageView;
  UIBarButtonItem* loadButton;
  UIBarButtonItem* deleteAllButton;
}

@property (nonatomic, retain) IBOutlet UIImageView* imageView;
@property (nonatomic, retain) IBOutlet UIBarButtonItem* loadButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem* deleteAllButton;

- (IBAction) touchedCapture:(id)sender ;
- (IBAction) touchedSave:(id)sender ;
- (IBAction) touchedLoad:(id)sender ;
- (IBAction) touchedDeleteAll:(id)sender ;
- (void) updateToolbar ;
- (UIImage*) captureView:(UIView *)view ;

@end
