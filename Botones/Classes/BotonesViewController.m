//
//  BotonesViewController.m
//  Botones
//
//  Created by wookay on 06/07/09.
//  Copyright masshacking 2009. All rights reserved.
//

#import "BotonesViewController.h"
#import "UIButton-Extensions.h"

@implementation BotonesViewController
@synthesize singleButton;
@synthesize multiButton;

- (void)viewDidLoad {
  [super viewDidLoad];    
  singleButton.title = @"Single Line Text";
  multiButton.title = [NSArray arrayWithObjects:@"Multi", @"Line", @"Text", nil];
}

-(IBAction) touchedButton:(UIButton*)sender {
  sender.alpha -= 0.1;
}

- (void)dealloc {
  [singleButton release];
  [multiButton release];
  [super dealloc];
}

@end