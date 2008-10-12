//
//  CapaView.h
//  Capa
//
//  Created by luis on 12/10/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CapaView : UIView {
  UIView* targetView;
  IBOutlet UITextView* inspectView;
  IBOutlet UIButton* button;
  IBOutlet UISlider* slider;
  IBOutlet UIPageControl* pageControl;
  IBOutlet UISwitch* swit;
}

@property (nonatomic, retain) IBOutlet UITextView* inspectView;
@property (nonatomic, retain) IBOutlet UIButton* button;
@property (nonatomic, retain) IBOutlet UISlider* slider;
@property (nonatomic, retain) IBOutlet UIPageControl* pageControl;
@property (nonatomic, retain) IBOutlet UISwitch* swit;

- (void) loadView ;
- (IBAction) touchedButton:(id)sender ;
- (IBAction) touchedSwitch:(id)sender ;
- (IBAction) touchedSlider:(id)sender ;
- (IBAction) touchedPageControl:(id)sender ;
- (void) updateInspectView:(UIView*)target ;

@end
