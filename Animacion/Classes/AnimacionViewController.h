//
//  AnimacionViewController.h
//  Animacion
//
//  Created by wookay on 06/07/09.
//  Copyright masshacking 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpriteView.h"

@interface AnimacionViewController : UIViewController {
  SpriteView* spriteView;
  UIButton* groupButton;
}
@property (nonatomic, retain) IBOutlet SpriteView* spriteView;
@property (nonatomic, retain) IBOutlet UIButton* groupButton;

-(IBAction) touchedContentsAnimation:(id)sender ;
-(IBAction) touchedPositionAnimation:(id)sender ;
-(IBAction) touchedOpacityAnimation:(id)sender ;
-(IBAction) touchedTransformAnimation:(id)sender ;
-(IBAction) touchedGroupAnimation:(id)sender ;

@end

