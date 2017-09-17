//
//  MenuMainViewController.m
//  Runestone2017ObjC
//
//  Created by Ben Wheatley on 17/09/2017.
//  Copyright © 2017 Ben Wheatley. All rights reserved.
//

#import "MenuMainViewController.h"
#import "MenuInstructionsViewController.h"

@interface MenuMainViewController ()
@property (weak, nonatomic) IBOutlet UITableView *menu;

@end

@implementation MenuMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 8;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *reuseIdentifier = @[	@"New Game",
									@"Difficulty: ",
									@"Instructions",
									@"Sound: ",
									@"Music: ",
									@"Highscores",
									@"Achievements",
									@"Credits"			][indexPath.row];
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
	
	return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	void (^block)(void) = @[	 ^{	return;	},
								 ^{	[self nextDifficulty];	},
								 ^{	[self showInstructions];	},
								 ^{	[self toggleSound];	},
								 ^{	[self toggleMusic];	},
								 ^{	return;	},
								 ^{	return;	},
								 ^{	return;	},					][indexPath.row];
	block();
}

-(void) nextDifficulty {
#warning stub method
}

-(void) showInstructions {
	MenuInstructionsViewController * viewController = [[UIStoryboard storyboardWithName:@"InstructionsStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"MenuInstructionsViewController"];
	[self addChildViewController:viewController];
	viewController.view.alpha = 0;
	[self.view addSubview:viewController.view];
	[viewController didMoveToParentViewController:self];
	viewController.view.bounds = CGRectMake(0, 0, 320, 480);
	viewController.view.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
	
	[UIView animateWithDuration:0.5 animations:^{
		viewController.view.alpha = 1;
	}];
}

-(void) toggleSound {
#warning stub method
}

-(void) toggleMusic {
#warning stub method
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
