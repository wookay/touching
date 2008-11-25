//
//  PersistenciaView.m
//  Persistencia
//
//  Created by luis on 13/11/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import "PersistenciaView.h"
#import <QuartzCore/QuartzCore.h>
#import "Picture.h"

@implementation PersistenciaView

@synthesize imageView;
@synthesize loadButton;
@synthesize deleteAllButton;



- (void)awakeFromNib {
  [self touchedLoad:self];
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
    [imageView release];
    [loadButton release];
    [deleteAllButton release];
    [super dealloc];
}

- (IBAction) touchedCapture:(id)sender {
  imageView.image = [self captureView:self];
}

- (IBAction) touchedSave:(id)sender {
  Picture* picture = [[Picture alloc] init];
  picture.date = [NSDate date];
  picture.image = [imageView.image retain];
	[picture save];
  [self updateToolbar];
  imageView.image = picture.image;
}

- (IBAction) touchedLoad:(id)sender {
  if ([Picture count] > 0) {
    Picture* picture = (Picture*)[Picture findFirstByCriteria:@"order by pk desc"];
    imageView.image = picture.image;
  }
  [self updateToolbar];
}

- (IBAction) touchedDeleteAll:(id)sender {
  for(id picture in [Picture allObjects]) {
    [picture deleteObject];
  }
  [self updateToolbar];
}

#define TAG_COUNTLABEL 21
- (void) updateToolbar {
  UILabel* countLabel = (UILabel*)[self viewWithTag:TAG_COUNTLABEL];
  countLabel.text = [NSString stringWithFormat:@"%d", [Picture count]];
  if ([Picture count]==0) {
    loadButton.enabled = false;
    deleteAllButton.enabled = false;    
  } else {
    loadButton.enabled = true;
    deleteAllButton.enabled = true;
  }
}

- (UIImage*) captureView:(UIView *)view {
  UIGraphicsBeginImageContext(view.frame.size);
	[view.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
  return newImage;
}

@end
