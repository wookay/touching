//
//  BotonesViewController.h
//  Botones
//
//  Created by wookay on 06/07/09.
//  Copyright masshacking 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BotonesViewController : UIViewController {
  UIButton* singleButton;
  UIButton* multiButton;
}
@property (nonatomic, retain) IBOutlet UIButton* singleButton;
@property (nonatomic, retain) IBOutlet UIButton* multiButton;

-(IBAction) touchedButton:(UIButton*)sender ;

@end