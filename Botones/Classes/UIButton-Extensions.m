//
//  UIButton-Extensions.m
//  Botones
//
//  Created by wookay on 06/07/09.
//  Copyright 2009 masshacking. All rights reserved.
//

#import "UIButton-Extensions.h"

@implementation UIButton (Extensions) 

-(NSString*) title {
  return self.currentTitle;
}

-(void) setTitle:(id)titleObject {
  if ([titleObject isKindOfClass:[NSString class]]) {
    [self setTitle:titleObject forState:UIControlStateNormal];
    [self setTitle:titleObject forState:UIControlStateHighlighted];
  } else if ([titleObject isKindOfClass:[NSArray class]]) {
    self.lineBreakMode = UILineBreakModeWordWrap;
    NSString* text = [titleObject componentsJoinedByString:@"\n"];
    [self setTitle:text forState:UIControlStateNormal];
    [self setTitle:text forState:UIControlStateHighlighted];
  }
}

@end