//
//  AcontecimientoView.h
//  Acontecimiento
//
//  Created by luis on 22/09/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AcontecimientoView : UIView {
  IBOutlet UILabel *touchPointXLabel;
  IBOutlet UILabel *touchPointYLabel;
  IBOutlet UILabel *prevPointXLabel;
  IBOutlet UILabel *prevPointYLabel;  
  IBOutlet UILabel *tapCountLabel;  
  IBOutlet UILabel *timestampLabel;    
  IBOutlet UILabel *phaseLabel;    
  IBOutlet UITextView	*textView;
  NSString* prevAction;
}

- (void) debug:(id)action touches:(NSSet *)touches withEvent:(UIEvent *)event ;

@end
