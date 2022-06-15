//
//  MenuInstructionsViewController.m
//  Runestone2017ObjC
//
//  Created by Ben Wheatley on 17/09/2017.
//  Copyright © 2017 Ben Wheatley. All rights reserved.
//

#import "MenuInstructionsViewController.h"

@interface MenuInstructionsViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *instructions;

@end

@implementation MenuInstructionsViewController

@synthesize instructions;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	instructions.contentSize = CGSizeMake(320, 1417); // TODO: do this from interface builder: https://stackoverflow.com/a/10360710/3632488
    [self configAnalytics];
    [_analytics scroll:instructions screenName:@"MenuInstructions"];
}

- (void)configAnalytics {
    _analytics = [MobioSDK shared];
}

- (IBAction)close:(id)sender {
	self.view.userInteractionEnabled = NO;
	[UIView animateWithDuration:0.5 animations:^{
		self.view.alpha = 0;
	} completion:^(BOOL finished) {
		[self willMoveToParentViewController:nil];
		[self.view removeFromSuperview];
		[self removeFromParentViewController];
	}];
}


@end
