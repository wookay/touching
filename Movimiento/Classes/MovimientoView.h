//
//  MovimientoView.h
//  Movimiento
//
//  Created by luis on 01/10/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovimientoView : UIView {
  IBOutlet UILabel *centerXLabel;
  IBOutlet UILabel *centerYLabel;  
  IBOutlet UIImageView *birdView;
}

- (IBAction) touchedRotateButton:(id)sender ;

@end
