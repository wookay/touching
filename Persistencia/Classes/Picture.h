//
//  Picture.h
//  Persistencia
//
//  Created by luis on 13/11/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQLitePersistentObject.h"

@interface Picture : SQLitePersistentObject  {
	NSDate		*date;
	UIImage		*image;
}

@property (nonatomic, retain) NSDate *date;
@property (nonatomic, retain) UIImage *image;

@end