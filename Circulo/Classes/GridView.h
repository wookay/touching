//
//  GridView.h
//  Circulo
//
//  Created by luis on 10/10/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GridView : UIView {
  IBOutlet UISlider* angleSlider;
  IBOutlet UISlider* xSlider;
  IBOutlet UISlider* ySlider;
  IBOutlet UISlider* zSlider;  
}


@property (nonatomic, retain) IBOutlet UISlider* angleSlider;
@property (nonatomic, retain) IBOutlet UISlider* xSlider;
@property (nonatomic, retain) IBOutlet UISlider* ySlider;
@property (nonatomic, retain) IBOutlet UISlider* zSlider;

- (void) loadView ;
- (IBAction) changedSlider:(id)sender ;
  
@end
