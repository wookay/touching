//
//  DrawView.h
//  Captura
//
//  Created by luis on 15/10/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DrawView : UIView {
  NSMutableArray* lines;
  NSMutableArray* currentLine;
}


@property (nonatomic, retain) NSMutableArray* lines;
@property (nonatomic, retain) NSMutableArray* currentLine;

- (void) loadView ;
- (void) clear ;
- (void) undo ;

@end
