//
//  ImagenView.h
//  Imagen
//
//  Created by luis on 04/10/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ImagenView : UIView <UIPickerViewDelegate> {
  IBOutlet UIImageView* convex;
  IBOutlet UIPickerView* contentModePicker;
}

@end
