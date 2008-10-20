//
//  CuboView.h
//  Cubo
//
//  Created by luis on 20/10/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrackBall.h"

@interface CuboView : UIView {
  CALayer *transformed;
  TrackBall *trackBall;
  
  IBOutlet UISlider* xSlider;
  IBOutlet UISlider* ySlider;
  IBOutlet UISlider* zSlider;
}

@property(nonatomic, retain) TrackBall *trackBall;
@property (nonatomic, retain) IBOutlet UISlider* xSlider;
@property (nonatomic, retain) IBOutlet UISlider* ySlider;
@property (nonatomic, retain) IBOutlet UISlider* zSlider;
- (IBAction) changedSlider:(id)sender ;
- (void) updateSliders ;

@end
